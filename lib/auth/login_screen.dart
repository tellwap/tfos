import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/auth/auths.dart';
import 'package:tfos/auth/register_screen.dart';
import 'package:email_validator/email_validator.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tquiz/models/user.dart';
// import 'package:tquiz/screens/auth/register_screen.dart';
// import 'package:tquiz/services/auths.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = 'login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _textEditingControllerAccount =
      TextEditingController(text: 'manufacture@gmail.com');
  final _textEditingControllerPassword =
      TextEditingController(text: '@manufacture123');
  final _passwordFocusNode = FocusNode();
  bool isLoading = false;

  void _loginUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Login through provider
    final _apiResponse = await Provider.of<Auth>(context, listen: false).login(
        _textEditingControllerAccount.text,
        _textEditingControllerPassword.text);

    setState(() {
      isLoading = false;
    });

    if (_apiResponse.error == null) {
      // _saveAndRedirectToHome(_apiResponse.data as User);
      //Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
      print('login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${_apiResponse.error}'),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Welcome Back'),
      ),
      body: Card(
        margin: const EdgeInsets.all(20),
        child: Container(
          // alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _textEditingControllerAccount,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.account_circle)),
                    validator: (val) => EmailValidator.validate(val.toString())
                        ? null
                        : "Please enter a valid email",
                    onFieldSubmitted: (value) {
                      if (value.isEmpty) {
                        return;
                      }
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _textEditingControllerPassword,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Password', prefixIcon: Icon(Icons.lock)
                        // border: OutlineInputBorder(),
                        ),
                    validator: (val) =>
                        val!.isEmpty ? 'Password field is required' : null,
                    focusNode: _passwordFocusNode,
                    onFieldSubmitted: (_) => _loginUser(),
                  ),
                  const SizedBox(height: 10),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                          onPressed: _loginUser,
                          child: const Text('Login')),
                  const SizedBox(height: 10),
                  // InkWell(
                  //   child: const Center(
                  //       child: Text('Do not have account? Create New')),
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //    context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  //     _openRegistrationPage(context);
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openRegistrationPage(BuildContext context) {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }
}
