import 'package:flutter/cupertino.dart';

class PaymentOptions {
  Image image;
  String title;
  PaymentOptionsEnum paymentMethod;

  PaymentOptions({this.image, this.title, this.paymentMethod});
}

enum PaymentOptionsEnum { Ecocash, OneMone, Telecash, Nostro, MasterOrVisa }

final paymentOptions = [
  PaymentOptions(
    image: Image.asset('assets/ecocash.jpg'),
    title: 'Ecocash',
    paymentMethod: PaymentOptionsEnum.Ecocash
  ),
  PaymentOptions(
    image: Image.asset('assets/onemoney.png'),
    title: 'One Money',
  ),
  PaymentOptions(
    image: Image.asset('assets/telecash.png'),
    title: 'Telecash',
  ),
  PaymentOptions(
    image: Image.asset('assets/bank.png'),
    title: 'Bank EFT',
  ),
  PaymentOptions(
    image: Image.asset('assets/bank.png'),
    title: 'Nostro',
  ),
  PaymentOptions(
    image: Image.asset('assets/visamaster.png'),
    title: 'Visa/MasterCard',
    paymentMethod: PaymentOptionsEnum.MasterOrVisa
  ),
];
