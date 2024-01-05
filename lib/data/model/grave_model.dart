import 'package:tdc_mobile/data/model/deceased_model.dart';

class GraveModel {
  int graveID;

  String sizeOfGrave;

  String imageUrl;

  String graveType;

  int plot;

  DeceasedModel deceased;

  bool isActive;

  GraveModel(
      {required this.graveID,
      required this.sizeOfGrave,
      required this.imageUrl,
      required this.graveType,
      required this.plot,
      required this.deceased,
      required this.isActive});
}
