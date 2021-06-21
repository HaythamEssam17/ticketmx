import 'package:flutter/material.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Screens/HomePages/homePage.dart';
import 'package:ticketmx_app/Widgets/commonButtons.dart';
import 'package:ticketmx_app/Widgets/commonPaddingWidget.dart';
import 'package:ticketmx_app/Widgets/commonTextFormFieldWidget.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formStateKey,
        child: Container(
          height: SharedText.screenHeight,
          width: SharedText.screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'), fit: BoxFit.fill),
          ),
          child: Center(
            child: signInWidget(),
          ),
        ),
      ),
    );
  }

  Widget signInWidget() {
    return Container(
      padding: CommonPaddingWidget.padding(),
      margin: CommonPaddingWidget.padding(),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SharedText.screenWidth * 0.035)),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: SharedText.screenHeight * 0.025),
            Image.asset(
              'images/logo.png',
              fit: BoxFit.fill,
              height: SharedText.screenHeight * 0.1,
              width: SharedText.screenWidth,
            ),
            SizedBox(height: SharedText.screenHeight * 0.025),
            CommonTextFormFieldWidget.customTextFormField(
                controller: emailController,
                hintText: 'Email Address',
                validator: (value) {
                  if (value!.isEmpty) return 'Value can\'t be null';
                }),
            SizedBox(height: SharedText.screenHeight * 0.025),
            CommonTextFormFieldWidget.customTextFormField(
                controller: passwordController,
                hintText: 'Password',
                validator: (value) {
                  if (value!.isEmpty) return 'Value can\'t be null';
                }),
            SizedBox(height: SharedText.screenHeight * 0.025),
            CommonButtons.customButton(
                onPressed: () {
                  if (_formStateKey.currentState!.validate()) {
                    _formStateKey.currentState!.save();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                },
                text: 'Login',
                iconData: null,
                bgColor: SharedText.secondColor),
            SizedBox(height: SharedText.screenHeight * 0.025),
          ],
        ),
      ),
    );
  }
}
