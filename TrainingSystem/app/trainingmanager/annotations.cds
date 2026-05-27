using TrainingService as service from '../../srv/service';
annotate service.Enrollments with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Enrollmentdate',
                Value : Enrollmentdate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Enrollmentdate',
                Value : TotalEnrollments,
            },
             {
                $Type : 'UI.DataField',
                Label : 'Courseid',
                Value : courseRef_Cid,
            },
             {
                $Type : 'UI.DataField',
                Label : 'Employeeid',
                Value : employeeRef_Eid,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Completiondate',
                Value : Completiondate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Score',
                Value : Score,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : Status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Result',
                Value : Result,
                Criticality:criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CertificateNo',
                Value : CertificateNo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ExpiryDate',
                Value : ExpiryDate,
            },
           
        ],
    },

// UI.HeaderFacets : [
//     {
//         $Type  : 'UI.ReferenceFacet',
//         Label  : 'Total Enrollments',
//         Target : '@UI.DataPoint#TotalEnrollmentKPI'
//     },
//     {
//         $Type  : 'UI.ReferenceFacet',
//         Label  : 'Certified Count',
//         Target : '@UI.DataPoint#CertifiedKPI'
//     }
// ],
// UI.FieldGroup #KPIGroup : {
//     Data : [
//         {
//             $Type : 'UI.Da',
//             Value : TotalEnrollments,
//             Label : 'Total Enrollments'
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : Certifiedcount,
//             Label : 'Certified Count'
//         }
//     ]
// },



UI.DataPoint #TotalEnrollmentKPI : {
    Title : 'Total Enrollments',
    Value : TotalEnrollments,
    Criticality:#Negative
},
UI.DataPoint #CertifiedKPI : {
    Title : 'Certified Count',
    Value : Certifiedcount,
     Criticality:#Negative
},

UI.HeaderFacets : [
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Total Enrollments',
        Target : '@UI.DataPoint#TotalEnrollmentKPI'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Certified Count',
        Target : '@UI.DataPoint#CertifiedKPI'
    }
],

 UI.HeaderInfo                : {

        Title   : {Value: employeeRef.Name},
        ImageUrl: employeeRef.Image,
    },
  
   UI.SelectionFields            : [
       Enid,
       employeeRef.departmentRef_Did
    ],
  UI.FieldGroup #CourseDetails : {
        $Type : 'UI.FieldGroupType',
        Data  : [
             {
                $Type : 'UI.DataField',
                Label : 'Course Id',
                Value : courseRef.Cid,
            },
 
            {
                $Type : 'UI.DataField',
                Label : 'Course Code',
                Value : courseRef.Coursecode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : courseRef.Title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : courseRef.Description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Category',
                Value : courseRef.Category,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Duration Hour',
                Value : courseRef.Durationhour,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Mandatory',
                Value : courseRef.Ismandatory,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Validity Month',
                Value : courseRef.Validitymonth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Max Enrollment',
                Value : courseRef.Maxenrollment,
            },

        ],
    },
      

       UI.FieldGroup #FeedbackDetails : {
        $Type : 'UI.FieldGroupType',
        Data  : [
             {
                $Type : 'UI.DataField',
                Label : 'Feedback Id',
                Value : feedbackRef.Fid,
            },
 
          {
                $Type : 'UI.DataField',
                Label : 'Comments',
                Value : feedbackRef.Comments,
            },
          {
                $Type : 'UI.DataFieldForAnnotation',
                Label : 'Rating',
                Value : feedbackRef.Rating,
                Target: '@UI.DataPoint#Ratings',
            },
            
            {
                $Type : 'UI.DataField',
                Label : 'SubmittedAt',
                Value : feedbackRef.SubmittedAt,
            },
        ],
    },
     UI.FieldGroup #EmployeeDetails : {
        $Type : 'UI.FieldGroupType',
        Data  : [
             {
                $Type : 'UI.DataField',
                Label : 'EmpoyeeId',
                Value : employeeRef.Eid,
            },
 
            {
                $Type : 'UI.DataField',
                Label : 'Employeename',
                Value : employeeRef.Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Employeeimage',
                Value : employeeRef.Image,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : employeeRef.Email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Phone',
                Value : employeeRef.Phone,
            },
           
        ],
    },
 

 
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Enrollment Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
         {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : 'Course Details',
            Target : '@UI.FieldGroup#CourseDetails',
        },
         {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet3',
            Label : 'Feedback Details',
            Target : '@UI.FieldGroup#FeedbackDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet4',
            Label : 'Employee Details',
            Target : '@UI.FieldGroup#EmployeeDetails',
        },
        
    ],
 

    //Rating
    UI.DataPoint #Ratings         : {
        Value        : feedbackRef.Rating,
        Visualization: #Rating,
           @HTML5.CssDefaults: {width: '150px'}
    },

    UI.LineItem : [

         {
            $Type : 'UI.DataField',
            Label : 'Employeename',
            Value : employeeRef.Name,
             @HTML5.CssDefaults: {width: '100px'}
        },
         {
            $Type : 'UI.DataField',
            Label : 'Coursename',
            Value : courseRef.Title,
             @HTML5.CssDefaults: {width: '150px'}
        },
        // {
        //     $Type : 'UI.DataField',
        //     Label : 'Enrollmentdate',
        //     Value : Enrollmentdate,
        //      @HTML5.CssDefaults: {width: '110px'}
        // },
        // {
        //     $Type : 'UI.DataField',
        //     Label : 'Completiondate',
        //     Value : Completiondate,
        //      @HTML5.CssDefaults: {width: '110px'}
        // },
         {
            $Type : 'UI.DataFieldForAnnotation',
            Label : 'Rating',
            Target : '@UI.DataPoint#Ratings',
            Value : feedbackRef.Rating,
               @HTML5.CssDefaults: {width: '150px'}

        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : Status,
             @HTML5.CssDefaults: {width: '90px'}
        },
           {
            $Type : 'UI.DataField',
            Label : 'Result',
            Value : Result,
            Criticality:criticality,
             @HTML5.CssDefaults: {width: '90px'}
        },
        {
    $Type : 'UI.DataField',
    Label : 'Department',
    Value : employeeRef.departmentRef.Deptname,
     @HTML5.CssDefaults: {width: '150px'}
    },
          {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.EntityContainer/getExpiringCertificate',
            Label   : 'getExpiringCertificate',
        
        },
         {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.startTraining',
             Inline:true,
             Criticality:#Negative,
            Label   : 'startTraining',

        },
     {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.EntityContainer/createAssessment',
            Label   : 'createAssessment',
        },
 
     {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.findscore',
            Inline:true,
           Criticality:#Negative,
            Label   : 'findscore',
        },
        {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.complete',
            Inline:true,
               Criticality:#Negative,
            Label   : 'complete',
        },

         {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.EntityContainer/createCourse',
            Label   : 'createCourse',
         },
           {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.EntityContainer/deleteCourse',
            Label   : 'deleteeCourse',
         },
         {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.EntityContainer/updateCourse',
            Label   : 'updateCourse',
         },
          {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.EntityContainer/deleteCourse',
            Label   : 'deleteCourse',
         },   
          {
            $Type   : 'UI.DataFieldForAction',
            Action  : 'TrainingService.EntityContainer/readCourse',
            Label   : 'readCourse',
         },                 
    ],

);
annotate service.Employees with {
    departmentRef @(
        Common.Text       : DeptName,
        UI.TextArrangement: #TextOnly,
        Common.ValueList  : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Departments',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Did,
                    ValueListProperty: 'Did'
                },
                {
                    $Type            : Common.ValueListParameterDisplayOnly,
                    ValueListProperty: 'Deptname'
                }
            ]
        },
          Common.ValueListWithFixedValues: true,
    )
}

//image
annotate service.Employees with {
    Image @UI.IsImageURL : true;
}

annotate service.Enrollments with {
    employeeRef @Common.ValueList : {
        Type : 'Common.ValueListType',
        CollectionPath : 'Employees',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : employeeRef_Eid,
                ValueListProperty : 'Eid',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Empno',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Phone',
            },
        ],
    }
};

//autorefresh(bounded)
annotate service.Enrollments with actions {
    complete @Common.SideEffects: {
        TargetProperties: ['Status', 'Result']
    };
};


 
annotate service.Enrollments with {
    courseRef @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Courses',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : courseRef_Cid,
                ValueListProperty : 'Cid',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Coursecode',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Title',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Category',
            },
        ],
    }
};






