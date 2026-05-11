const cds=require('@sap/cds');
const { SELECT, UPDATE } = require('@sap/cds/lib/ql/cds-ql');
module.exports=cds.service.impl(function()
{
     const{student}=this.entities;
     this.on('getAge',async(req)=>{
        const{id}=req.data;
        console.log(id)
        const result= await SELECT.from(student).where({id})
        console.log(result)
         const age=result[0].age;
        console.log(age)
           const  res=age+12;
           console.log(res)
           return  res;
     })
    this.on('modifyAge', async (req) => {

    const { id, age } = req.data;

    if (!id) return req.error(400, 'ID is required');

    await UPDATE(student).set({ age }).where({ id });

    const [result] = await SELECT.from(student).where({ id });

    return result;
});


this.before('CREATE', student, async (req) => {
        console.log("Before Handler");
       
const{age}=req.data;
 
        if(age <18) {
            req.data.criticality = 1;
        }
        else if (age > 18) {
            req.data.criticality = 3;
        }
 
    })
 


   this.on('createstudent',async(req)=>{
      
      const data=await INSERT.into(student).entries(req.data);
      console.log(data)
      return data;
    })

   this.on('updatename',student,async(req)=>{
       const{id}=req.params[0];
       const{name}=req.data;
    if (!id) return req.error(400, 'ID is required');

    await UPDATE(student).set({ name }).where({ id });

    const result = await SELECT.from(student).where({ id });

    return result;
   })
})