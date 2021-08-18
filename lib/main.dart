import 'package:flutter/material.dart';
import 'package:task1/screens/signUp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LogForm(),
  ));
}

class LogForm extends StatefulWidget {
  const LogForm({key}) : super(key: key);

  @override
  _LogFormState createState() => _LogFormState();
}

class _LogFormState extends State<LogForm> {
  GlobalKey<FormState> _key = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Warpe Technmology'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          decoration: BoxDecoration(
            color: const Color(0xff7c86b6),
            image: DecorationImage(
              image: AssetImage(
                "images/login.jpg",
              ),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black87.withOpacity(0.9), BlendMode.dstATop),
            ),
          ),
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
    );
  }
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

String name, mobile, pass, cpass;
Widget formUI(BuildContext context) {
  return Center(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 85.0,
        ),
        CircleAvatar(
            radius: 62.0,
            backgroundColor: Colors.black,
            child: Image.asset("images/warpe.jpeg")),
        SizedBox(
          height: 45.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Mobile Number',
            focusColor: Colors.white54,
            fillColor: Colors.white54,
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
          height: 30.0,
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
          onPressed: () {},
          child: Text(
            'Login',
            style: TextStyle(fontSize: 30.0, color: Colors.green),
          ),
        ),
        TextButton(
            child: Text(
              'Dnot hava an acoount? SignUp',
              style: TextStyle(color: Colors.purple, fontSize: 15.0),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Signup()));
            }),
        SizedBox(
          height: 0.0,
        ),
      ],
    ),
  );
}
