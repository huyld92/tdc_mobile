class DeceasedModel {
  int deceasedID;

  String fullName;

  DateTime dateOfDead;

  DateTime dateOfBirth;

  String gender;

  bool isActive;

  DeceasedModel({
    required this.deceasedID,
    required this.fullName,
    required this.dateOfDead,
    required this.dateOfBirth,
    required this.gender,
    required this.isActive,
  });
}
