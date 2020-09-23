import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  String _email;
  String _pass;
  bool _showLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget _button(String title, void func()) {
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        child: Text(
          title,
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        onPressed: () {
          func();
        },
      );
    }

    Widget _input(String placeholder, TextEditingController controller,
        Icon icon, bool hidden) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: hidden,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              // hintStyle: ,
              hintText: placeholder,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)),
              prefixIcon: new Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: new IconTheme(
                    data: IconThemeData(color: Colors.white), child: icon),
              )),
        ),
      );
    }

    Widget _logo(String label) {
      return Padding(
        padding: EdgeInsets.only(top: 200, bottom: 20),
        child: new Container(
          child: Align(
            child: Text(
              label,
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: _input(
                    'Email', _emailController, Icon(Icons.email), false)),
            new Padding(
              padding: EdgeInsets.only(bottom: 20),
              child:
                  _input('Password', _passController, Icon(Icons.lock), true),
            ),
            SizedBox(
              height: 20,
            ),
            new Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: new Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    void _actionUser() {
      _email = _emailController.text;
      _pass = _passController.text;

      _emailController.clear();
      _passController.clear();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo('LOGO'),
          (_showLogin
              ? new Column(
                  children: <Widget>[
                    _form('Login', _actionUser),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text(
                          'Register..',
                          style:
                              TextStyle(fontSize: 20, color: Colors.deepPurple),
                        ),
                        onTap: () {
                          setState(() {
                            _showLogin = false;
                          });
                        },
                      ),
                    )
                  ],
                )
              : new Column(
                  children: <Widget>[
                    _form('Register', _actionUser),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text(
                          'Login..',
                          style:
                              TextStyle(fontSize: 20, color: Colors.deepPurple),
                        ),
                        onTap: () {
                          setState(() {
                            _showLogin = true;
                          });
                        },
                      ),
                    )
                  ],
                ))
        ],
      ),
    );
  }
}
