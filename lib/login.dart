import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uasmmp23/myliverpool.dart';
import 'package:uasmmp23/register.dart';

class myLogin extends StatefulWidget {
  static const routeName = '/login';
  const myLogin({super.key});

  @override
  State<myLogin> createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  final _auth = FirebaseAuth.instance;
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      final navigator = Navigator.of(context);
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      navigator.pushReplacementNamed(myLiverpool.routeName);
                    } on Exception catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  child: Text('Login')),
              SizedBox(
                height: 8.0,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return myRegister();
                    }));
                  },
                  child: Text('Go To Register'))
            ],
          )),
    );
  }
}
