const gulp = require('gulp'),
    livereload = require('gulp-livereload'),
    sass = require('gulp-sass'),
    browserify = require("browserify"),
    babelify = require("babelify"),
    source = require('vinyl-source-stream'),
    gutil = require('gulp-util'),
    cleanCSS = require('gulp-clean-css'),
    uglify = require('gulp-uglify'),
    streamify = require('gulp-streamify'),
    changed = require('gulp-changed'),
    fileinclude  = require('gulp-file-include');
const src = {
    js: 'src/Plugin/js/**/*.js',
    css: 'src/Plugin/css/*.scss',
    file: 'src/**/*.html',
    img: 'src/Image/**/*'
};


gulp.task('copyIndexJs', function () {
    browserify({debug: true})
        .transform("babelify", {presets: ["es2015"]})
        .require("src/Plugin/js/index.js", {entry: true})
        .bundle()
        .on('error',gutil.log)
        .pipe(source('index.js'))
        // .pipe(streamify(uglify()))
        .pipe(gulp.dest('../resources/static/Plugin/js/'))
        .pipe(livereload());
});

gulp.task('sass', function () {
    return gulp.src('src/Plugin/css/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(cleanCSS())
        .pipe(gulp.dest('../resources/static/Plugin/css'))
        .pipe(livereload());
});

gulp.task('copyRoot',function(){
    return gulp.src('src/Blog/root/*.html')
        .pipe(gulp.dest('../resources/static/Blog/root/'))
});

gulp.task('copyFile', function () {
    return gulp.src('src/**/*.html')
        .pipe(changed('../resources/static/'))
        .pipe(fileinclude({
            prefix: '@@',
            basepath: '@file'
        }))
        .pipe(gulp.dest('../resources/static/'))
        .pipe(livereload());
});

gulp.task('copyImage', function () {
    return gulp.src('src/Image/**/*')
        .pipe(gulp.dest('../resources/static/Image/'));
});

gulp.task('watch', ['copyIndexJs', 'sass','copyRoot', 'copyFile', 'copyImage'], function () {
    livereload.listen();
    gulp.watch(src.js, ['copyIndexJs']);
    gulp.watch(src.css, ['sass']);
    gulp.watch(src.file, ['copyFile']);
});

gulp.task('default', ['watch']);
gulp.task('copy', ['copyIndexJs', 'sass','copyRoot', 'copyFile', 'copyImage']);