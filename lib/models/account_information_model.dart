class AccountInformation {
  final int id;
  final String status;
  final String message;
  final String meterNumber;
  final double balance;
  final String role;

  AccountInformation({this.id, this.status, this.message, this.meterNumber, this.balance, this.role});

  factory AccountInformation.fromJson(Map<String, dynamic> json) {
    return AccountInformation(
        id: json['id'],
        status: json['status'],
        message: json['message'],
        meterNumber: json['meter_number'],
        balance: json['balance'] != null ? double.parse(json['balance']) : 0,
        role: json['role']);
  }
}
