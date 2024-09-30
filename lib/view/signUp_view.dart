import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/routes/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obscurePassword= ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    passwordFocusNode.dispose();
    _obscurePassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel=Provider.of<AuthViewModel>(context);
    final height= MediaQuery.of(context).size.height*1;
    
    return  Scaffold(
      appBar: AppBar(
        title: Text('SignUp screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefix: Icon(Icons.email),
              ) ,
              onFieldSubmitted: (value) {
                Utils.fieldFocusNode(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(valueListenable: _obscurePassword, 
            builder: ( (context, value, child){
              return TextFormField(
              obscureText: _obscurePassword.value,
              obscuringCharacter: "*",
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                prefix: const Icon(Icons.lock_clock_outlined),
                suffixIcon: InkWell(
                   onTap: (){
                  _obscurePassword.value=!_obscurePassword.value;
                 },
                  child:  Icon(
                    _obscurePassword.value ?   Icons.visibility_off_outlined : 
                    Icons.visibility))
        
              ) ,
            );
            } )),
            SizedBox(height: height*.085,),
            RoundButton(
              loading: authViewModel.signUploading,
      title: 'SignUp',
      onPress: (){
        if(_emailController.text.isEmpty){
         Utils.flushBarErrorMessage('Please E-Mail', context);

        }
        else if(_passwordController.text.length<4){
          Utils.flushBarErrorMessage('Piz 8 Digit', context);
        }
        else{
          Map data={
            'email': _emailController.toString(),
            'password':_passwordController.toString(),

          };
          authViewModel.loginApi(data,context);
          print('Api hit');

        }
      },

    ),
    SizedBox(
      height: height*0.02,
    ),
    InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesName.login);
      },
      child: Text(' Have Account ? Login'),
    )

             
          ],
        ),
      )

    );
  }
}