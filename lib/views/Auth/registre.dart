import 'package:flutter/material.dart';
import '../../controllers/authentifications_controller.dart';
import '../../models/investisseur_model.dart';
import '../../views/Auth/login.dart';
import '../../widget/input_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrePage extends StatefulWidget {
  final InvestisseurModel? investisseur;
  const RegistrePage({super.key,this.investisseur});

  @override
  State<RegistrePage> createState() => _RegistrePageState();
}

class _RegistrePageState extends State<RegistrePage> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmePassController = TextEditingController();
  final AuthentificationController _authentificationController=Get.put(AuthentificationController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return  Scaffold( resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('INSCRIPTION ETAPE 2/2', style: TextStyle(color: Colors.blueAccent, fontSize:30, fontWeight: FontWeight.bold),),
                SizedBox(height:20 ,),
                Container(
                  padding: EdgeInsets.zero ,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _authentificationController.recuperations.value.length,
                      itemBuilder: ( context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Divider(height: 10, ),
                                  Text(_authentificationController.recuperations.value[index].prenom!+' '+_authentificationController.recuperations.value[index].nom!,
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height:5 ,),
                                  Text( _authentificationController.recuperations.value[index].email!),
                                  Divider(height: 10,),
                                ],
                              ),
                              SizedBox(height:25 ,),
                              InputWidget(
                                hinText: "Saisie le mot de passe",
                                obscureText: true ,
                                controller: _passController,
          
                              ),
                              SizedBox(height:10 ,),
                              InputWidget(
                                hinText: "Confirmer le mot de passe",
                                obscureText: true ,
                                controller: _confirmePassController,
                              ),
                              SizedBox(height:10 ,),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                                  ),
                                  onPressed: (){
                                    if(_passController.text.trim()==_confirmePassController.text.trim()){
                                      _authentificationController.register(password: _passController.text.trim(), code:_authentificationController.recuperations.value[index].code!);
                                    }else{
                                      Get.snackbar('Error',
                                          "La confirmation n'est pas conforme",
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor: Colors.redAccent,
                                          colorText:Colors.white
                                      );
                                    }
                                  },
                                  child: Text('Valider',style: GoogleFonts.poppins(
                                      fontSize: size*0.040,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),)
                              ),
                            ],
                        );
                      },
          
                    ),
                  ),
                ),
                SizedBox(height:10 ,),
                TextButton(onPressed: (){
                  Get.offAll(()=>LoginPage()
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
        ),
      ),
    );
  }
}
