import 'package:flutter/material.dart';
import '../../controllers/authentifications_controller.dart';
import '../../views/Auth/code_investisseur.dart';
import '../../widget/input_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthentificationController _authentificationController=Get.put(AuthentificationController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('CONNEXION', style: TextStyle(color: Colors.blue, fontSize:30, fontWeight: FontWeight.bold),),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  SizedBox(height:30 ,),
                InputWidget(
                  hinText: "Email",
                  obscureText: false ,
                  controller: _emailController,
                ),
                SizedBox(height:10 ,),
                InputWidget(
                  hinText: "Password",
                  obscureText: true ,
                  controller: _passwordController,
                ),
                SizedBox(height:10 ,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    ),
                    onPressed: (){
                      _authentificationController.login(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim()
                      );
                    },
                    child: Text('Connexion',style: GoogleFonts.poppins(
                        fontSize: size*0.040,
                        fontWeight:FontWeight.bold,
                        color: Colors.white
                    ),)
                ),
          
                  ],
                ),
              ),
              SizedBox(height:10 ,),
              Row(
                children: [
                  Text("Vous n'avez pas de compte ?",style: GoogleFonts.poppins(
                      fontSize: size*0.030,
                      color: Colors.black,
                      fontWeight:FontWeight.bold,
                    ),),
                  SizedBox(width: 10,),
                  TextButton(onPressed: (){
                   Get.to(()=>CodeInvestisseur()
                   );
                  },
                      child: Text("S'inscrire", style: GoogleFonts.poppins(
                        fontSize: size*0.040,
                        color: Colors.blue,
                        fontWeight:FontWeight.bold,
                      ),)),
                ],
              )
            ],
            ),
          ),
        ),
      ),
    );
  }
}
