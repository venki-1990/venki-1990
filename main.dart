import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main()=>runApp(new MaterialApp(
  home: Myapp(),
  debugShowCheckedModeBanner: false,
));
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  late String email,password;
  GlobalKey<FormState>formkey=GlobalKey<FormState>();
  void Login() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password)
        .then((value) => print("success"))
        .catchError((onError){
      print("Error");
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(12)),
            TextFormField(
              validator: (value){
                if(value!.isEmpty) {
                  return "Enter your email";
                }else{
                  return null;
                }
              },
              onSaved: (value){
                email='value';
              },
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Enter your email",
                labelText: "email",
              ),
            ),
            TextFormField(
              validator: (value){
                if(value!.isEmpty) {
                  return "Enter your password";
                }else{
                  return null;
                }
              },
              onSaved: (value){
                password='value';
              },
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                hintText: "Enter your password",
                labelText: "password",
              ),
            ),
            FlatButton(onPressed:(){
              print("success");
              if(formkey.currentState!.validate()){
                (formkey.currentState!.save());
                Login();
                FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

              }
              },
                textColor: Colors.blue,
                child:Text("Login")),
          ],

        ),
      ),

    );
  }
}
