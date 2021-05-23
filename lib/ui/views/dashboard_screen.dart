import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_provider/business_logic/models/post.dart';
import 'package:flutter_provider/business_logic/providers/dashboard_provider.dart';
import 'package:flutter_provider/business_logic/providers/provider_state.dart';
import 'package:flutter_provider/business_logic/utils/app_colors.dart';
import 'package:flutter_provider/business_logic/utils/navigation_service.dart';
import 'package:flutter_provider/business_logic/utils/route_constant.dart';
import 'package:flutter_provider/services/network/api_helper.dart';
import 'package:provider/provider.dart';


class ProviderDashboard extends StatefulWidget {


  @override
  _ProviderDashboardState createState() => _ProviderDashboardState();
}

class _ProviderDashboardState extends State<ProviderDashboard> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  _showSnackbar(String message) {
    _globalKey.currentState.showSnackBar(SnackBar(content: Text(message,style: TextStyle(color: Colors.black),),
        backgroundColor: AppColors.greenBackgroundColor ?? Colors.red),);
  }

  _hideSnackbar() {
    _globalKey.currentState.hideCurrentSnackBar();
  }

  _getPost() async {
    var provider = Provider.of<DashBoardProvider>(context, listen: false);
    var response = await APIHelper.getPost();
    if (response.isSuccessful) {
      provider.setPostsList(response.data);
    } else {
      _showSnackbar(response.message);
    }
    provider.setIsProcessing(false);
  }

  @override
  void initState() {
    super.initState();
    _getPost();
  }

  @override
  Widget build(BuildContext context) {
    ProviderState _providerState = Provider.of<ProviderState>(
        context, listen: false);
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          title: Text("Provider"),
          actions: [
            GestureDetector(
              onTap: () {
                try {
                  _providerState.signOut().then((value) {
                    NavigationService().pushNamedAndRemoveUntil(loginRoute);
                  });
                } catch (e) {

                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Text('Sign Out', style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.underline),),
              ),
            ),
          ],
        ),
        body: Consumer<DashBoardProvider>(builder: (_, provider, __) =>provider.isProcessing?Center(
          child: CircularProgressIndicator(),
        )
            :ListView.builder(itemBuilder: (_, index) {
              Post post = provider.getPostByIndex(index);
              return Card(
                margin: EdgeInsets.only(top: 20,right: 20,left: 20),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Container(
                      padding: EdgeInsets.all(10),
                        color:AppColors.themeDarkGreen,child: Text(post.title,style: TextStyle(color:Colors.white,fontSize: 20),)),
                    subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20),),
                  ),
                ),
              );
            },
            itemCount: provider.postsList.length,))

    );
  }
}