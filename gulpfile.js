'use strict';

var gulp = require('gulp');
var exec = require('child_process').exec;
var watch = require('gulp-watch');
var batch = require('gulp-batch');
var filenames = require('gulp-filenames');
var rename = require('gulp-rename');
var replace = require('gulp-replace');
var runSequence = require('run-sequence');
var del = require('del');
var fs = require('fs');

gulp.task('clean', function() {
  return del([
    'dist/*.js',
    'dist/images/*',
    'assets/config/*',
    'assets/config',
    'assets/styles/base-colours.sass',
    'assets/scripts/components/app.coffee',
    'assets/scripts/components/slides/*',
    'assets/scripts/components/slides',
    'assets/scripts/raw_slides/*',
    'assets/scripts/raw_slides',
  ]);
});

gulp.task('clean-gh-pages', function() {
  return del([
    'assets/*',
    'assets',
    'config/*',
    'config',
    'slides/*',
    'slides',
    'templates',
    'templates/*',
    'gulpfile.js',
    'index.html',
    'package.json',
    'README.md',
  ]);
});

gulp.task('compile-viewer', ['build'], function() {
  exec('npm run deploy-viewer', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
});

gulp.task('compile-viewer', ['build'], function() {
  exec('npm run deploy-viewer', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
});

gulp.task('compile', ['build'], function() {
  exec('npm run deploy', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
});

gulp.task('run', ['build'], function() {
  exec('npm run app', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
});

gulp.task('build', ['clean', 'prepare'], function(){
  setTimeout(function() {
    runSequence('build-slides', 'build-colours', 'build-methods', 'build-routes')
  }, 1000)
});

gulp.task('prepare', function(){
  runSequence('copy-routes-template', 'copy-app-template', 'copy-config')});

gulp.task('build-slides', function() {

  var files = gulp.src('./slides/*.md')
    .pipe(filenames('markdown'))
    .pipe(gulp.dest('./assets/scripts/raw_slides'))
    .on('end', function() {

    filenames.get('markdown').map(function(file) {

      var fileParts = file.split('.');
      var slideName = [fileParts[0], fileParts[1]].join('-')
      var internalSlideName = [fileParts[0], fileParts[1]].join('.')

      gulp.src('./templates/scripts/demo.coffee')
        .pipe(rename( slideName + '.coffee'))
        .pipe(replace('demo', internalSlideName))
        .pipe(gulp.dest('./assets/scripts/components/slides'))

    });
  });
});

gulp.task('build-colours', function() {

  fs.readdir('./slides/', function(err, items) {
    items.map(function(file){
      var fileParts = file.split('.');
      if (fileParts[1] == 'json') {
        var colour = require('./slides/config.json')['highlightColour']
        var highlightColour = "$highlight-colour: " + colour
        fs.appendFile('./assets/styles/base-colours.sass', highlightColour, function(err) {
          if (err)
            console.error(err);
        });
      }
    });
  });
});


gulp.task('build-routes', function() {

  fs.readdir('./slides/', function(err, items) {
    items.map(function(file){
      var fileParts = file.split('.');
      if (fileParts[2] == 'md') {
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
        });
      }
    });
  });
});

gulp.task('build-methods', function() {

  fs.readdir('./slides/', function(err, items) {
    items.map(function(file){
      var fileParts = file.split('.');
      if (fileParts[2] == 'md') {
        var slideName = [fileParts[0], fileParts[1]].join('-')
        var internalSlideName = [fileParts[0], fileParts[1]].join('.')
        var fn = ""
        if (fileParts[0] === "0") {
          fn = "  notFound: ->\n" +  "    navigate('/', true)\n    require('./slides/" + slideName  + "') {settings: @props.settings, handleSettingsChange: @props.handleSettingsChange}\n\n"
          fn += "  " + fileParts[1]  + ": ->\n" +  "    require('./slides/" + slideName  + "') {settings: @props.settings, handleSettingsChange: @props.handleSettingsChange}\n\n"
        } else {
          fn = "  " + fileParts[1]  + ": ->\n" +  "    require('./slides/" + slideName  + "') {settings: @props.settings, handleSettingsChange: @props.handleSettingsChange}\n\n"
        }
        fs.appendFile('./assets/scripts/components/app.coffee', fn , function(err) {
          if (err)
            console.error(err);
        });
      }
    });
  });
});

gulp.task('copy-config', function() {
  var files = gulp.src('./slides/config.json')
    .pipe(gulp.dest('./assets/config'))
});

gulp.task('copy-routes-template', function() {
  var files = gulp.src('./templates/config/routes.coffee')
    .pipe(gulp.dest('./assets/config'))
});

gulp.task('copy-app-template', function() {
  var files = gulp.src('./templates/scripts/app.coffee')
    .pipe(gulp.dest('./assets/scripts/components'))
});

