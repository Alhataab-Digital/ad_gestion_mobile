import 'package:flutter/material.dart';
import '../../controllers/authentifications_controller.dart';
import '../../views/Auth/login.dart';
import '../../widget/input_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeInvestisseur extends StatefulWidget {
  const CodeInvestisseur({super.key});

  @override
  State<CodeInvestisseur> createState() => _CodeInvestisseurState();
}

class _CodeInvestisseurState extends State<CodeInvestisseur> {
  final TextEditingController _codeController = TextEditingController();
  final AuthentificationController _authentificationController=Get.put(AuthentificationController());


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
                Text('INSCRIPTION ETAPE 1/2 ', style: TextStyle(color: Colors.blueAccent, fontSize:30, fontWeight: FontWeight.bold),),
                SizedBox(height:30 ,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InputWidget(
                        hinText: "Saisie ton code",
                        obscureText: false ,
                        controller: _codeController,
                      ),
                      SizedBox(height:10 ,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                          ),
                          onPressed: (){
                            _authentificationController.getCode(code: _codeController.text.trim());
                          },
                          child: Text('Valider',style: GoogleFonts.poppins(
                              fontSize: size*0.040,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),)
                      ),
                      SizedBox(height:10 ,),
                      TextButton(onPressed: (){
                        Get.to(()=>LoginPage()
                        );
                      },
                          child: Row(
                            children: [
                              Text("Vous avez un compte ?",style: GoogleFonts.poppins(
                                fontSize: size*0.030,
                                color: Colors.black,
                                fontWeight:FontWeight.bold,
                              ),),
                              SizedBox(width: 10,),
                              Text('Connexion', style: GoogleFonts.poppins(
                                  fontSize: size*0.040,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ))
                    ],
                  ),
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
