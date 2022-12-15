import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/model/todo.dart';

class todoitem extends StatelessWidget {
  

 final TODO todo;
 final ontodochanged ;
 final ondeleteitem;

 const todoitem({Key,key,required this.todo,
 required this.ontodochanged,
 required this.ondeleteitem,
 }):super(key: key);




 

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          

          ontodochanged (todo);
        },


        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(todo.isDone? Icons.check_box:Icons.check_box_outline_blank,
        color: tdblue,),

        title: Text(todo.todotext!,style: TextStyle(
          fontSize: 16,
          color: tdblack,
          decoration: todo.isDone? TextDecoration.lineThrough:null
          ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(horizontal:30,vertical: 5),
            height: 35,
            width: 90,
              decoration: BoxDecoration(
              color: tdred,
              borderRadius: BorderRadius.circular(5),
            ),  

            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              
              children: [
                IconButton(
                  
                  
                  color: Colors.white,
                  iconSize: 18,
                  icon: Icon(Icons.delete,size: 15,),

                  
                  onPressed: () {

                    ondeleteitem(todo.id);
                    
                  },
                ),

              

             



                

           
                


                 Container(
                  
                    
                  
                  height: 35,
                  width: 45,
                  color: Colors.teal,
                   child: IconButton(
                    
                    
                    color: Colors.white,
                    iconSize: 18,
                    icon: Icon(Icons.add,size: 15,),
                 
                    
                    onPressed: () {
                 
                    
                      
                    },
                    ),
                 ),



                

                
              

                
                

                           
                
                
                
                
                
                
                
                
                ],

            ),

            

            
          ),


          



        

        

        
      ),
    );
  }
}


