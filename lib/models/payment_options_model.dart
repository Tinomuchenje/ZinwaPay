import 'package:flutter/cupertino.dart';

class PaymentOptions{
  Image image;
  String title;

  PaymentOptions({this.image, this.title});
}

final paymentOptions = [
  PaymentOptions(
    image: Image.asset('assets/zinwa_medium.png'),
    title: 'Ecocash',
  ),
  PaymentOptions(
    image: Image.asset('assets/zinwa_medium.png'),
    title: 'One Money',
  ),
  PaymentOptions(
    image: Image.asset('assets/zinwa_medium.png'),
    title: 'Telecash',
  ),
  PaymentOptions(
    image: Image.asset('assets/zinwa_medium.png'),
    title: 'Bank EFT',
  ),
  PaymentOptions(
    image: Image.asset('assets/zinwa_medium.png'),
    title: 'Nostro',
  ),
  PaymentOptions(
    image: Image.asset('assets/zinwa_medium.png'),
    title: 'Visa/MasterCard',
  ),
];