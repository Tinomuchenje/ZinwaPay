class Invoice {
  final String id;
  final double amount;
  final String datePaid;
  final String status;

  Invoice({this.id, this.amount, this.datePaid, this.status});

  factory Invoice.fromJson(Map<String,dynamic> json) {
    return Invoice(
        id: json['inid'],
        amount: json['amount'] != null ? double.parse(json['amount']) : 0,
        datePaid: json['date'],
        status: json['status']);
  }
}