import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:internshala_assignment/common/tags.dart';
import 'package:internshala_assignment/constants/sceeen_dimensions.dart';

class InternshipCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String location;
  final String timeToStart;
  final String duration;
  final String stipend;
  final String datePosted;
  final List label;
  const InternshipCard(
      {super.key,
      required this.jobTitle,
      required this.companyName,
      required this.location,
      required this.timeToStart,
      required this.duration,
      required this.stipend,
      required this.datePosted,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: Row(
                        children: [
                          Icon(Icons.trending_up, color: Color(0xff008BDC),),
                          SizedBox(width: 8,),
                          Text("Actively hiring", style: TextStyle(color: Colors.black, fontSize: 13),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobTitle,
                          style: TextStyle(
                              fontSize:
                                  ScreenDimension.getScreenWidth(context) *
                                      0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          companyName,
                          style: TextStyle(
                              fontSize:
                                  ScreenDimension.getScreenWidth(context) *
                                      0.04,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/dummy_logo.png"),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Icon(
                    Iconsax.location_outline,
                    size: 16,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    location,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Icon(
                    Iconsax.play_circle_outline,
                    size: 16,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    timeToStart,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  FaIcon(
                    FontAwesome.calendar,
                    size: 16,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(duration, style: TextStyle(fontSize: 14, color: Colors.grey.shade800),)
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Icon(
                    Iconsax.money_outline,
                    size: 16,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(stipend, style: TextStyle(fontSize: 14, color: Colors.grey.shade800),)
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Wrap(
                spacing: 8.0, // spacing between tags
                runSpacing: 4.0, // spacing between rows
                children: label
                    .map((label) => Tags(
                          child: Text(label, style: TextStyle(fontSize: 14, color: Colors.grey.shade800),),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 16,
              ),
              Tags(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Iconsax.timer_1_outline,
                    size: 16,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(datePosted, style: TextStyle(color: Colors.grey.shade800),)
                ],
              )),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade200)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View details",
                        style: TextStyle(color: Color(0xff008BDC), fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
