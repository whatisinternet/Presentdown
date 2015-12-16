'use strict';

var gulp = require('gulp');
var exec = require('child_process').exec;
var watch = require('gulp-watch');
var batch = require('gulp-batch');
var filenames = require('gulp-filenames');
var rename = require('gulp-rename');
var replace = require('gulp-replace');
var runSequence = require('run-sequence');

var fs = require('fs');

gulp.task('compile', function() {
  exec('npm install && npm run deploy', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
});

gulp.task('run', function() {
  exec('npm run app', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
});

gulp.task('watch', function () {
    watch('**/*.coffee', batch(function (events, done) {
        gulp.start('compile', done);
    }));
    watch('**/*.sass', batch(function (events, done) {
        gulp.start('compile', done);
    }));
});


gulp.task('build-slides', function() {

  var files = gulp.src('./slides/*.md')
    .pipe(filenames('markdown'))
    .pipe(gulp.dest('./assets/scripts/raw_slides'))
    .on('end', function() {

    filenames.get('markdown').map(function(file) {

      var fileParts = file.split('.');
      var slideName = [fileParts[0], fileParts[1]].join('-')
      var internalSlideName = [fileParts[0], fileParts[1]].join('.')

      gulp.src('./assets/scripts/components/demo/demo.coffee')
        .pipe(rename( slideName + '.coffee'))
        .pipe(replace('demo', internalSlideName))
        .pipe(gulp.dest('./assets/scripts/components/slides'))


    });
  });
});

gulp.task('build-routes', function() {

  fs.readdir('./slides/', function(err, items) {
    items.map(function(file){
      var fileParts = file.split('.');
      var slideName = [fileParts[0], fileParts[1]].join('-')
      var internalSlideName = [fileParts[0], fileParts[1]].join('.')
      var route = ""
      if (fileParts[0] === "0") {
        route = "  '/': '" + fileParts[1]  + "'\n"
      } else {
        route = "  '/" + fileParts[0] + "': '" + fileParts[1]  + "'\n"
      }
      fs.appendFile('./assets/config/routes.coffee', route, function(err) {
        if (err)
          console.error(err);
        console.log('Created Route!');
      });
    });
  });
});

gulp.task('build-methods', function() {
  fs.readdir('./slides/', function(err, items) {
    items.map(function(file){
      var fileParts = file.split('.');
      var slideName = [fileParts[0], fileParts[1]].join('-')
      var internalSlideName = [fileParts[0], fileParts[1]].join('.')
      var fn = "  " + fileParts[1]  + ": ->\n" +  "    require('./slides/" + slideName  + "') {}\n\n"
      fs.appendFile('./assets/scripts/components/app.coffee', fn , function(err) {
        if (err)
          console.error(err);
        console.log('Created mini router method!');
      });
    });
  });
});

gulp.task('slides', function(){
  runSequence('build-methods', 'build-routes', 'build-slides')});
