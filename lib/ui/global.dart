import 'package:flutter/material.dart';

class OnBoardingInstructions {
  final String image, title, subtitle;

  OnBoardingInstructions(this.image, this.title, this.subtitle);
}

class MyColors {
  static const grey = Color(0xfff3f3f3),
      orange = Color(0xffffb755),
      red = Color(0xffed5568),
      lightGreen = Color(0xffdbf3e8),
      darkGreen = Color(0xff4ac18e),
      blue = Color(0xff40beee);
}

class DoctorInfo {
  final String name,
      image,
      type,
      reviewCount,
      about,
      workingHours,
      patientsCount,
      experience,
      certifications;
  final double reviews;

  DoctorInfo({
    required this.name,
    required this.image,
    required this.type,
    required this.reviews,
    required this.reviewCount,
    required this.about,
    required this.workingHours,
    required this.patientsCount,
    required this.experience,
    required this.certifications,
  });
}

List<DoctorInfo> doctorInfo = [
  DoctorInfo(
    image:
        "https://image.freepik.com/vecteurs-libre/contexte-du-docteur_1270-84.jpg",
    about: "Let them fall into the great ones, which they are most worthy of?",
    certifications: "10",
    experience: "15",
    name: "Dr Ramesh",
    patientsCount: "385",
    reviewCount: "1320",
    reviews: 4.3,
    type: "General Practitioner",
    workingHours: "Mon - Fri 09:00 - 17:00",
  ),
];

List<OnBoardingInstructions> onBoardingInstructions = [
  OnBoardingInstructions(
    "assets/images/onboarding2.png",
    "Call a doctor to visit you",
    "Please fix the Appointment to meet with Doctor?",
  ),
  OnBoardingInstructions(
    "assets/images/onboarding3.png",
    "Call a doctor to visit you",
    "Please fix the Appointment to meet with Doctor?",
  ),
];

List<Map<String, dynamic>> categories = [
  {
    'icon': 'assets/icons/doctor.png',
    'title': 'General Practitioner',
    'color': MyColors.red,
  },
  {
    'icon': 'assets/icons/tooth.png',
    'title': 'Dental Surgeon',
    'color': MyColors.orange,
  },
];

String avatar =
    "https://pbs.twimg.com/profile_images/1233356631188082689/qcmTohZh_400x400.jpg";
