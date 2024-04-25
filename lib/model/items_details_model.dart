class ItemsDetailsModel {
  String itemCode;
  String itemName;
  String desc;
  double salesPrice;
  double purchasePrice;
  double stockQuantity;
  double stockValue;
  String measuringUnit;
  String lowStock;
  double taxRate;
  String hsnCode;
  String itemType;
  DateTime stockDate;

  ItemsDetailsModel({
    this.itemCode = "--",
    required this.itemName,
    this.desc = "",
    required this.salesPrice,
    required this.purchasePrice,
    required this.stockQuantity,
    required this.stockValue,
    required this.measuringUnit,
    this.lowStock = "--",
    required this.taxRate,
    this.hsnCode = "--",
    required this.itemType,
    required this.stockDate,
  });
}

List<ItemsDetailsModel> items = [
  ItemsDetailsModel(
    itemCode: "890126201002",
    itemName: "Sample Item",
    desc: "Amul Butter 500gm",
    salesPrice: 220,
    purchasePrice: 190,
    stockQuantity: 124.00,
    stockValue: 21035.71,
    measuringUnit: "BOX",
    lowStock: "20.0",
    taxRate: 12.0,
    itemType: "Product",
    stockDate: DateTime(2024, 3, 27),
  ),
  ItemsDetailsModel(
    itemName: "item2",
    salesPrice: 136.50,
    purchasePrice: 120.75,
    stockQuantity: 0.0,
    stockValue: 0.0,
    measuringUnit: "PCS",
    taxRate: 5.0,
    itemType: "Product",
    stockDate: DateTime(2024, 3, 28),
  ),
];
