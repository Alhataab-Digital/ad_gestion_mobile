import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../constantes/url.dart';
import '../models/investisseur_model.dart';
import '../views/Auth/login.dart';
import '../views/Auth/registre.dart';
import '../views/home.dart';

class AuthentificationController extends GetxController{
  final isLoading = false.obs;
  final token= ''.obs;
  final box = GetStorage();
  Rx<List<InvestisseurModel>> investisseurs =Rx<List<InvestisseurModel>>([]);
  Rx<List<InvestisseurModel>> recuperations =Rx<List<InvestisseurModel>>([]);

  @override


  Future login({required String email, required String password}) async{
    isLoading.value=true;
          var data ={
              'email':email,
              'password':password
              };
        var response = await http.post(
          Uri.parse('${url}portail/connect'),
          headers: {
            'Accept':"application/json"
          },
          body: data,
        );
        try{
          if( response.statusCode==200){
            isLoading.value=false;
            final data=jsonDecode(response.body)['investisseur'];
            if(data!=null){
                investisseurs.value.clear();
                investisseurs.value.add(InvestisseurModel.fromJson(data));
                Get.offAll(()=>HomePage());
            }else{
            isLoading.value=false;
            Get.snackbar('Error',
                jsonDecode(response.body)["message"],
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.redAccent,
                colorText:Colors.white
            );
          }
          }else{
            isLoading.value=false;
           Get.snackbar('Error',
              jsonDecode(response.body)["message"],
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.redAccent,
              colorText:Colors.white
           );
          }
        }catch(e){
          isLoading.value=false;
          print(e.toString());
        }
  }


  Future getCode({required String code}) async{
    isLoading.value=true;

    var data ={
      'code':code,
    };
    var response = await http.post(
      Uri.parse('${url}portail/recuperation'),
      headers: {
        'Accept':"application/json"
      },
      body: data,
    );
    try{
      if( response.statusCode==200){
        isLoading.value=false;
        final data=jsonDecode(response.body)["investisseur"];
        if(data!=null){
            recuperations.value.clear();
            print(data);
            recuperations.value.add(InvestisseurModel.fromJson(data));
            Get.offAll(()=>RegistrePage());
        }else{
          isLoading.value=false;
          Get.snackbar('Error',
              jsonDecode(response.body)["message"],
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.redAccent,
              colorText:Colors.white
          );
        }

      }else{
        isLoading.value=false;
        Get.snackbar('Error',
            jsonDecode(response.body)["message"],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent,
            colorText:Colors.white
        );
      }
    }catch(e){
      isLoading.value=false;
      print(e.toString());
    }
  }

    Future register({required String code,required String password}) async{
      isLoading.value=true;
      var data ={
        'code': code,
        'password':password
      };
      var response = await http.post(
        Uri.parse('${url}portail/inscription'),
        headers: {
          'Accept':"application/json"
        },
        body: data,
      );
      try{
        if( response.statusCode==200){
            isLoading.value=false;
            Get.to(()=>LoginPage());
            Get.snackbar('Error',
                jsonDecode(response.body)["message"],
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.green,
                colorText:Colors.white
            );
        }else{
          isLoading.value=false;
          Get.snackbar('Error',
              jsonDecode(response.body)["message"],
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.redAccent,
              colorText:Colors.white
          );
        }
      }catch(e){
        isLoading.value=false;
        print(e.toString());
      }
    }
}