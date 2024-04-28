
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  FocusNode emailFocusNode  = FocusNode();
  FocusNode passwordFocusNode= FocusNode();
  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

  }


  @override
  Widget build(BuildContext context) {
    final authViewModel=Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(valueListenable: _obsecurePassword,
                builder: (context,value,child) {
              return TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                obscureText: _obsecurePassword.value,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_open_outlined),
                  suffixIcon: InkWell(
                      onTap: (){
                        _obsecurePassword.value =!_obsecurePassword.value;
                      },
                      child: Icon(_obsecurePassword.value? Icons.visibility_off_outlined :
                      Icons.visibility)),
                ),
              );
                }),
            SizedBox(height: height*.085,),
            RoundButton(
                title: 'Login',
                loading: authViewModel.loading,
                onPress: (){
              if(_emailController.text.isEmpty){
                Utils.flushBarErrorMessage('Please enter email', context);
              }else if(_passwordController.text.isEmpty){
                Utils.flushBarErrorMessage('Please enter password', context);
              }else if(_passwordController.text.length<8){
                Utils.flushBarErrorMessage('Please enter eight digit password', context);

              }else{
                Map data={
                 'email':_emailController.text.toString(),
                  'password' : _passwordController.text.toString(),

                };
                authViewModel.loginApi(data,context);
                if (kDebugMode) {
                  print('api hit');
                }
              }
            } ),
            SizedBox(height: height*.085,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.signup);
              },
                child: const Text("Don't have an account? Sign Up")),
          ],
        ),
      )
    );
  }
}
