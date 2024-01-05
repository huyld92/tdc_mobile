import 'package:tdc_mobile/data/model/deceased_model.dart';

class SearchGraveModel {
  int graveID;
  DeceasedModel deceased;
  String sectionName;
  String plotName;

  SearchGraveModel(
      {required this.graveID,
      required this.deceased,
      required this.sectionName,
      required this.plotName});
}
