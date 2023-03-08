import "package:flutter/material.dart";
import "package:tutorial_1/utils/routes.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/search.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter UserName",
                      labelText: "UserName",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username Cannot Be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password Cannot Be empty";
                      } else if (value.length < 6) {
                        return "Password length cannot be less than 6 ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 25 : 10),
                    child: InkWell(
                      splashColor: Colors.amber,
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: changeButton ? 50 : 150,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, Myroutes.homeRoute);
                  //   },
                  //   child: Text("Login"),
                  //   style: ElevatedButton.styleFrom(
                  //     fixedSize: Size(100, 50),
                  //     shadowColor: Colors.black12,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20)),
                  //   ),
                  // )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
