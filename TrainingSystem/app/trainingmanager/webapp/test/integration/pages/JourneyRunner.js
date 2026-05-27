sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"trainingmanager/test/integration/pages/EnrollmentsList",
	"trainingmanager/test/integration/pages/EnrollmentsObjectPage"
], function (JourneyRunner, EnrollmentsList, EnrollmentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('trainingmanager') + '/test/flp.html#app-preview',
        pages: {
			onTheEnrollmentsList: EnrollmentsList,
			onTheEnrollmentsObjectPage: EnrollmentsObjectPage
        },
        async: true
    });

    return runner;
});

