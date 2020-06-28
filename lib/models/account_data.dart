class AccountInformation{
  final int id;
  final String meterNumber;
  final String balance;
  final String role;

  AccountInformation({this.id, this.meterNumber, this.balance, this.role});

  factory AccountInformation.fromJson(Map<String, dynamic> json){
    return AccountInformation(
      id: json['id'],
      meterNumber: json['meter_number'],
      balance: json['balance'],
      role: json['role']
    );
  }
}