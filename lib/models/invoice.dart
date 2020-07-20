class Invoice {
  final String id;
  final double amount;
  final DateTime datePaid;
  final String status;

  Invoice({this.id, this.amount, this.datePaid, this.status});

  factory Invoice.fromJson(dynamic json) {
    return Invoice(
        id: json['invoiceNumber'],
        amount: json['amount'] != null ? double.parse(json['amount']) : 0,
        datePaid: json['date'] != null ? DateTime.parse(json['date'].toString()) : null,
        status: json['status']);
  }
}