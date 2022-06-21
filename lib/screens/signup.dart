import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_signup/screens/home.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({Key? key}) : super(key: key);
  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
GlobalKey<FormState> Signup_key = GlobalKey<FormState>();

 void Signup_Validate(){
  if(Signup_key.currentState!.validate()){
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
        AssetImage('images/register.PNG'),
        fit: BoxFit.cover),
      ),
      child: Scaffold(        
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 35,top: MediaQuery.of(context).size.height*0.1),
            child: Text(
              'Create\nAccount',
              style: TextStyle(color: Colors.white,fontSize: 33),
              ),
          ),
         
         Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3,
          right: 35,
          left: 35),
          child: SingleChildScrollView(
            child: Form(
              key: Signup_key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                   TextFormField(
                    decoration: InputDecoration(   
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),                                            
                      ),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)
                      )
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter Name'),
                      ]),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    decoration: InputDecoration(   
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),                      
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),                      
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)
                      )
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter email address'),
                      EmailValidator(errorText: 'Enter a valid email address')
                      
                      ]),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(                                        
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)
                      )

                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter a Password'),
                      MinLengthValidator(6, errorText: 'More than 6 characters required')
                    ]),
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

                           final validform =Signup_key.currentState!.validate();
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
         ),
          
          

        ],
      ),
      )
      );
  }
}