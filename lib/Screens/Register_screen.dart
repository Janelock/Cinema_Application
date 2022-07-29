import 'package:cinema/Screens/transition_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinema/components/default_textformfield.dart';
import 'Login_screen.dart';


class RegisterScreen extends StatelessWidget {

  final TextEditingController email = TextEditingController() ;
  final TextEditingController password= TextEditingController();
  final TextEditingController userName= TextEditingController();

  final  auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(

            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: Opacity(
              opacity:0.3 ,
              child: Image.network('https://images.squarespace-cdn.com/content/v1/618f1949e28d5e64417a9ba1/1637461630196-CPUM9INIO8C2OE57HKWY/tyson-moultrie-BQTHOGNHo08-unsplash.jpg',fit: BoxFit.cover,),

            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      child: Column(


                        children: [



                          defaultTextFormField(hintText: 'User Name ',icon: Icons.person,color: Colors.orangeAccent,Type: TextInputType.emailAddress ,controller: userName
                          ),
                          SizedBox(height: 35,),

                          defaultTextFormField(hintText: 'Email',icon: Icons.email_outlined,color:Colors.orangeAccent,Type: TextInputType.emailAddress, controller: email),
                          SizedBox(height: 35,),

                          defaultTextFormField(hintText: 'Password',icon: Icons.lock,color: Colors.orangeAccent,obscureText: true,Type: TextInputType.number,controller: password),

                          SizedBox(height: 60,),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),

                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  colors:<Color>[
                                    const Color(0xffff5983),
                                    Colors.orangeAccent,

                                  ],

                                )

                            ),
                            child: MaterialButton(onPressed: () async {
                              try { final NewUser= await auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
                              print("created new user");
                              if (NewUser!=null){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> TransitionScreen(UserName: userName.text)));
                              }

                              }
                              catch(e) {
                                print (e);
                              }
                            },
                              child:Text('REGISTER',style: TextStyle(color: Colors.white,fontSize: 16),) ,),
                          ),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an Account ? ',style: TextStyle(fontSize: 18,color: Colors.white),),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                              }, child: const Text('Sign In',style: TextStyle(fontSize: 20,color: Colors.orangeAccent,),)),
                            ],
                          ),

                        ],
                      ),
                    )               ,


                  ],
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}
