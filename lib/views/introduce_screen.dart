// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:midterm_519h0277/views/base_screen.dart';
import 'package:midterm_519h0277/views/login_screen.dart';

class IntroduceScreen extends StatefulWidget {
  const IntroduceScreen({Key? key}) : super(key: key);

  @override
  State<IntroduceScreen> createState() => _IntroduceScreenState();
}

class _IntroduceScreenState extends State<IntroduceScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(        //background của màn
          "assets/cat.gif",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(child: Container(), flex: 2,),
                      const CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage('assets/reddit_logo.png'),
                      ),
                      Flexible(child: Container(), flex: 5,),
                      const Text('Dive into', style: TextStyle(fontSize: 32, color: Colors.white),),
                      const Text('anything', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 32,),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'By continuing, you agree to our\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white
                              )
                            ),
                            TextSpan(
                              text: 'User Agreement ',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                decoration: TextDecoration.underline
                              )
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                color: Colors.white
                              )
                            ),
                            TextSpan(
                              text: 'Privacy Policy ',
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline
                              )
                            ),
                          ]
                        ),
                        textAlign: TextAlign.center,    //canh giữa đoạn text
                      ),
                      const SizedBox(height: 24,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const BaseScreen()));
                        },
                        child: const SignUpWithButton(
                          logoImg: 'assets/gg_logo.png', 
                          text: 'Sign up with Google',
                        )
                      ),
                      const SizedBox(height: 8,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const BaseScreen()));
                        },
                        child: const SignUpWithButton(
                          logoImg: 'assets/apple_logo.jpg', 
                          text: 'Sign up with Apple',
                        )
                      ),
                      const SizedBox(height: 8,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const BaseScreen()));
                        },
                        child: const SignUpWithButton(
                          logoImg: 'assets/mail_logo.png', 
                          text: 'Sign up with Email',
                        ),
                      ),
                      const SizedBox(height: 32,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LogInScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            Text('Already a Redditor?', style: TextStyle(fontSize: 14, color: Colors.white)),
                            SizedBox(width: 4,),
                            Text('Log In', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                          ],
                        ),
                      ),
                      Flexible(child: Container(), flex: 1,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ),
      ]
    );
  }
}

class SignUpWithButton extends StatelessWidget {

  const SignUpWithButton({
    Key? key,
    required String logoImg,
    required String text,
  }) : logoImg = logoImg, text = text,  super(key: key);

  final String logoImg ;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(26.0),
          top: Radius.circular(26.0)
        ),
        color: Colors.black.withOpacity(0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(logoImg),
          ),
          const SizedBox(width: 8,),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}