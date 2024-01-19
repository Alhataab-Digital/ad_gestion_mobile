import 'package:flutter/material.dart';
import '../constantes/widget_format.dart';
import '../controllers/investisseur_controller.dart';
import '../models/investisseur_model.dart';
import '../views/mouvement_compte.dart';
import '../views/mouvement_dividende.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestisseurData extends StatelessWidget {
  final InvestisseurModel investisseur;

   InvestisseurData({super.key , required this.investisseur});

  final InvestisseurController _investisseurController = Get.put(InvestisseurController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    return Center(
          child: Padding(
            padding: EdgeInsets.all(08),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.grey,
                      child: Container(
                        padding: EdgeInsets.all(05),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(investisseur.nom.toString(),
                                                style: GoogleFonts.poppins(
                                                    fontSize: size*0.040,
                                                    color: Colors.white,
                                                    fontWeight:FontWeight.bold,),
                                              ),
                                              SizedBox(width:10,),
                                              Text(investisseur.prenom.toString(),
                                                style: GoogleFonts.poppins(
                                                  fontSize: size*0.040,
                                                  color: Colors.white,
                                                  fontWeight:FontWeight.bold,),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(investisseur.email.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                                            ],
                                          )
                                        ],
                                      ),
                                  ),
                    ),
                    Card(
                      color: Colors.green,
                      child: Container(
                        padding: EdgeInsets.all(05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Montant investie",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  formatter.format(double.parse((investisseur.montantInvestis)!.replaceAll(",", "")))+ " XOF ",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.amberAccent,
                      child: Container(
                        padding: EdgeInsets.all(05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Montant dividende",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(formatter.format(double.parse((investisseur.compteDividende)!.replaceAll(",", ".")))+ " XOF ",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(color: Colors.black,height:20,),
                    Container(
                        padding: EdgeInsets.all(05),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        elevation: 0,
                                        //padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                                      ),
                                      onPressed: (){
                                        _investisseurController.getOperation_investisseur(id: investisseur.id.toString());
                                      },
                                      child: Text("Mouvement compte",style: GoogleFonts.poppins(
                                        fontSize: size*0.040,
                                        color: Colors.white,
                                        fontWeight:FontWeight.bold,
                                      ),)),
                                  SizedBox(height: 20,),
                                  ElevatedButton(style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                    //padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                                  ),
                                      onPressed: (){
                                        _investisseurController.getOperation_dividende(id: investisseur.id.toString());
                                      },
                                      child: Text("Mouvement dividende",style: GoogleFonts.poppins(
                                        fontSize: size*0.040,
                                        color: Colors.white,
                                        fontWeight:FontWeight.bold,
                                      ),))
                                  ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    Divider(color: Colors.black,)
                  ],
                ),
              )

          ),
    );
  }
}
