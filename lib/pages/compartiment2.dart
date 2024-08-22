import 'package:app_manda_fresh/constant/colors.dart';
import 'package:app_manda_fresh/widget/numero_produit.dart';
import 'package:flutter/material.dart';
import 'package:app_manda_fresh/widget/numero_produit.dart';

class PageCompartimentDeux extends StatefulWidget {
  @override
  _PageCompartimentDeuxState createState() => _PageCompartimentDeuxState();
}

class _PageCompartimentDeuxState extends State<PageCompartimentDeux> {
  bool _isExpandedFroid = true;
  bool _isExpandedFroidProduits = true;

  bool _isExpandedChaud = true;
  bool _isExpandedChaudProduits = true;

  // Exemple de liste de produits
  final List<Map<String, String>> produits = List.generate(
    12,
    (index) =>
        {'imagePath': 'assets/images/ananas.png', 'name': 'Produit $index'},
  );

  // Liste des produits ajoutés
  List<String> produitsAjoutes = [];

  // Liste des catégories
  final List<String> categories = ['Orange', 'Mangue', 'Ananas', 'Banane'];

  // Variables pour le formulaire
  String? _selectedCategory;
  final TextEditingController _productNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCompartimentHeader(
          'Compartiment froid',
          _isExpandedFroid,
          () => setState(() {
            _isExpandedFroid = !_isExpandedFroid;
          }),
        ),
        _buildAnimatedContainer(
          _isExpandedFroid,
          _buildFroidContent(),
        ),
        _buildCompartimentHeader(
          'Compartiment chaud',
          _isExpandedChaud,
          () => setState(() {
            _isExpandedChaud = !_isExpandedChaud;
          }),
        ),
        _buildAnimatedContainer(
          _isExpandedChaud,
          _buildChaudContent(),
        ),
      ],
    );
  }

  Widget _buildCompartimentHeader(
      String title, bool isExpanded, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
          onPressed: onPressed,
        ),
      ],
    );
  }

  Widget _buildAnimatedContainer(bool isExpanded, Widget content) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isExpanded ? null : 0,
      child: SingleChildScrollView(
        child: content,
      ),
    );
  }

  Widget _buildFroidContent() {
    return Column(
      children: <Widget>[
        _buildTemperatureRow('Température actuelle', '3°C'),
        _buildProduitListHeader(
          'Liste des produits',
          _isExpandedFroidProduits,
          () => setState(() {
            _isExpandedFroidProduits = !_isExpandedFroidProduits;
          }),
        ),
        _buildAnimatedContainer(
          _isExpandedFroidProduits,
          _buildProduitGrid(),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildChaudContent() {
    return Column(
      children: <Widget>[
        _buildTemperatureRow('Température actuelle', '50°C'),
        _buildProduitListHeader(
          'Liste des produits',
          _isExpandedChaudProduits,
          () => setState(() {
            _isExpandedChaudProduits = !_isExpandedChaudProduits;
          }),
        ),
        _buildAnimatedContainer(
          _isExpandedChaudProduits,
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: _showAddProductBottomSheet,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 157, 235, 159),
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: Color.fromARGB(255, 4, 81, 30)),
                        SizedBox(width: 5),
                        Text(
                          "Ajoutez",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 4, 81, 30),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Wrap(
                spacing: 8.0,
                children: produitsAjoutes.map((produit) {
                  return Chip(
                    label: Text(produit),
                    deleteIcon: Icon(Icons.close),
                    onDeleted: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirmer la suppression"),
                            content: Text(
                                "Êtes-vous sûr de vouloir supprimer ce produit ?"),
                            actions: <Widget>[
                              TextButton(
                                child: Text("Annuler"),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Ferme la boîte de dialogue
                                },
                              ),
                              TextButton(
                                child: Text("Supprimer"),
                                onPressed: () {
                                  setState(() {
                                    produitsAjoutes.remove(produit);
                                  });
                                  Navigator.of(context)
                                      .pop(); // Ferme la boîte de dialogue après suppression
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildTemperatureRow(String label, String temperature) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Icon(Icons.thermostat),
            Text(
              temperature,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProduitListHeader(
      String label, bool isExpanded, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
          onPressed: onPressed,
        ),
      ],
    );
  }

  Widget _buildProduitGrid() {
    return GridView.builder(
      itemCount: produits.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 4, // Nombre de colonnes
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final produit = produits[index];
        return CelluleProduitsWidget(
          index: index + 1,
          imagePath: produit['imagePath']!,
          name: produit['name']!,
        );
      },
    );
  }

  void _showAddProductBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Ajouter un produit',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Sélectionner un aliment',
                        border: OutlineInputBorder(),
                      ),
                      items: categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _productNameController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_selectedCategory != null &&
                            _productNameController.text.isNotEmpty) {
                          setState(() {
                            produitsAjoutes.add(
                                '${_productNameController.text}/${_selectedCategory!}');
                          });
                          _productNameController.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Ajouter'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
