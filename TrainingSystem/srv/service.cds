using {schema as db} from '../db/schema';

service TrainingService @(restrict: [
    {
        grant: [
            'READ',
            'CREATE'
        ],
        to   : 'Employee'
    },
    {
        grant: [
            'CREATE',
            'READ',
            'UPDATE'
        ],
        to   : 'Manager'
    },
    {
        grant: ['*'],
        to   : 'Administrator'
    }
]) {
    entity Employees       as projection on db.Employees;
    entity Courses         as projection on db.Courses;
    entity Assessments     as projection on db.Assessments;
    entity Departments     as projection on db.Departments;
    entity TrainingManager as projection on db.TrainingManager;
    entity Roles           as projection on db.Roles;

    @odata.draft.enabled
    @cds.redirection.target
    entity Enrollments @(restrict: [
        {
            grant: [
                'READ',
                'CREATE'
            ],
            to   : 'Employee'
        },
        {
            grant: [
                'CREATE',
                'READ',
                'UPDATE'
            ],
            to   : 'Manager'
        },
        {
            grant: ['*'],
            to   : 'Administrator'
        }
    ])                     as projection on db.Enrollments
        actions {
            action findscore();
            action startTraining();
            action complete(Score: Integer) returns String;

        };


    //action complete(Enid:UUID,Score:Integer);
    action   revoke(Enid: UUID, Reason: String);
    function getExpiringCertificate(daysAhead: Integer)                                                                                           returns array of Enrollments;
    action   createAssessment(Assessmentname: String, Totalmark: Integer, MarksObtained: Integer, Passingmark: Integer, enrollmentRef_Enid: UUID) returns Assessments;
    action   createCourse(Coursecode: String, Title: String, Description: String, Category: String, Durationhour: Integer, Ismandatory: Boolean, Validitymonth: Integer, Maxenrollment: Integer);
    action   updateCourse(Cid: UUID, Coursecode: String, Title: String, Description: String, Category: String, Durationhour: Integer, Ismandatory: Boolean, Validitymonth: Integer, Maxenrollment: Integer);
    action   deleteCourse(Cid: UUID);
    action   readCourse(Cid: UUID);

    //Enrollment view
// entity EnrollmentKPI as select from db.Enrollments {
    

//   key  cast(count(Enid) as Integer) as TotalEnrollments
// };



 }


service FeedbackService @(impl: './feedbackservice.js') {
    entity Courses     as projection on db.Courses;
    entity Feedback    as projection on db.Feedback;
    entity Employees   as projection on db.Employees;
    entity Enrollments as projection on db.Enrollments;
    action submitFeedback(Enid: UUID, Rating: Integer, Comments: String)
    action enroll(Eid: UUID, Cid: UUID)                                                                                                           returns String;
type Location {
    place     : String;
    latitude  : String;
    longitude : String;
}

action  GetLocationbyPincode(Pincode : String)
    returns many Location;

}
