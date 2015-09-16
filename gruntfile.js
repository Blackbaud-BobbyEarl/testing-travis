/*global module */

module.exports = function (grunt) {
  'use strict';
  
  grunt.registerTask('default', function () {
    var props = [
      'TRAVIS_REPO_SLUG',
      'TRAVIS_SECURE_ENV_VARS',
      'TRAVIS_BRANCH',
      'TRAVIS_PULL_REQUEST',
      'TRAVIS_OS_NAME',
      'TRAVIS_TAG',
      'TRAVIS_JOB_NUMBER',
      'TRAVIS_BUILD_NUMBER',
      'TRAVIS_COMMIT'
    ];
    
    props.forEach(function (prop) {
      console.log(prop + ': ' + process.env[prop]);
    });
  });
};
