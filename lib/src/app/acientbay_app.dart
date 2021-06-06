
import 'package:acientbay/src/bloc/nav/nav_bloc.dart';
import 'package:acientbay/src/page/home/home_nav.dart';
import 'package:acientbay/src/repo/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AcientbayApp extends HookWidget{

  AuthenticationRepository repository =  AuthenticationRepository();

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Acientbay",
     home: BlocProvider(create:(_) => NavBloc(authenticationRepository: repository), child: HomeNav()),
   );
  }
}







