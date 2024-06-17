import 'package:flutter/material.dart';
import 'package:internshala_assignment/common/custom_app_bar.dart';
import 'package:internshala_assignment/utils/container_button.dart';
import 'package:internshala_assignment/views/add_city.dart';
import 'package:internshala_assignment/views/add_profile.dart';

import '../constants/sceeen_dimensions.dart';

class FilterPage extends StatefulWidget {
  final List<String>? selectedProfiles;
  final List<String>? selectedCities;
  const FilterPage({super.key, this.selectedProfiles, this.selectedCities});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final TextEditingController numberController = TextEditingController();
  NumberLabel? selectedNumber;
  List<String> selectedProfiles = [];
  List<String> selectedCities = [];

  List<String> dropdownMenuEntries = [
    "1", "2", "3", "4", "6", "12", "24", "36"
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedProfiles = widget.selectedProfiles ?? [];
    selectedCities = widget.selectedCities ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Filters"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PROFILE",
              style: TextStyle(
                fontSize: ScreenDimension.getScreenWidth(context) * 0.036,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: ScreenDimension.getScreenHeight(context) * 0.016),
            if (selectedProfiles.isNotEmpty) ...[
              SizedBox(
                height: 48,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: selectedProfiles.map((profile) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Chip(
                        elevation: 0,
                        backgroundColor: Color(0xff008BDC),
                        label: Text(profile),
                        labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                        deleteIcon: Icon(Icons.close, color: Colors.white),
                        onDeleted: () {
                          setState(() {
                            selectedProfiles.remove(profile);
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: ScreenDimension.getScreenHeight(context) * 0.01),
            ],
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProfile()),
                );
                if (result != null && result is List<String>) {
                  setState(() {
                    selectedProfiles = result;
                  });
                }
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Color(0xff008BDC),
                    size: ScreenDimension.getScreenWidth(context) * 0.04,
                  ),
                  Text(
                    " Add profile",
                    style: TextStyle(
                      fontSize: ScreenDimension.getScreenWidth(context) * 0.04,
                      color: Color(0xff008BDC),
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: ScreenDimension.getScreenHeight(context) * 0.02),
            Text(
              "CITY",
              style: TextStyle(
                fontSize: ScreenDimension.getScreenWidth(context) * 0.036,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: ScreenDimension.getScreenHeight(context) * 0.016),
            if (selectedCities.isNotEmpty) ...[
              SizedBox(
                height: 48,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: selectedCities.map((city) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Chip(
                        elevation: 0,
                        backgroundColor: Color(0xff008BDC),
                        label: Text(city),
                        labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                        deleteIcon: Icon(Icons.close, color: Colors.white),
                        onDeleted: () {
                          setState(() {
                            selectedCities.remove(city);
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: ScreenDimension.getScreenHeight(context) * 0.01),
            ],
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCity()),
                );
                if (result != null && result is List<String>) {
                  setState(() {
                    selectedCities = result;
                  });
                }
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Color(0xff008BDC),
                    size: ScreenDimension.getScreenWidth(context) * 0.04,
                  ),
                  Text(
                    " Add city",
                    style: TextStyle(
                      fontSize: ScreenDimension.getScreenWidth(context) * 0.04,
                      color: Color(0xff008BDC),
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: ScreenDimension.getScreenHeight(context) * 0.02),
            Text(
              "MAXIMUM DURATION (IN MONTHS)",
              style: TextStyle(
                fontSize: ScreenDimension.getScreenWidth(context) * 0.036,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: ScreenDimension.getScreenHeight(context) * 0.02),
            Expanded(
              child: DropdownMenu<NumberLabel>(
                expandedInsets: EdgeInsets.all(0),
                trailingIcon: Icon(Icons.keyboard_arrow_down),
                selectedTrailingIcon: Icon(Icons.keyboard_arrow_up),
                enableSearch: false,
                menuStyle: MenuStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  elevation: WidgetStateProperty.all(2),
                ),
                controller: numberController,
                // requestFocusOnTap: true,
                label: const Text('Choose Duration'),
                onSelected: (NumberLabel? number) {
                  setState(() {
                    selectedNumber = number;
                  });
                },
                dropdownMenuEntries: NumberLabel.values.map<DropdownMenuEntry<NumberLabel>>((NumberLabel number) {
                  return DropdownMenuEntry<NumberLabel>(
                    value: number,
                    label: number.label,
                    style: ButtonStyle(
                      textStyle: WidgetStateProperty.all(TextStyle(color: Colors.grey)),
                    ),
                  );
                }).toList(),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContainerButton(
                  text: "Clear all",
                  backgroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      selectedProfiles = [];
                      selectedCities = [];
                      selectedNumber = null;
                    });
                  },
                  textStyle: TextStyle(color: Color(0xff008BDC), fontSize: 16),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenDimension.getScreenWidth(context) * 0.14,
                    vertical: 8,
                  ),
                ),
                ContainerButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'selectedProfiles': selectedProfiles,
                      'selectedCities': selectedCities,
                      'duration': selectedNumber?.label ?? '',
                    });
                  },
                  text: "Apply",
                  backgroundColor: Color(0xff008BDC),
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenDimension.getScreenWidth(context) * 0.14,
                    vertical: 8,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

enum NumberLabel {
  one('1'),
  two('2'),
  three('3'),
  four('4'),
  six('6'),
  twelve('12'),
  twentyFour('24'),
  thirtySix('36');

  const NumberLabel(this.label);
  final String label;
}
