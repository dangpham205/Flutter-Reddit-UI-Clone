import 'package:flutter/material.dart';
import 'package:midterm_519h0277/views/base_screen.dart';
import 'package:midterm_519h0277/views/login_screen.dart';

import '../constants/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/reddit_logo.png'),
        ),
        actions: [
          TextButton(                                   //chat
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LogInScreen()));
            },
            child: const Text('Log in', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 100, 100, 100)),)
          ),
          const SizedBox(width: 10,)
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width, 
          child: SafeArea(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 18, right: 18, top: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hi new friend, welcome to \nReddit', 
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                  Flexible(child: Container(), flex: 2,),
                  TextFormField(
                    style: const TextStyle(fontSize: 20),
                    cursorColor: const Color.fromARGB(255, 17, 0, 162),
                    textInputAction: TextInputAction.next,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label:  Text('Email'),
                      labelStyle: TextStyle(
                        fontSize: 16, 
                        color: Colors.grey , 
                        fontWeight: FontWeight.w600),
                      enabledBorder: UnderlineInputBorder(      
                        borderSide: BorderSide(color: Color.fromARGB(255, 229, 229, 229), width: 2),   
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 17, 0, 162),width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.text,                
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 20),
                    cursorColor: const Color.fromARGB(255, 17, 0, 162),
                    textInputAction: TextInputAction.next,
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      label:  Text('Username'),
                      labelStyle: TextStyle(
                        fontSize: 16, 
                        color: Colors.grey , 
                        fontWeight: FontWeight.w600),
                      enabledBorder: UnderlineInputBorder(      
                        borderSide: BorderSide(color: Color.fromARGB(255, 229, 229, 229), width: 2),   
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 17, 0, 162),width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.text,                
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 20),
                    cursorColor: const Color.fromARGB(255, 17, 0, 162),
                    textInputAction: TextInputAction.go,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.lock),
                        onPressed: () {
                        },
                      ),
                      label: const Text('Password'),
                      labelStyle: const TextStyle(
                        fontSize: 16, 
                        color:  Colors.grey , 
                        fontWeight: FontWeight.w600),
                      enabledBorder: const UnderlineInputBorder(      
                        borderSide: BorderSide(color: Color.fromARGB(255, 229, 229, 229), width: 2),   
                      ),  
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 17, 0, 162),width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Flexible(child: Container(), flex: 4,),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By continuing, you agree to our ',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey
                          )
                        ),
                        TextSpan(
                          text: 'User Agreement ',
                          style: TextStyle(
                            fontSize: 13,
                            color: redditColor,
                            decoration: TextDecoration.underline
                          )
                        ),
                        TextSpan(
                          text: 'and ',
                          style: TextStyle(
                            color: Colors.grey
                          )
                        ),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: TextStyle(
                            color: redditColor,
                            decoration: TextDecoration.underline
                          )
                        ),
                      ]
                    ),
                    textAlign: TextAlign.start,    //canh giữa đoạn text
                  ),
                  InkWell(
                    onTap: () {
                      if (_passwordController.text != '' && _usernameController.text != '' && _emailController.text != ''){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const BaseScreen()));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(26.0), bottom: Radius.circular(26.0)),
                          color: _usernameController.text != '' && _passwordController.text != '' 
                          ? redditColor 
                          : const Color.fromARGB(144, 226, 48, 12),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Center(
                          child:  
                          Text('Continue', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),
                  ),
                  Flexible(child: Container(), flex: 3,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}