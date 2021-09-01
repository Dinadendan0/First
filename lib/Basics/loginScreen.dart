import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
   var emailcontroller = TextEditingController() ;
   var passwordcontroller = TextEditingController() ;
   var formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Text('Login',
                  style: TextStyle(
                    fontSize: 40,
                     fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailcontroller ,
                  onFieldSubmitted: (String value){
                    print(value);
                    },
                  onChanged: (String value){
                    print(value);
                  },
                  validator: (value){
                    if (value.isEmpty)
                      {
                        return 'email address must not be empty';
                      }
                    return null ;
                  },
                  keyboardType: TextInputType.emailAddress ,
                  decoration: InputDecoration(
                    labelText: 'Email address ',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (String value){
                    print(value);
                  },
                  validator: (value){
                    if (value.isEmpty)
                    {
                      return'password must not be empty' ;
                    }
                    return null ;
                  },
                  keyboardType: TextInputType.visiblePassword ,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password ',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),

                    border: OutlineInputBorder(),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.blue,
                  child: MaterialButton(
                      onPressed:() {
                       
                        {
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                        }
                  },

                    child: Text(
                      'Login' ,style: TextStyle(
                      color: Colors.white,
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                    ),

                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                    ),
                    TextButton(onPressed: () {},
                      child: Text(
                        'Register Now ' ,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
