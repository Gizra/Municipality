// Generated on 2015-05-04 using generator-jekyllized 0.7.3
"use strict";

var gulp = require("gulp");

var gulpSequence = require('gulp-sequence');

// Loads the plugins without having to list all of them, but you need
// to call them as $.pluginname
var $ = require("gulp-load-plugins")();
// "del" is used to clean out directories and such
var del = require("del");

var elm = require('gulp-elm');

var fs = require('fs');

// merge is used to merge the output from two different streams into the same stream
var merge = require("merge-stream");
// Need a command for reloading webpages using BrowserSync

var plumber = require("gulp-plumber");


var wiredep = require('wiredep').stream;

gulp.task('elm-init', elm.init);
gulp.task('elm', ['elm-init'], function() {
  return gulp.src('src/elm/Main.elm')
    .pipe(plumber())
    .pipe(elm({
      'debug': false,
      'warn': false
    }))
    .on('error', function(err) {
      console.error(err.message);
    })
    .pipe(gulp.dest('../server/hedley/modules/custom/hedley_elm'));
});

// These tasks will look for files that change while serving and will auto-regenerate or
// reload the website accordingly. Update or add other files you need to be watched.
gulp.task("watch", function() {
  gulp.watch(["src/**/*.elm"], ["elm"]);
});

// Default task, run when just writing "gulp" in the terminal
gulp.task("default", ["watch"]);
