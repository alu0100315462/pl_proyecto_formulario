var gulp    = require('gulp'),
    gutil   = require('gulp-util'),
    uglify  = require('gulp-uglify'),
    concat  = require('gulp-concat');
var karma = require('gulp-karma');

gulp.task('test', function() {
	return gulp.src([])
		.pipe(karma({
		configFile: 'karma.conf.js',
		action: 'run'
	}))
	.on('error', function(err) {
		throw err;
	});
});

gulp.task('default', function() {
	gulp.src([])
	.pipe(karma({
		configFile: 'karma.conf.js',
		action: 'watch'
	}));
});