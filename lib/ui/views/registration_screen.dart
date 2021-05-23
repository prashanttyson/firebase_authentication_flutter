import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/business_logic/providers/provider_state.dart';
import 'package:flutter_provider/business_logic/utils/app_colors.dart';
import 'package:flutter_provider/business_logic/utils/navigation_service.dart';
import 'package:flutter_provider/business_logic/utils/route_constant.dart';
import 'package:provider/provider.dart';

class ProviderRegistration extends StatefulWidget {
  @override
  _ProviderRegistrationState createState() => _ProviderRegistrationState();
}

class _ProviderRegistrationState extends State<ProviderRegistration> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  void _signUp(String email,String password,BuildContext context) async{
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    try{
     if(await _providerState.createUserAccount(email, password)){

       NavigationService().pushReplacementNamed(loginRoute);
     }
    }catch(e)
    {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              color: AppColors.themeDarkGreen,
              child: Card(
                elevation: 10,
                color: AppColors.greyBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: TextField(
                        controller: firstname,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.black
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.blue[900]
                              )
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.blue[900],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: TextField(
                        controller: lastname,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.black
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.blue[900]
                              )
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.blue[900],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.black
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.blue[900]
                              )
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.blue[900],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.black
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.blue[900]
                              )
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.blue[900],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: ElevatedButton(
                        child: Text('Sign Up'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.themeDarkGreen),
                            padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30, 10, 30, 10)),
                            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
                        onPressed: () {
                          _signUp(email.text, password.text, context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20,top: 20),
          child: GestureDetector(
              onTap: (){
                NavigationService().pushReplacementNamed(loginRoute);
                 },
              child: RichText(textAlign:TextAlign.center,text: TextSpan(
                text: 'Already an user?',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Login Now',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.themeDarkGreen),
                  ),
                ],
              )
              )
          ),
        )
    );
  }
}