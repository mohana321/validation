import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class valid extends StatefulWidget {
  @override
  State<valid> createState() => _validState();

}
class _validState extends State<valid> {

  // bool _passwordVisible=true;
  final _formKey = GlobalKey<FormState>();
  var confirmPass;
  bool _show =false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  auth()
  {
    setState(() {
      _show = name.text.isNotEmpty &&
          email.text.isNotEmpty &&
          password.text.isNotEmpty &&
          mobile.text.isNotEmpty == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(child: Text("LOGIN",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),))
      ),
      body:Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:MediaQuery.of(context).size.width + 200,
                width:400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller:  name,
                        decoration: InputDecoration(
                          icon:Icon(Icons.person),
                          hintText: "enter your name",
                          border: OutlineInputBorder(),

                        ),
                        onChanged: (val){
                          auth();
                        },
                        validator: (input){
                          if(input==null ) {
                            return ' Please enter valid name';
                          }
                          if (!input.contains(RegExp(r'[a-z]'))) {
                            return 'Lowercase letter is missing.\n';
                          }
                          if (!input.contains(RegExp(r'[A-Z]'))) {
                            return 'Uppercase letter is missing.\n';
                          }
                          if (input.contains(RegExp(r'[0-9]'))) {
                            return 'Number should not Enter\n';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          icon: Icon(Icons.password),
                          hintText: "enter your password",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val){
                          auth();
                        },
                        validator: (input){
                          if(input==null ){
                            return 'please enter password';
                          }
                          if (input.length < 6) {
                            return "Password must be atleast 6 characters long";
                          }
                          if (!input.contains(RegExp(r'[a-z]'))) {
                            return '• Lowercase letter is missing.\n';
                          }
                          if (!input.contains(RegExp(r'[A-Z]'))) {
                            return '• Uppercase letter is missing.\n';
                          }
                          if (!input.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                            return '• Special character is missing.\n';
                          }

                        },

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: email,
                        validator: (input){
                          if(input==null||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input))
                          {
                           return 'Please Enter valid mail id' ;
                          };
                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.mail),
                          hintText: "enter your mail Id",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val){
                          auth();
                        },

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: mobile,
                        validator: (input){
                          if(input == null || !RegExp(r"^[0-9]").hasMatch(input) ||
                              input.length != 10){
                            return 'Please enter valid mobile number';
                          };

                        },

                        decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "enter your Phone number",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val){
                          auth();
                        },

                      ),
                    ),
                    Visibility(
                      visible: _show,
                      child: ElevatedButton(onPressed: (){

                      }, child: Text("login")),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://t3.ftcdn.net/jpg/03/51/51/28/360_F_351512882_2kFH8IaSe4lyA7SXBLzEXyGKNEgbO1iH.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),

              ),
            ),
          ],
        ),
      )



    );
  }
}
/// Reg exp