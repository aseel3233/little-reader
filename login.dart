import 'package:book/challenge.dart';
import 'package:book/navbar.dart';
import 'package:book/register.dart';
import 'package:flutter/material.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
                 key: _formKey ,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                        children:[
                          const SizedBox(height: 80,),
                          Image.asset("images/ce.png"),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(labelText:'ادخل ايميلك ' ,
                                hintText: 'ex:test@gmail.com'),
                              validator: (value) {
                                const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                final regExp = RegExp(pattern);

                                if (value == null || value.isEmpty) {
                                  return 'هذا الحقل ضروري';
                                } else if (!regExp.hasMatch(value)) {
                                  return "هذا الايميل غير صحيح";
                                }
                                return null;
                              },
                            ),
                            ),
                          const SizedBox(height: 12),

                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(labelText:'ادخل كلمة المرور ', ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'هذا الحقل ضروري';
                                } else if (value.length < 6) {
                                  return "أدخل 6 خانات على الأقل";
                                }
                                return null;
                              },

                            ),
                          ),
                          const SizedBox(height: 20),

                          SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal,),
                              onPressed: (){
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Navbar()),
                                        (Route<dynamic> route) => false,
                                  );
                                } else {
                                  print("لم يتم التحقق");
                                }

                              },
                              // onPressed: ()=> Navigator.of(context).pushNamed('login'),
                              child: const Text('تسجيل الدخول', style: TextStyle
                                (color: Colors.white ,fontSize: 25, fontWeight: FontWeight.bold ), ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          TextButton(
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const Register()),
                                    (Route<dynamic> route) => false,
                              );
                            },                        child: const Text('ليس لدي حساب',
                              style: TextStyle(color: Colors.deepPurple,
                                  fontSize: 20 ,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                  ),
                  ),
        )
        );
  }
}

