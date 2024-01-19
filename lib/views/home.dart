import 'package:flutter/material.dart';
import '../controllers/authentifications_controller.dart';
import '../views/Auth/login.dart';
import '../views/investisseur_data.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {

   const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthentificationController _authentificationController=Get.put(AuthentificationController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Acceuil",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
              onPressed: (){
            Get.offAll(()=>LoginPage());
          }, icon: Icon(Icons.logout,))
        ],

      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Obx((){
            return _authentificationController.isLoading.value ?
                Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                child: ListView.builder(
                itemCount: _authentificationController.investisseurs.value.length,
                itemBuilder: ( context, index) {
                  return Center(child: InvestisseurData(investisseur: _authentificationController.investisseurs.value[index]));
                },
                            ),
              );
          }
        ),

      ),
    );
  }
}
