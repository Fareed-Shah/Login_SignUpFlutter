import 'package:flutter/material.dart';


class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({Key? key}) : super(key: key);

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  @override
  Widget build(BuildContext context) {
     return 
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(image:
        AssetImage('images/register.PNG'),
        fit: BoxFit.cover),
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,

      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 35,top: MediaQuery.of(context).size.height*0.2),
            child: Text(
              'Create\nAccount',
              style: TextStyle(color: Colors.white,fontSize: 33),
              ),
          ),
         
         Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,
          right: 35,
          left: 35),
          child: Form(
            
            child: Column(
              children: [
                 TextFormField(
                  decoration: InputDecoration(   
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),                                            
                    )
                  ),
                ),
                SizedBox(height: 40,),
                TextFormField(
                  decoration: InputDecoration(   
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                SizedBox(height: 40,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(                                        
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white,fontSize: 27,fontWeight: FontWeight.bold),),
                      CircleAvatar(
                        backgroundColor: Color(0xff4c505b),
                        radius: 30,
                        child: IconButton(onPressed: (){

                        }, icon: Icon(Icons.arrow_forward,color: Colors.white,)),
                      )
                  ],
                ),

                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   TextButton(onPressed: (){

                   }, child: Text(
                    'Sign In',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Colors.white
                    ),
                    )),
                   
                  ],
                )

              ],              
            )            
            ),            
         ),
          
          

        ],
      ),
      )
      );
  }
}