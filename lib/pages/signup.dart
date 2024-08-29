import 'dart:convert';

import 'package:app_manda_fresh/pages/dashboard.dart';
import 'package:app_manda_fresh/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

Color couleurApp = Color.fromRGBO(17, 186, 24, 1);

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _passwordVisible = false;
  bool _mandaPasswordVisible = false;

  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        textAlign: TextAlign.left,
                        "Vos informations personnelles",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Renseignez vos informations en dessous ou inscrivez-vous avec votre compte social",
                      ),
                    ),
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: FormBuilderTextField(
                              name: "nom",
                              cursorColor: couleurApp,
                              validator: FormBuilderValidators.required(
                                  errorText: "Veillez remplir ce champ"),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.1),
                                labelText: "Nom",
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: "Entrez votre nom",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: couleurApp),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: FormBuilderTextField(
                              name: "prenom",
                              cursorColor: couleurApp,
                              validator: FormBuilderValidators.required(
                                  errorText: "Veillez remplir ce champ"),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.1),
                                labelText: "Prénom",
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: "Entrez votre prénom",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: couleurApp),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: FormBuilderDateTimePicker(
                              name: "dateNaissance",
                              validator: FormBuilderValidators.required(
                                  errorText: "Veillez remplir ce champ"),
                              inputType: InputType.date,
                              format: DateFormat("dd/MM/yyyy"),
                              initialDate: DateTime.now(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.1),
                                labelText: "Date de naissance",
                                labelStyle: TextStyle(fontSize: 20),
                                hintText:
                                    "Sélectionnez votre date de naissance",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: couleurApp),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: FormBuilderTextField(
                              name: "profession",
                              cursorColor: couleurApp,
                              validator: FormBuilderValidators.required(
                                  errorText: "Veillez remplir ce champ"),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.1),
                                labelText: "Profession",
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: "Entrez votre profession",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: couleurApp),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: FormBuilderTextField(
                              name: "email",
                              cursorColor: couleurApp,
                              validator: FormBuilderValidators.email(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.1),
                                labelText: "Email",
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: "Entrez votre email",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: couleurApp),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: FormBuilderTextField(
                              name: "password",
                              validator: FormBuilderValidators.required(
                                  errorText: "Veillez remplir ce champ"),
                              cursorColor: couleurApp,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.1),
                                labelText: "Mot de passe",
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                hintText: "Entrez votre mot de passe",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: couleurApp),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 30),
                              child: Text(
                                "Informations de votre MandaFresh",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: FormBuilderTextField(
                              name: "identifiant",
                              cursorColor: couleurApp,
                              validator: FormBuilderValidators.required(
                                  errorText: "Veillez remplir ce champ"),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.1),
                                labelText: "Identifiant",
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: "Identifiant du MandaFresh",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: couleurApp),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: FormBuilderTextField(
                              name: "motDePasseDispositif",
                              cursorColor: couleurApp,
                              validator: FormBuilderValidators.required(
                                  errorText: "Veillez remplir ce champ"),
                              obscureText: !_mandaPasswordVisible,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.1),
                                labelText: "Mot de passe du MandaFresh",
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: "Entrez le mot de passe",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _mandaPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _mandaPasswordVisible =
                                          !_mandaPasswordVisible;
                                    });
                                  },
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: couleurApp),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          FormBuilderCheckbox(
                            name: 'accept_terms',
                            initialValue: false,
                            title: Text(
                              "J'accepte les termes et conditions",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                color: Colors.blue,
                              ),
                            ),
                            validator: FormBuilderValidators.equal(
                              true,
                              errorText:
                                  'Vous devez accepter les termes et conditions pour continuer.',
                            ),
                            onChanged: (value) {
                              setState(() {
                                checked = value ?? false;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 20),
                            child: GFButton(
                              onPressed: () async {
                                if (_formKey.currentState?.saveAndValidate() ??
                                    false) {
                                  _submitForm(); // Corrected method call
                                  // Handle form submission
                                } else {
                                  // Handle validation errors
                                }
                              },
                              shape: GFButtonShape.pills,
                              fullWidthButton: true,
                              textColor: Colors.white,
                              size: GFSize.LARGE,
                              color: GFColors.PRIMARY,
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              text: "S'inscrire",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 0.5,
                                    child: ColoredBox(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text("Ou connectez-vous avec"),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 0.5,
                                    child: ColoredBox(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Padding(
                              padding: EdgeInsets.only(left: 40, right: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildSocial(
                                      image: Image.asset(
                                          "assets/images/apple.png")),
                                  buildSocial(
                                      image: Image.asset(
                                          "assets/images/google.png")),
                                  buildSocial(
                                      image: Image.asset(
                                          "assets/images/facebook.png")),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Vous avez un compte ?"),
                          GestureDetector(
                            onTap: () {
                              Get.to(Login());
                            },
                            child: Text(
                              " Se connecter",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

void _submitForm() async {
  try {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState?.value;
      final dateNaissance = formData?['dateNaissance'];
      final formattedDateNaissance = dateNaissance != null
          ? '${dateNaissance.year.toString().padLeft(4, '0')}-${dateNaissance.month.toString().padLeft(2, '0')}-${dateNaissance.day.toString().padLeft(2, '0')}'
          : null;
      final identifiant = formData?['identifiant'];
      final motDePasseDispositif = formData?['motDePasseDispositif'];

      // Étape 1: Obtenir la liste des dispositifs
      final dispositifsResponse = await http.get(
        Uri.parse('https://mcellou.pythonanywhere.com/api/dispositifs/'),
      );

      if (dispositifsResponse.statusCode == 200) {
        final List dispositifs = jsonDecode(dispositifsResponse.body);
        final dispositifTrouve = dispositifs.firstWhere(
          (dispositif) =>
              dispositif['id'] == identifiant &&
              dispositif['mot_de_passe_dispositif'] == motDePasseDispositif,
          orElse: () => null,
        );

        if (dispositifTrouve != null) {
          // Étape 2: Inscription de l'utilisateur
          final utilisateurResponse = await http.post(
            Uri.parse('https://mcellou.pythonanywhere.com/api/utilisateurs/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'nom': formData?['nom'],
              'prenom': formData?['prenom'],
              'profession': formData?['profession'],
              'email': formData?['email'],
              'mot_de_passe': formData?['password'],
              'date_de_naissance': formattedDateNaissance,
              'cree_a': DateTime.now().toIso8601String(),
              'modifie_a': DateTime.now().toIso8601String(),
            }),
          );

          if (utilisateurResponse.statusCode == 200) {
            final utilisateurData = jsonDecode(utilisateurResponse.body);

            if (utilisateurData.containsKey('id')) {
              final utilisateurId = utilisateurData['id'];

              // Étape 3: Lier l'utilisateur au dispositif
              final utilisateurDispositifResponse = await http.post(
                Uri.parse(
                    'https://mcellou.pythonanywhere.com/api/utilisateurs-dispositifs'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, dynamic>{
                  'cree_a': DateTime.now().toIso8601String(),
                  'modifie_a': DateTime.now().toIso8601String(),
                  'utilisateur': utilisateurId,
                  'dispositif': identifiant,
                }),
              );

              if (utilisateurDispositifResponse.statusCode == 200) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Inscription réussie !')),
                );
                Get.offAll(DashboardPage()); // Redirect to the Dashboard
              } else {
                print('Erreur lors de la liaison avec le dispositif : ${utilisateurDispositifResponse.statusCode}');
                print('Réponse : ${utilisateurDispositifResponse.body}');
              }
            } else {
              print('Erreur lors de l\'inscription utilisateur : Pas d\'ID trouvé');
            }
          } else {
            print('Erreur lors de l\'inscription utilisateur : ${utilisateurResponse.statusCode}');
            print('Réponse : ${utilisateurResponse.body}');
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Identifiant ou mot de passe du dispositif incorrect')),
          );
        }
      } else {
        print('Erreur lors de la récupération des dispositifs : ${dispositifsResponse.statusCode}');
        print('Réponse : ${dispositifsResponse.body}');
      }
    } else {
      print('Formulaire invalide');
    }
  } catch (e) {
    print('Exception : $e');
  }
}


  Widget buildSocial({required Image image}) {
    return Container(
      height: 70,
      width: 70,
      padding: EdgeInsets.all(20),
      child: image,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
