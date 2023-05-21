class ShippingModel {
  final String title;
  final String subtitle;
  final String? note;
  bool isSelected;
  ShippingModel(
      {required this.title,
      required this.subtitle,
      this.note,
      required this.isSelected});
}
