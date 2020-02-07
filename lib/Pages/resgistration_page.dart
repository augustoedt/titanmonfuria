import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'lobby_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _auth = FirebaseAuth.instance;

  String email;
  String password;
  String name;
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
//                TextField(
//                  onChanged: (value){
//                    name = value;
//                  },
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.person),
//                    border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(20),
//                        borderSide: BorderSide(
//                            color: Colors.black
//                        )
//                    )
//                  ),
//                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      try{
                        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password,);
                        setState(() {
                          showSpinner = true;
                        });
                        if(newUser != null){
                          showSpinner = false;
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>LobbyPage()));
                        }

                      } on Exception catch(e){
                        print(e);
                        setState(() {
                          showSpinner = false;
                        });
                      }

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
