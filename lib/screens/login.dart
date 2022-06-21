import 'dart:html';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_signup/screens/home.dart';
import 'package:login_signup/screens/signup.dart';


class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
 GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
 void validate(){
  if(formkey.currentState!.validate()){
    print('Ok');
  }
  else{
    print('Error');
  }
}

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(image:
        AssetImage('images/login.PNG'),
        fit: BoxFit.cover),
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,

      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 35,top: MediaQuery.of(context).size.height*0.2),
            child: Text(
              'Welcome\nBack',
              style: TextStyle(color: Colors.white,fontSize: 33),
              ),
          ),
         
         Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,
          right: 35,
          left: 35),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(   
                     fillColor: Colors.grey.shade100,
                      filled: true,                 
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    validator: MultiValidator([
                      EmailValidator(errorText: 'Enter a valid email address'),
                      RequiredValidator(errorText: 'Enter email address')
                      ]),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(                                        
                      fillColor: Colors.grey.shade100,
                      filled: true,
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
                        'Sign In',
                        style: TextStyle(color: Color(0xff4c505b),fontSize: 27,fontWeight: FontWeight.bold),),
                        CircleAvatar(
                          backgroundColor: Color(0xff4c505b),
                          radius: 30,
                          child: IconButton(onPressed: (){                          
                            final validform =formkey.currentState!.validate();
                            if(validform){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Home_Screen()));
                            }
                          }, icon: Icon(Icons.arrow_forward,color: Colors.white,)),
                          )
                    ],
                  ),
          
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     TextButton(onPressed: (){
                       Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context) => const SignUp_Screen()),
                     );
                     }, child: Text(
                      'Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        color: Color(0xff4c505b)
                      ),
                      )),
          
                       TextButton(onPressed: (){
          
                     }, child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        color: Color(0xff4c505b)
                      ),
                      ))
                    ],
                  )
          
                ],              
              )            
              ),
          ),            
         ),
          
          

        ],
      ),
      )
      );
  }
}
