sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"employeelearningportal/test/integration/pages/EmployeesList",
	"employeelearningportal/test/integration/pages/EmployeesObjectPage",
	"employeelearningportal/test/integration/pages/EnrollmentsObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, EnrollmentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('employeelearningportal') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheEnrollmentsObjectPage: EnrollmentsObjectPage
        },
        async: true
    });

    return runner;
});

