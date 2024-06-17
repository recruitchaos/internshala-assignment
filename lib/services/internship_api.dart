import 'dart:convert';
import 'package:dio/dio.dart';

class GetInternshipData {
  final Dio dio = Dio();

  String noOfInternship = '';

  Future<String> getNoOfInternships() async {
    try {
      final Response response =
          await Dio().get('https://internshala.com/flutter_hiring/search');

      if (response.data is String && response.statusCode == 200) {
        final Map<String, dynamic> data =
            json.decode(response.data) as Map<String, dynamic>;

        if (data.containsKey('internships_meta') &&
            data['internships_meta'] is Map<String, dynamic>) {
          final internshipsMetaValues =
              (data['internships_meta'] as Map<String, dynamic>).values;

          final List<Map<String, dynamic>> internshipsList =
              internshipsMetaValues.map((item) {
            return item as Map<String, dynamic>;
          }).toList();

          print(internshipsList);

          return internshipsList.length.toString();
        } else {
          throw Exception(
              "Response data does not contain 'internships_meta' or it is not a Map.");
        }
      } else {
        throw Exception("Response data is not a string.");
      }
    } catch (e) {
      print("Error fetching internship data: $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getInternshipData() async {
    try {
      final Response response =
          await Dio().get('https://internshala.com/flutter_hiring/search');

      if (response.data is String && response.statusCode == 200) {
        final Map<String, dynamic> data =
            json.decode(response.data) as Map<String, dynamic>;

        if (data.containsKey('internships_meta') &&
            data['internships_meta'] is Map<String, dynamic>) {
          final internshipsMetaValues =
              (data['internships_meta'] as Map<String, dynamic>).values;

          final List<Map<String, dynamic>> internshipsList =
              internshipsMetaValues.map((item) {
            return item as Map<String, dynamic>;
          }).toList();

          print(internshipsList);

          return internshipsList;
        } else {
          throw Exception(
              "Response data does not contain 'internships_meta' or it is not a Map.");
        }
      } else {
        throw Exception("Response data is not a string.");
      }
    } catch (e) {
      print("Error fetching internship data: $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getInternshipDataWithFilters({
    List<String>? selectedProfile,
    List<String>? selectedCity,
    String? duration,
  }) async {
    try {
      final Response response = await dio.get('https://internshala.com/flutter_hiring/search');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.data) as Map<String, dynamic>;

        if (data.containsKey('internships_meta') && data['internships_meta'] is Map<String, dynamic>) {
          final internshipsMetaValues = (data['internships_meta'] as Map<String, dynamic>).values;

          final List<Map<String, dynamic>> internshipsList = internshipsMetaValues.map((item) {
            return item as Map<String, dynamic>;
          }).toList();

          // Apply filters based on selectedProfile, selectedCity, and duration
          List<Map<String, dynamic>> filteredInternships = internshipsList.where((internship) {
            bool profileMatch = selectedProfile == null || selectedProfile.isEmpty || selectedProfile.contains(internship['profile_name']);
            bool cityMatch = selectedCity == null || selectedCity.isEmpty || selectedCity.any((city) => internship['location_names'].contains(city));
            bool durationMatch = duration == null || duration.isEmpty || int.parse(internship['duration'].toString().substring(0, 1)) <= int.parse(duration);

            return profileMatch && cityMatch && durationMatch;
          }).toList();
          print(filteredInternships);
          return filteredInternships;
        } else {
          throw Exception("Response data does not contain 'internships_meta' or it is not a Map.");
        }
      } else {
        throw Exception("Failed to load internships, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching internship data with filters: $e");
      rethrow;
    }
  }
}

class GetFilteredInternships {}
