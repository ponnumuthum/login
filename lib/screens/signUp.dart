import 'package:flutter/material.dart';
import 'package:task1/main.dart';

class Signup extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Signup> {
  GlobalKey<FormState> _key = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  bool _validate = false;
  String name, mobile, pass, cpass;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Text('Registration Page'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Center(
              child: Form(
                child: formUI(context),
                key: _key,
                // ignore: deprecated_member_use
                autovalidate: _validate,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget formUI(context) {
    return Center(
      child: Column(
        children: <Widget>[
          //Hero(
           // tag: 'hero',
             CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 60.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(''),
                 // backgroundImage:Image.asset('images/warpe.jepg'),
                  radius: 98,)),
         // ),
          SizedBox(
            height: 45.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Your Name',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            validator: validateName,
            onSaved: (String val) {
              name = val;
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Mobile Number',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            keyboardType: TextInputType.phone,
            validator: validateMobile,
            onSaved: (String val) {
              mobile = val;
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: validatePass,
            onSaved: (String val) {
              pass = val;
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextButton(
            onPressed: _register,
            child: Text('Register'),
          ),
          TextButton(
            child: Text(
              'Already hava an acoount? Login',
              style: TextStyle(color: Colors.purple, fontSize: 15.0),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogForm()));
            },
          ),
          SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }

  String validateName(String value) {
    String pattern = r'([a-zA-Z]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String pattern = r'([0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return "Phone Number is Required";
    } else if (value.length != 10) {
      return "Mobile number must be 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile number must be 0-19";
    }
    return null;
  }

  String validatePass(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Password must be contain at least one upper case ,one lower case,one digit,one special character";
    }
    return null;
  }

  _register() {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text("Register Successfully"),
      ));
      Navigator.of(context)
          .pop(MaterialPageRoute(builder: (contex) => LogForm()));
    } else {
      setState(() {
        _validate = true;
      });
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text("Register not Successfully"),
      ));
    }
  }
}
