import 'package:nogod/pages/cash_out_page.dart';
import 'package:nogod/pages/phone_recharge.dart';
import 'package:nogod/pages/send_mony_page.dart';
import 'package:nogod/static/all_icons.dart';
import 'package:nogod/static/all_texts.dart';

String url =
    "https://nagad.com.bd/pg/?n=insurance&fbclid=IwAR3-lheFEco47UNpQvncHbOIUzC__7_oarEDRFZsCFx9kR1QExkdNnaFtDo";

List<dynamic> servicesAllText = [
  AllText.sendMonyText,
  AllText.cashOutText,
  AllText.rechargeText,
  AllText.addMoneyText,
  AllText.transferMoneyText,
  AllText.insuranceMoneyText,
  AllText.moreText,
];
List<dynamic> servicesAllIcon = [
  AllIcon.sendMonyIcon,
  AllIcon.cashOutIcon,
  AllIcon.rechargeIcon,
  AllIcon.addMoneyIcon,
  AllIcon.transferMoneyIcon,
  AllIcon.insuranceMoneyIcon,
  AllIcon.moreIcon,
];
List<dynamic> servicesAllPageRoute = [
  const SendMoneyPage(),
  const CashOutyPage(),
  const PhoneRechargePage(),
  const SendMoneyPage(),
  const CashOutyPage(),
  url,
 url,

  
];
List<dynamic> paymentAllText = [
  AllText.merchantText,
  AllText.billText,
  AllText.emiText,
  AllText.melaText,

];
List<dynamic> othersAllText = [
  AllText.contactText,
  AllText.zakatText,
  AllText.limitsText,
  AllText.donationText,

];