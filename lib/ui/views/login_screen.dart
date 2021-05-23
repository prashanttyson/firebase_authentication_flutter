import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/business_logic/providers/provider_state.dart';
import 'package:flutter_provider/business_logic/utils/app_colors.dart';
import 'package:flutter_provider/business_logic/utils/navigation_service.dart';
import 'package:flutter_provider/business_logic/utils/route_constant.dart';
import 'package:provider/provider.dart';
import 'registration_screen.dart';


class ProviderLogin extends StatefulWidget {
  @override
  _ProviderLoginState createState() => _ProviderLoginState();
}
class _ProviderLoginState extends State<ProviderLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                        child: Text('Sign In'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.themeDarkGreen),
                            padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30, 10, 30, 10)),
                            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
                        onPressed: () {
                          _login(email.text, password.text, context);
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
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderRegistration()));
              },
              child: RichText(textAlign:TextAlign.center,text: TextSpan(
                text: 'New User?',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Register Now',
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
  void _login(String email,String password,BuildContext context) async{
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    try{
      if(await _providerState.signInWithUserAccount(email, password)){
        NavigationService().pushReplacementNamed(dashboardRoute);
        print('logged in.......');
         }
    }catch(e)
    {
      print(e);
    }
  }
}
