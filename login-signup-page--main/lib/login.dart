import 'package:flutter/material.dart';
class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png'),fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35,top: 90),
              child:const Text('Welcome\nBack',style: TextStyle(
                color: Colors.white,
                fontSize: 33
              ),)
            ),

            SingleChildScrollView(
              child: Container(
                padding:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.45,left:35,right:35),
                child:Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled:true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(

                        fillColor: Colors.grey.shade100,
                        filled:true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                     const SizedBox(
                       height: 40,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Sign In',style:TextStyle(
                            fontSize:27,
                            color: Color(0xff4c505b),
                            fontWeight: FontWeight.w700,

                          )),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff4c505b),
                            child:IconButton(
                              color: Colors.white,
                              onPressed: (){},
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ],
                    ),
                    const SizedBox(
                      height: 20
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, 'Register');
                            } ,
                            child: const Text('Sign Up',style:TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            )
                            )
                        ),
                        TextButton(onPressed: (){},
                            child: const Text('Forget Password',
                              style:TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff4c505b)
                              ),
                            ))
                      ],
                    ),
                  ],
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}
