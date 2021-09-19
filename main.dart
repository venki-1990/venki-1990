import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myapp(),
  ));
}
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  _MyappState createState() => _MyappState();
}
class _MyappState extends State<Myapp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn_googlesignin = GoogleSignIn();

  //get auth => null;

  @override void initState() {
    // TODO: implement initState
    super.initState();
    signInwithGoogle();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp();
  }

  Future<String?> signInwithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn
        .signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential result = await auth.signInWithCredential(credential);
      User? user =
          (await auth.signInWithCredential(credential)).user;
      if (result != null) {}
      await showDialog(context: context, builder: (context) =>
      new AlertDialog(
        title: Text("message"),
        content: Text("you have a alert message"),
        actions: <Widget>[
          FlatButton(onPressed: () {
            },
              child: Text("Sign in")),
        ],
      ),
      );
      @override
      Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
              title: Text("GOOGLE"),
              centerTitle: true,
            ),
            body: Center(
              child: Container(
                child: new RaisedButton(
                  color: Colors.white70,
                  onPressed: () {
                    setState(() {
                      signInwithGoogle();
                    });
                  },
                  child: Text("Sign in  with Google"),
                ),
              ),
            )
        );
      }
    }
  }
}








