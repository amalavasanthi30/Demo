// namespace service.srv;
using {schema as db} from '../db/schema';


service fioriApi {


    entity  student as projection on db.student actions
    {
        action updatename(id:String,name:String)
    }
    entity teacher as projection on db.teacher; 
      entity school as projection on db.school; 
    function getAge(id: String)  returns Integer;
    action   modifyAge(id: String, age: Integer) returns many String;
    action createstudent(id:String,
    name:String,
    age:Integer,
    criticality:Integer,tRef_id:String) returns many String;

}


