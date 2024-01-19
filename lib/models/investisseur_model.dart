// To parse this JSON data, do
//
//     final investisseurModel = investisseurModelFromJson(jsonString);

import 'dart:convert';

InvestisseurModel investisseurModelFromJson(String str) => InvestisseurModel.fromJson(json.decode(str));

String investisseurModelToJson(InvestisseurModel data) => json.encode(data.toJson());

class InvestisseurModel {
  int? id;
  String? code;
  String? nom;
  String? prenom;
  String? telephone;
  String? email;
  String? password;
  String? heritier;
  String? montantInvestis;
  String? compteInvestisseur;
  String? compteDividende;
  String? etat;
  String? agenceId;
  int? societeId;
  DateTime? dateCreation;
  DateTime? createdAt;
  DateTime? updatedAt;

  InvestisseurModel({
     this.id,
     this.code,
     this.nom,
     this.prenom,
     this.telephone,
     this.email,
     this.password,
     this.heritier,
     this.montantInvestis,
     this.compteInvestisseur,
     this.compteDividende,
     this.etat,
     this.agenceId,
     this.societeId,
     this.dateCreation,
     this.createdAt,
     this.updatedAt,
  });

  factory InvestisseurModel.fromJson(Map<String, dynamic> json) => InvestisseurModel(
    id: json["id"],
    code: json["code"],
    nom: json["nom"],
    prenom: json["prenom"],
    telephone: json["telephone"],
    email: json["email"],
    password: json["password"],
    heritier: json["heritier"],
    montantInvestis: json["montant_investis"],
    compteInvestisseur: json["compte_investisseur"],
    compteDividende: json["compte_dividende"],
    etat: json["etat"],
    agenceId: json["agence_id"],
    societeId: json["societe_id"],
    dateCreation: DateTime.parse(json["date_creation"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "nom": nom,
    "prenom": prenom,
    "telephone": telephone,
    "email": email,
    "password": password,
    "heritier": heritier,
    "montant_investis": montantInvestis,
    "compte_investisseur": compteInvestisseur,
    "compte_dividende": compteDividende,
    "etat": etat,
    "agence_id": agenceId,
    "societe_id": societeId,
    "date_creation": "${dateCreation?.year.toString().padLeft(4, '0')}-${dateCreation?.month.toString().padLeft(2, '0')}-${dateCreation?.day.toString().padLeft(2, '0')}",
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };

}
