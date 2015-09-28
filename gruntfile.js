/*global module */

module.exports = function (grunt) {
  'use strict';
  
  grunt.registerTask('default', function () {
    var target = 'local',
      props = [
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
      
    console.log('RUNNING TEST: ' + process.env.TEST_NAME);
    
    props.forEach(function (prop) {
      console.log(prop + ': ' + process.env[prop]);
    });

    if (process.env.TRAVIS) {
        if (process.env.TRAVIS_SECURE_ENV_VARS === 'true') {
            if (process.env.TRAVIS_PULL_REQUEST === 'false') {
                target = 'travis-push';
            } else {
                target = 'travis-pr-branch';
            }
        } else {
            target = 'travis-pr-fork';
        }
    }
    
    console.log('TARGET: ' + target);

  });
};
