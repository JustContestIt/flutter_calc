class Data {
  String company;
  String model;
  List<LineItem> items;
  Data({
    required this.company,
    required this.model,
    required this.items,
  });
}

class LineItem {
  String description;
  String value;
  String unit;

  LineItem(this.description, this.value, this.unit);
}