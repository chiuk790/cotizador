class QuoteModel {
  final String clientName;
  final String productName;
  final int quantity;
  final double totalAmount;
  final String createdAt;

  QuoteModel({
    required this.clientName,
    required this.productName,
    required this.quantity,
    required this.totalAmount,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'clientName': clientName,
      'productName': productName,
      'quantity': quantity,
      'totalAmount': totalAmount,
      'createdAt': createdAt,
    };
  }
}
