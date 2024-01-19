import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/operation_dividende_model.dart';
import '../models/operation_investisseur_model.dart';
import '../views/mouvement_dividende.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../constantes/url.dart';
import '../views/mouvement_compte.dart';

class InvestisseurController extends GetxController{


    final isLoading = false.obs;
    final token= ''.obs;
    final box = GetStorage();

    Rx<List<OperationDividendeModel>> operations_dividende =Rx<List<OperationDividendeModel>>([]);

    Rx<List<OperationInvestisseurModel>> operations_investisseur =Rx<List<OperationInvestisseurModel>>([]);

    Future getOperation_investisseur({required String id}) async{
        isLoading.value=true;
        var data ={
            'investisseur_id':id,
        };
        var response = await http.post(
            Uri.parse('${url}operation/investisseur'),
            headers: {
                'Accept':"application/json"
            },
            body: data,
        );
        try{
            if( response.statusCode==200){
                isLoading.value=false;
                var data=jsonDecode(response.body)['operations'];
                if(data!=null){
                    operations_investisseur.value.clear();
                    for(var i in data){
                        operations_investisseur.value.add(OperationInvestisseurModel.fromJson(i));
                        Get.to(()=>MouvementCompte());
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

    Future getOperation_dividende({required String id}) async{
        isLoading.value=true;
        var data ={
            'investisseur_id':id,
        };
        var response = await http.post(
            Uri.parse('${url}operation/dividende'),
            headers: {
                'Accept':"application/json"
            },
            body: data,
        );
        try{
            if( response.statusCode==200){
                isLoading.value=false;
                var data=jsonDecode(response.body)['operations'];
                if(data!=null){
                    operations_dividende.value.clear();
                    for(var i in data){
                        operations_dividende.value.add(OperationDividendeModel.fromJson(i));
                        Get.to(()=>MouvementDividende());
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