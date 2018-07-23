var newman = require('newman');

newman.run({
        collection: 'collections/exampleAPI_test-collection.postman_collection',
        //reporters: ['cli', 'teamcity']
        reporters: ['cli', 'html'],
        reporter: {
            html: {
                'export': 'report.html' // this is optional
            }
        }
    },
    function(err, summary) {
        if (err) { throw err; }
        console.info('collection run complete!');
    }, process.exit);