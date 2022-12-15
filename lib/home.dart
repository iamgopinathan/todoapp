import 'package:flutter/material.dart';

import 'package:flutter_application_1/home.dart';
import 'package:intl/intl.dart';

import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/todoitem.dart';


class home extends StatefulWidget {

  
  

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final todoslist = TODO.todolist();

  List<TODO> _foundtodo =[];

  final _todocontroller = TextEditingController();

  @override
  void initState() {
    _foundtodo = todoslist;
    super.initState();
  }


   TextEditingController _date = TextEditingController();


  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdbgcolor,
      appBar: AppBar(
        
        backgroundColor: tdbgcolor,
        title: Text('TO DO APP',style: TextStyle(fontWeight: FontWeight.bold),),


      ),

      body:Stack(

        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [

                searchbox(),

                Expanded(
                  child: ListView(
                    
                    
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
           Text('MY NOTES',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),

                            

           Text(DateTime.now().toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.teal),),
         

         
                            


                            
                           Container(
                              height: 30,
                              width: 150,
                              
                              child: TextField(


                                
                                
                                
                                controller: _date,
                                decoration: InputDecoration(
                                  icon:Icon (Icons.calendar_today_rounded),
                                  labelText: 'Select Date',
                                  border: OutlineInputBorder(),
                                
                                ),
                                onTap: ()async{
    
                                  DateTime? pickeddate = await showDatePicker(
                              

                                    
                                  initialDate: DateTime.now(),
                                  
                                    
                                    context: context,
                                    
                                      firstDate: DateTime(2000), 
                                      lastDate: DateTime(2101));

                                      if(pickeddate !=null){
                                        setState(() {
                                          _date.text = DateFormat('dd-MM-yyyy').format(pickeddate);






                                          

                                         
                                        });

                                        
                                      };

                                      

                                      

                                      

                                  
                                },

                              ),
                            ),


                            

                          
          
                          ],
                        ),
                      ),

                      
                  
                      for(TODO todo in _foundtodo)
                      
                      
                        todoitem(

                          
                          todo: todo, 
                          ontodochanged:_handleonchange,
                  
                          
                        ondeleteitem:deletetodoitem ,)
                    
                  
                      
                  
                    ],
                  ),
                ),

                
              ],
            ),      
    ),

    SizedBox(height: 5,),


    //

    Align(
      alignment: Alignment.bottomCenter,

      child: Row(
        children: [
          Expanded(child: BottomAppBar(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1,vertical: 1),
              
              margin: EdgeInsets.only(bottom: 5,right: 20,left: 20,),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.white,offset: Offset(0.0,0.0),blurRadius:10.0,
          
                spreadRadius: 0.0,
                
                
          
                ),
                ],
          
                borderRadius: BorderRadius.circular(10),
                
              ),
              child: TextField(
                textAlign: TextAlign.center,
                
                controller: _todocontroller,
                decoration: InputDecoration(
                  
                  hintText: '  Add a New Todo Item',
                  border: InputBorder.none,
                ),
              ),
              
            ),
          ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 5,right: 20),
            child: ElevatedButton(
              
              child: Text('+',style: TextStyle(fontSize: 40,),),
              onPressed: () {
                


            var text_ = _todocontroller.text;




      


       if(text_.length!= 0){
         
        _addtoitem(_todocontroller.text+"  "  + DateTime.now().toString());

        
}

},
          
          

               
                
                 
                  
                
               
                  
              
              
              
              style: ElevatedButton.styleFrom(
                primary: tdblue,
                minimumSize: Size(60, 60),
                elevation: 10,
              ),
              

            ),
            
          ),
        ],
      ),
    ),


        ],
      ),
    );
  }


void _handleonchange(TODO todo2)
{

  setState(() {

    todo2.isDone = !todo2.isDone;
    
  });
}

void deletetodoitem(String id)
{

  setState(() {

    

    todoslist.removeWhere((item) => item.id == id);
    
  });
   
}

void _addtoitem(var toDO){

  
         

  setState(() {
     
      
    todoslist.add(TODO(id: DateTime.now().millisecondsSinceEpoch.toString(), todotext: toDO));

    

   

    
  });

  _todocontroller.clear();

  
}

void _runfilter(String enteredkeyword){

  List<TODO> results = [];
  if(enteredkeyword.isEmpty)
  {
    results = todoslist;
  }

  else{
    

    results = todoslist.where((item) => item.todotext!.toLowerCase().contains(enteredkeyword.toLowerCase())).toList();
  }

  setState(() {
    _foundtodo =results;
  });
  
}















///search box
///
///
///
///
///
Widget searchbox(){



  return Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),

              
              
              
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                
              ) ,


              //textfield


              child: TextField(
                onChanged: ((value) => _runfilter(value)),

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                   prefixIcon: Icon(Icons.search,color: tdblack,size: 20,),
                   prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
                   border: InputBorder.none,
                   hintText: 'search',
                   hintStyle: TextStyle(color: tdgrey),
                ),
                
              ),
            );
          
        
    
}
}





