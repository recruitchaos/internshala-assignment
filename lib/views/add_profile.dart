import 'package:flutter/material.dart';
import 'package:internshala_assignment/common/custom_app_bar.dart';
import 'package:internshala_assignment/common/profile_options.dart';
import 'package:internshala_assignment/utils/container_button.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  Map<ProfileChoices, bool> _selectedCategories = {
    for (var category in ProfileChoices.values) category: false
  };

  String _searchQuery = "";

  List<ProfileChoices> get selectedCategories {
    return _selectedCategories.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }

  List<ProfileChoices> get filteredCategories {
    if (_searchQuery.isEmpty) {
      return ProfileChoices.values.toList();
    } else {
      return ProfileChoices.values
          .where((category) =>
              category.value.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Profile"),
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
                List<String> selectedProfiles = selectedCategories.map((e) => e.value).toList();
                Navigator.pop(context, selectedProfiles);
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
                labelText: "Search Profile",
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
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 14),
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
                children: filteredCategories.map((category) {
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

enum ProfileChoices {
  administration("Administration"),
  androidAppDevelopment("Android App Development"),
  brandManagement("Brand Management"),
  buisenessAnalytics("Business Analytics"),
  dataScience("Data Science"),
  dotNetDevelopment(".NET Development"),
  productManagement("Product Management");

  const ProfileChoices(this.value);
  final String value;
}
