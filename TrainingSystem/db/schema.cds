namespace schema;
using {managed} from '@sap/cds/common';
entity Employees {
    key Eid           : UUID;
    Empno             : String;
    Name              : String;
    Email             : String;
    Phone             : String;
    Joiningdate       : Date;
    Image             :String;
    Pincode:String;
    Mapurl:String;
    departmentRef     : Association to Departments;
    roleRef            : Association to Roles;
    enrollmentRef      : Association to many Enrollments on enrollmentRef.employeeRef = $self;
    notificationRef     : Association to many Notifications on notificationRef.employeeRef = $self;
}
entity Roles {

    key Rid       : UUID;
    Rolename      : String;
    Description   : String;
    employeeRef   : Association to many Employees on employeeRef.roleRef = $self;
}
entity Departments {

    key Did       : UUID;
    Deptcode      : String;
    Deptname      : String;
    employeeRef    : Association to many Employees  on employeeRef.departmentRef = $self;
}

entity TrainingManager {
    key Tid            : UUID;
    Trainername       : String;
    Email             : String;
    Phone             : String;
    Experienceyear    : Integer;
    courseRef         : Association to many Courses on courseRef.trainingmanagerRef = $self;
}
entity Courses {

    key Cid            : UUID;
    Coursecode        : String;
    Title             : String;
    Description       : String;
    @assert.range:true
    Category  : String enum {
    Technical;
    Functional;
    Compliance;
    Security;
    Leadership;
    SoftSkills;
};
    Durationhour     : Integer;
    Ismandatory      : Boolean;
    Validitymonth    : Integer;
    Maxenrollment    : Integer;
    trainingmanagerRef : Association to TrainingManager;
    enrollmentRef     : Association to many Enrollments on enrollmentRef.courseRef = $self;
}

// @odata.draft.enabled
entity Enrollments:managed {
    key Enid            : UUID;
    Enrollmentdate    : Date;
    Completiondate    : Date;
    Score             : Integer;
    @assert.range:true
    Status : String enum {
    Enrolled;
    InProgress;
    Completed;
    Certified;
    Failed;
    Revoked;
};
    Reason:String;
    @assert.range:true
    Result : String enum {
    Pass;
    Fail;
};
    CertificateNo     : String;
    ExpiryDate        : Date;
    expiryCriticality : Integer;
    criticality:Integer;
    virtual TotalEnrollments:Integer;
    virtual Certifiedcount:Integer;
    virtual Rate:Integer;
    employeeRef       : Association to Employees;
    courseRef         : Association to Courses;
    feedbackRef       : Composition of  Feedback on feedbackRef.enrollmentRef = $self;
    assessmentRef      : Association to many Assessments on assessmentRef.enrollmentRef=$self;
}

entity Assessments{
    key  Aid          : UUID;
    Assessmentname    : String;
    Totalmark         : Integer;
    MarksObtained       :Integer;
    Passingmark       : Integer;
    enrollmentRef     : Association to Enrollments;
}


entity Notifications {
    key Nid           : UUID;
    Message           : String;
    Sentdate          : Timestamp;
    Status            : String;
    employeeRef       : Association to Employees;
}

entity Feedback {
    key  Fid          : UUID;
    Rating           : Integer   @assert.range: [1, 5];
    Comments          : String;
    SubmittedAt       : Timestamp;
    enrollmentRef       : Association to Enrollments;
}