class Order {
  final String addressId, paymentType;
  final int totalAmount;
  final List<dynamic> items;

  Order({
    this.paymentType,
    this.items,
    this.addressId,
    this.totalAmount,
  });

  Map<String, dynamic> toJson() => {
        'paymentType': paymentType,
        'addressId': addressId,
        'totalAmount': totalAmount,
        'items': items,
      };
}

class OrderResponse {
  final String message;
  final int code;

  OrderResponse({
    this.message,
    this.code,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      message: json['message'],
      code: json['code'],
    );
  }
}
