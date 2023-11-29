import 'package:flutter/material.dart';
import 'package:mynewui/testUi/constants/constants.dart';

class AnimatedLoginPage extends StatefulWidget {
  @override
  _AnimatedLoginPageState createState() => _AnimatedLoginPageState();
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage> {
  bool _isLoginForm = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _toggleForm() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/my ui.jpeg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 300,
            height: 580,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(255, 220, 220, 0.406),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: [
                      Text(
                        _isLoginForm ? 'Hello, Again!' : 'Sign Up, Now!',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _isLoginForm ? 'We are happy to have you back.' : 'We are happy to have you with us.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: _isLoginForm
                      ? _buildLoginForm()
                      : _buildSignupForm(),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(left:23,right: 23),
                  child: Container(
                    decoration: BoxDecoration(
                      //color: darkBlue, // Set the background color here
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: darkBlue, // Set the border color here
                      ),
                    ),
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!_isLoginForm) {
                              _toggleForm();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: _isLoginForm ? darkBlue : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Existing User',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: _isLoginForm ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            if (_isLoginForm) {
                              _toggleForm();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: !_isLoginForm ? darkBlue: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'New User',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: !_isLoginForm ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      key: ValueKey<bool>(_isLoginForm),
      width: 250,
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email address',
             prefixIcon: Icon(Icons.email)
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(deepDarkGreen)),
            onPressed: () {
              // Implement your login logic here
            },
            child: Text('Sign In'),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              // Implement your forgot password logic here
            },
            child: Text(
              'Forgot password?',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupForm() {
    return Container(
      key: ValueKey<bool>(_isLoginForm),
      width: 250,
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email address',
              prefixIcon: Icon(Icons.email),

            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.visibility_off),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.visibility_off),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(deepDarkGreen)),
            onPressed: () {
              // Implement your login logic here
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
