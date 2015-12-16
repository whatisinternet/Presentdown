'use strict';

var gulp = require('gulp');
var exec = require('child_process').exec;
var watch = require('gulp-watch');
var batch = require('gulp-batch');
var filenames = require('gulp-filenames');
var rename = require('gulp-rename');
var replace = require('gulp-replace');
var insert = require('gulp-insert');
var runSequence = require('run-sequence');

gulp.task('compile', ['build-slides'], function() {
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

  var files = gulp.src('./slides/*.md')
    .pipe(filenames('markdown'))
    .pipe(gulp.dest('./assets/scripts/raw_slides'))
    .on('end', function() {

    filenames.get('markdown').map(function(file) {

      var fileParts = file.split('.');
      var slideName = [fileParts[0], fileParts[1]].join('-')
      var internalSlideName = [fileParts[0], fileParts[1]].join('.')

      gulp.src('./assets/config/routes.coffee')
        .pipe(insert.append("  '/" + fileParts[0] + "': '" + fileParts[1]  + "'\n"))
        .pipe(gulp.dest('./assets/config'))

    });
  });
});

gulp.task('build-methods', function() {

  var files = gulp.src('./slides/*.md')
    .pipe(filenames('markdown'))
    .pipe(gulp.dest('./assets/scripts/raw_slides'))
    .on('end', function() {

    filenames.get('markdown').map(function(file) {

      var fileParts = file.split('.');
      var slideName = [fileParts[0], fileParts[1]].join('-')
      var internalSlideName = [fileParts[0], fileParts[1]].join('.')

      gulp.src('./assets/scripts/components/app.coffee')
        .pipe(insert.append("  " + fileParts[1]  + ": ->\n"))
        .pipe(insert.append("    require('./slides/" + slideName  + "') {}\n\n"))
        .pipe(gulp.dest('./assets/scripts/components'))

    });
  });
});

gulp.task('slides', function(){
  runSequence('build-methods', 'build-routes', 'build-slides')});
