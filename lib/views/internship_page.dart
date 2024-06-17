import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:internshala_assignment/common/custom_app_bar.dart';
import 'package:internshala_assignment/common/internship_card.dart';
import 'package:internshala_assignment/constants/sceeen_dimensions.dart';
import 'package:internshala_assignment/services/internship_api.dart';
import 'package:internshala_assignment/utils/custom_button.dart';
import 'package:internshala_assignment/views/filter_page.dart';

class InternshipPage extends StatefulWidget {
  final List<String>? selectedProfile;
  final List<String>? selectedCity;
  final String? duration;
  const InternshipPage({super.key, this.selectedProfile, this.selectedCity, this.duration});

  @override
  State<InternshipPage> createState() => _InternshipPageState();
}

class _InternshipPageState extends State<InternshipPage> {
  String? totalInternships;
  List<String> selectedProfile = [];
  List<String> selectedCity = [];
  String duration = "";

  bool isFiltered = false;

  @override
  void initState() {
    super.initState();
    selectedProfile = widget.selectedProfile ?? [];
    selectedCity = widget.selectedCity ?? [];
    duration = widget.duration ?? "";
    if (selectedProfile.isEmpty && selectedCity.isEmpty && duration == "") {
      _loadNoOfInternships();
    } else {
      _loadNoOfInternshipsWithFilters();
    }
  }

  void _loadNoOfInternships() async {
    String result = await GetInternshipData().getNoOfInternships();
    setState(() {
      totalInternships = result;
    });
  }

  void _loadNoOfInternshipsWithFilters() async {
    try {
      List<Map<String, dynamic>> internships = await GetInternshipData().getInternshipDataWithFilters(
        selectedProfile: selectedProfile,
        selectedCity: selectedCity,
        duration: duration,
      );
      setState(() {
        totalInternships = internships.length.toString();
        isFiltered = true;
      });
    } catch (e) {
      print("Error loading filtered internships: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: CustomAppBar(title: Text("Interships"), leading: Builder(
      builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(child: Image(image: AssetImage('assets/images/internshala.png'), width: ScreenDimension.getScreenWidth(context) * 0.3, height: ScreenDimension.getScreenWidth(context) * 0.3,)),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  isFiltered
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage(selectedProfiles: selectedProfile, selectedCities: selectedCity)));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xff008BDC),
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            Text('Filters'),
                                            SizedBox(width: 4),
                                            Container(
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff008BDC),
                                              ),
                                              child: Text(
                                                (selectedProfile.length +
                                                        selectedCity.length +
                                                        (duration != "" ? 1 : 0))
                                                    .toString(),
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                Expanded(
                                  child: SizedBox(
                                    height: 40,
                                    child: ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        for (var profile in selectedProfile)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Chip(
                                              
                                              label: Text(profile),
                                              onDeleted: () {
                                                setState(() {
                                                  selectedProfile.remove(profile);
                                                  if (selectedProfile.isEmpty && selectedCity.isEmpty && duration == "") {
                                                    isFiltered = false;
                                                    _loadNoOfInternships();
                                                  } else {
                                                    _loadNoOfInternshipsWithFilters();
                                                  }
                                                });
                                              },
                                              deleteIcon: Icon(Icons.close, size: 16, color: Color(0xff008BDC)),
                                              backgroundColor: Colors.white,
                                              shape: StadiumBorder(
                                                side: BorderSide(
                                                  color: Color(0xff008BDC),
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        for (var city in selectedCity)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Chip(
                                              padding: EdgeInsets.only(right: 4),
                                              label: Text(city),
                                              onDeleted: () {
                                                setState(() {
                                                  selectedCity.remove(city);
                                                  if (selectedProfile.isEmpty && selectedCity.isEmpty && duration == "") {
                                                    isFiltered = false;
                                                    _loadNoOfInternships();
                                                  } else {
                                                    _loadNoOfInternshipsWithFilters();
                                                  }
                                                });
                                              },
                                              deleteIcon: Icon(Icons.close, size: 16, color: Color(0xff008BDC)),
                                              backgroundColor: Colors.white,
                                              shape: StadiumBorder(
                                                side: BorderSide(
                                                  color: Color(0xff008BDC),
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (duration != "")
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Chip(
                                              padding: EdgeInsets.only(right: 4),
                                              label: Text("Duration <= $duration months"),
                                              onDeleted: () {
                                                setState(() {
                                                  duration = "";
                                                  if (selectedProfile.isEmpty && selectedCity.isEmpty && duration == "") {
                                                    isFiltered = false;
                                                    _loadNoOfInternships();
                                                  } else {
                                                    _loadNoOfInternshipsWithFilters();
                                                  }
                                                });
                                              },
                                              deleteIcon: Icon(Icons.close, size: 16, color: Color(0xff008BDC)),
                                              backgroundColor: Colors.white,
                                              shape: StadiumBorder(
                                                side: BorderSide(
                                                  color: Colors.grey,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FilterPage(
                                    selectedProfiles: selectedProfile,
                                    selectedCities: selectedCity,
                                  )),
                                );
                                if (result != null && result is Map<String, dynamic>) {
                                  setState(() {
                                    selectedProfile = result['selectedProfiles'];
                                    selectedCity = result['selectedCities'];
                                    duration = result['duration'];
                                  });
                                  _loadNoOfInternshipsWithFilters();
                                }
                              },
                            ),
                        ],
                      ),
                  SizedBox(height: 16),
                  Text("$totalInternships total internships" ?? "Loading.."),
                  SizedBox(height: 12),
                ],
              ),
            ),
            FutureBuilder(
              future: isFiltered ? GetInternshipData().getInternshipDataWithFilters(selectedProfile: selectedProfile, selectedCity: selectedCity, duration: duration) : GetInternshipData().getInternshipData(),
              builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var internship = snapshot.data![index];
                        bool isRemote = false;
                        String locationName = "";
                        if ("${internship['location_names']}" == "[]") {
                          isRemote = true;
                        } else {
                          locationName = "${internship['location_names']}";
                        }
                        return InternshipCard(
                          jobTitle: "${internship['title']}",
                          companyName: "${internship['company_name']}",
                          location: isRemote
                              ? "Remote"
                              : locationName.substring(1, locationName.length - 1),
                          stipend: "${internship['stipend']['salary']}",
                          timeToStart: "${internship['start_date']}",
                          duration: "${internship['duration']}",
                          datePosted: "${internship['posted_by_label']}",
                          label: internship['labels'][0]['label_value'],
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(child: Text("Failed to get data"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
