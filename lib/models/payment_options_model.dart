import 'package:flutter/cupertino.dart';

class PaymentOptions{
  Image image;
  String title;

  PaymentOptions({this.image, this.title});
}

final paymentOptions = [
  PaymentOptions(
    image: Image.asset('assets/ecocash.jpg'),
    title: 'Ecocash',
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
  ),
];