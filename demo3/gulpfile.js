'use strict';

const gulp      = require('gulp')
const http      = require('http')
const st        = require('st')
const exec      = require('child_process').exec
const gutil     = require('gulp-util')
const clear     = require('clear')
const port      = 4000

let cmd = 'elm make ./src/Main.elm --output ./assets/javascript/bundle.js'
let counter   = 0

clear()

gulp.task('default', ['server', 'watch', 'elm'])

gulp.task('watch', function(cb) {
  gulp.watch('**/*.elm', ['elm'])
})

gulp.task('server', function(done) {
  gutil.log(gutil.colors.blue(`Starting server at http://localhost:${port}`))
  http.createServer(
    st({
      path: __dirname,
      cache: false
    })
).listen(port, done)
})

gulp.task('elm', function(cb) {
  if (counter > 0){
    clear()
  }
  exec(cmd, function(err, stdout, stderr) {
    if (err){
      gutil.log(gutil.colors.red('elm make: '),gutil.colors.red(stderr))
    }
    else {
      gutil.log(gutil.colors.green('elm make: '), gutil.colors.green(stdout))
    }
    cb()
  })

  counter++
})
