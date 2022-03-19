class PetModel {
  String? patientname;
  String? phoneNumber;
  String? vaccinationDetails;
  String? date;
  String? time;
  String? id;

  PetModel(
      {this.patientname,
      this.phoneNumber,
      this.vaccinationDetails,
      this.date,
      this.time,
      this.id});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'patientname': patientname,
        'phoneNumber': phoneNumber,
        'vaccinationDetails': vaccinationDetails,
        'date': date,
        'time': time,
        'id': id
      };

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        patientname: json['patientname'] as String,
        phoneNumber: json['phoneNumber'] as String,
        vaccinationDetails: json['vaccinationDetails'] as String,
        date: json['date'] as String,
        time: json['time'] as String,
        id: json['id'] as String,
      );
}
