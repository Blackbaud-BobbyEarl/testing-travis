/*global module */

module.exports = function (grunt) {
    'use strict';

    grunt.initConfig({
        bump: {
            options: {
                files: [
                    'bower.json',
                    'package.json'
                ],
                updateConfigs: [],
                commit: true,
                commitMessage: 'Release v%VERSION%',
                commitFiles: ['-a'],
                createTag: false,
                tagName: 'v%VERSION%',
                tagMessage: 'Version %VERSION%',
                push: true,
                pushTo: 'origin',
                gitDescribeOptions: '--tags --always --abbrev=1 --dirty=-d',
                globalReplace: false,
                prereleaseName: false,
                regExp: false
            }
        },
        exec: {
            test: {
                // The preceeding dot + space allows the script to run in the same shell.
                // We need this in order to set the BROWSER_STACK_BINARY_PID.
                cmd: '. ./scripts/child.sh'
            }
        }
    });

    grunt.registerTask('default', function () {
        var target = 'local',
            props = [
                'TRAVIS',
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
            console.log(prop + ': ' + process.env[prop] + ' (' + typeof process.env[prop] + ')');
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

    grunt.loadNpmTasks('grunt-bump');
    grunt.loadNpmTasks('grunt-exec');
};
