using FeedbackService as service from '../../srv/service';
annotate service.Employees with {
    Image @UI.IsImageURL;

};

annotate service.Employees with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Employeeid',
                Value: Eid,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Empno',
                Value: Empno,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Name',
                Value: Name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Email',
                Value: Email,
            },
             {
                $Type: 'UI.DataField',
                Label: 'Pincode',
                Value: Pincode,
            },
           {
    $Type: 'UI.DataFieldWithUrl',
    Label: 'Map',
    Value: 'Open Google Map',
    Url: Mapurl
      },
            {
                $Type: 'UI.DataField',
                Label: 'Phone',
                Value: Phone,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Joiningdate',
                Value: Joiningdate,
            },
        ],
    },

    UI.SelectionFields           : [
        Empno,
        Name,
    ],
    UI.HeaderInfo                : {

        Title   : {Value: Name},
        ImageUrl: Image,
    },

    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet3',
            Label : 'Enrollment Information',
            Target: 'enrollmentRef/@UI.LineItem#Enrollments'
        },
    ],

    UI.LineItem                  : [
        {
            $Type             : 'UI.DataField',
            Label             : 'Empno',
            Value             : Empno,
            @HTML5.CssDefaults: {width: '90px'}
        },
        {
            $Type             : 'UI.DataField',
            Label             : 'Name',
            Value             : Name,
            @HTML5.CssDefaults: {width: '90px'}
        },
        {
            $Type             : 'UI.DataField',
            Label             : 'Email',
            Value             : Email,
            @HTML5.CssDefaults: {width: '150px'}
        },
        {
            $Type             : 'UI.DataField',
            Label             : 'Image',
            Value             : Image,
            @HTML5.CssDefaults: {width: '100px'}

        },
        {
            $Type             : 'UI.DataField',
            Label             : 'Phone',
            Value             : Phone,
            @HTML5.CssDefaults: {width: '100px'}
        },
        {
            $Type             : 'UI.DataField',
            Label             : 'Joiningdate',
            Value             : Joiningdate,
            @HTML5.CssDefaults: {width: '100px'}
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'FeedbackService.EntityContainer/enroll',
            Label : 'enroll',

        },
         {
            $Type : 'UI.DataFieldForAction',
            Action: 'FeedbackService.EntityContainer/GetLocationbyPincode',
            Label : 'GetLocation',
            Inline:true,
            Criticality:#Negative

        },
    ],

);


annotate service.Enrollments with @(
    UI.FieldGroup #CourseDetails: {

        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Enrollment Id',
                Value: Enid,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Course Code',
                Value: courseRef.Coursecode,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Title',
                Value: courseRef.Title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Description',
                Value: courseRef.Description,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Category',
                Value: courseRef.Category,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Duration Hour',
                Value: courseRef.Durationhour,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Mandatory',
                Value: courseRef.Ismandatory,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Validity Month',
                Value: courseRef.Validitymonth,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Max Enrollment',
                Value: courseRef.Maxenrollment,
            },
        ],
    },
      UI.HeaderInfo                : {
        Title   : {Value: employeeRef.Name},
        ImageUrl: employeeRef.Image,
    },

    UI.Facets                   : [

         {
            $Type : 'UI.ReferenceFacet',
            ID    : 'FeedbackFacet',
            Label : 'SubmitFeedback',
            Target: 'feedbackRef/@UI.FieldGroup#GeneratedGroup5'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'CourseDetailsFacet',
            Label : 'Course Details',
            Target: '@UI.FieldGroup#CourseDetails'
        },
       
    ],
    UI.LineItem #Enrollments    : [
        {
            $Type             : 'UI.DataField',
            Label             : 'Enrollmentdate',
            Value             : Enrollmentdate,
            @HTML5.CssDefaults: {width: '100px'}
        },
        {
            $Type             : 'UI.DataField',
            Label             : 'CompletionDate',
            Value             : Completiondate,
            @HTML5.CssDefaults: {width: '100px'}
        },
          {
            $Type             : 'UI.DataField',
            Label             : ' Certificate ExpiryDate',
            Value             : ExpiryDate,
            Criticality       : expiryCriticality,
            @HTML5.CssDefaults: {width: '150px'}
        },
        {
            $Type             : 'UI.DataField',
            Label             : 'Score',
            Value             : Score,
            @HTML5.CssDefaults: {width: '100px'}
        },
        {
            $Type             : 'UI.DataField',
            Label             : 'Status',
            Value             : Status,
            @HTML5.CssDefaults: {width: '100px'}
        },
    ],
);

annotate service.Feedback with @(UI.FieldGroup #GeneratedGroup5: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type             : 'UI.DataFieldForAnnotation',
            Label             : 'Rating',
            Target            : '@UI.DataPoint#Ratings',
            Value             : Rating,
            @HTML5.CssDefaults: {width: '150px'}

        },
        {
            $Type: 'UI.DataField',
            Label: 'Comment',
            Value: Comments,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Submitted At',
            Value: SubmittedAt,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Submitfeedback',
            Action: 'FeedbackService.EntityContainer/submitFeedback',
            Criticality:#Negative
        },

    ],

},
  //Rating
    UI.DataPoint #Ratings         : {
        Value        : Rating,
        Visualization: #Rating
    },

);
