import 'package:flutter/material.dart';
import 'package:internshala_assignment/common/custom_app_bar.dart';
import 'package:internshala_assignment/utils/container_button.dart';

class AddCity extends StatefulWidget {
  const AddCity({super.key});

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {

  Map<CityChoices, bool> _selectedCategories = {
    for (var category in CityChoices.values) category: false
  };

  String _searchQuery = "";


  List<CityChoices> get selectedCategories {
    return _selectedCategories.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }

  List<CityChoices> get filteredCategories {
    if (_searchQuery.isEmpty) {
      return CityChoices.values.toList();
    } else {
      return CityChoices.values
          .where((category) => category.value
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("City"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: Row(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    _selectedCategories.forEach((key, value) {
                      _selectedCategories[key] = false;
                    });
                  });
                },
                child: Text(
                  "Clear all",
                  style: TextStyle(color: Color(0xff008BDC), fontSize: 18),
                )),
            ContainerButton(
              onPressed: () {
                List<String> selectedCities = selectedCategories.map((e) => e.value).toList();
                Navigator.pop(context, selectedCities);
              },
              text: "Apply",
              backgroundColor: Color(0xff008BDC),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              textStyle: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Search City",
                labelStyle: TextStyle(color: Color(0xff008BDC)),
                fillColor: Color(0xff008BDC),
                focusColor: const Color(0xff008BDC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Color(0xff008BDC), width: 2),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            if (selectedCategories.isNotEmpty) ...[
              SizedBox(
                height: 48, // Adjust the height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: selectedCategories.map((category) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Chip(
                        elevation: 0,
                        backgroundColor: Color(0xff008BDC),
                        label: Text(category.value),
                        labelStyle: TextStyle(color: Colors.white),
                        deleteIcon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onDeleted: () {
                          setState(() {
                            _selectedCategories[category] = false;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
            Expanded(
              child: ListView(
                children:
                  filteredCategories.map((category) {
                  return Row(
                    children: [
                      Checkbox(
                        value: _selectedCategories[category],
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedCategories[category] = value!;
                          });
                        },
                      ),
                      Text(category.value),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum CityChoices {
  banga("Banga (Phillippines)"),
  delhi("Delhi"),
  gurgaon("Gurgaon"),
  kera("Kera"),
  lucknow("Lucknow"),
  munnar("Munnar"),
  parbhani("Parbhani"),
  tarntaran("Tarn Taran");

  const CityChoices(this.value);
  final String value;
}