import 'package:flutter/material.dart';
import '../constantes/widget_format.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../controllers/investisseur_controller.dart';
import 'home.dart';

class MouvementDividende extends StatelessWidget {
  const MouvementDividende({super.key});

  @override
  Widget build(BuildContext context) {

    final InvestisseurController _investisseurController = Get.put(InvestisseurController());

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Mouvement dividende", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: (){
                Get.offAll(()=>HomePage());
              }, icon: Icon(Icons.arrow_back,))
        ],
      ),
      body: Container(
        child: Center(
          child: Container(
            child:Obx((){
              return ListView.builder(
                  itemCount: _investisseurController.operations_dividende.value.length,
                  itemBuilder: ( context, index) {
                    _investisseurController.operations_dividende.value[index];
                    if(_investisseurController.operations_dividende.value[index].sensOperation=="entree"){
                      return   Card(
                        child: ListTile(
                          leading: Icon(Icons.money),
                          trailing:  Text(
                            formatter.format(double.parse((_investisseurController.operations_dividende.value[index].montantOperation).replaceAll(",", " ")))+ " XOF "
                            ,
                            style: TextStyle(color: Colors.green, fontSize: 25),
                          ),
                          title: Text("Dépôt",style: TextStyle(color: Colors.green,fontSize:25, fontWeight: FontWeight.bold),),
                          subtitle: Text(
                            df.format(_investisseurController.operations_dividende.value[index].createdAt),
                            style: TextStyle(color: Colors.black),),
                          onTap: (){

                          },
                        ),
                      );

                    }else{
                      return   Card(
                        child: ListTile(
                          leading: Icon(Icons.money),
                          trailing:  Text(
                            formatter.format(double.parse((_investisseurController.operations_dividende.value[index].montantOperation).replaceAll(",", " ")))+ " XOF ",
                            style: TextStyle(color: Colors.red, fontSize: 25),
                          ),
                          title: Text("Retrait",style: TextStyle(color: Colors.red,fontSize:25, fontWeight: FontWeight.bold),),
                          subtitle: Text(
                            df.format(_investisseurController.operations_dividende.value[index].createdAt),
                            style: TextStyle(color: Colors.black),),
                          onTap: (){

                          },
                        ),
                      );
                    }


                  }
              );
            }),

          ),
        ),
      ) ,
    );
  }
}
