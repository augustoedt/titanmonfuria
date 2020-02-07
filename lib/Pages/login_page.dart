import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:titamon_furia/Pages/lobby_page.dart';
import 'package:titamon_furia/Pages/resgistration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth = FirebaseAuth.instance;

  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value){
                  email = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  )
                ),
              ),
              TextField(
                onChanged: (value){
                  password = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  )
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    try{
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      setState(() {
                        showSpinner = false;
                      });
                      if(user != null){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>LobbyPage()));
                      }
                    }catch(e){
                      print(e);
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    alignment: Alignment.center,
                    child: Text('Login'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.black
                    ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    alignment: Alignment.center,
                    child: Text('Regitrar'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2.0,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              ),
            ]
            ),
        ),
      ),
    );
  }
}
