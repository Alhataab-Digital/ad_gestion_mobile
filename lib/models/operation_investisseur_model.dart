// To parse this JSON data, do
//
//     final operationInvestisseurModel = operationInvestisseurModelFromJson(jsonString);

import 'dart:convert';

OperationInvestisseurModel operationInvestisseurModelFromJson(String str) => OperationInvestisseurModel.fromJson(json.decode(str));

String operationInvestisseurModelToJson(OperationInvestisseurModel data) => json.encode(data.toJson());

class OperationInvestisseurModel {
  int id;
  String montantOperation;
  String sensOperation;
  String reglementId;
  String caisseId;
  String investisseurId;
  String userId;
  DateTime dateComptable;
  DateTime createdAt;
  DateTime updatedAt;

  OperationInvestisseurModel({
    required this.id,
    required this.montantOperation,
    required this.sensOperation,
    required this.reglementId,
    required this.caisseId,
    required this.investisseurId,
    required this.userId,
    required this.dateComptable,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OperationInvestisseurModel.fromJson(Map<String, dynamic> json) => OperationInvestisseurModel(
    id: json["id"],
    montantOperation: json["montant_operation"],
    sensOperation: json["sens_operation"],
    reglementId: json["reglement_id"],
    caisseId: json["caisse_id"],
    investisseurId: json["investisseur_id"],
    userId: json["user_id"],
    dateComptable: DateTime.parse(json["date_comptable"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "montant_operation": montantOperation,
    "sens_operation": sensOperation,
    "reglement_id": reglementId,
    "caisse_id": caisseId,
    "investisseur_id": investisseurId,
    "user_id": userId,
    "date_comptable": "${dateComptable.year.toString().padLeft(4, '0')}-${dateComptable.month.toString().padLeft(2, '0')}-${dateComptable.day.toString().padLeft(2, '0')}",
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
