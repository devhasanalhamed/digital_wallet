import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppStructure with ChangeNotifier {
  final homepageCategories = [
    {'title': 'إرسال أموال', 'icon': FontAwesomeIcons.moneyBills},
    {'title': 'إضافة مال', 'icon': FontAwesomeIcons.moneyBill},
    {'title': 'حوالة دولية', 'icon': FontAwesomeIcons.earthAsia},
    {'title': 'حوالة محلية', 'icon': FontAwesomeIcons.buildingColumns},
    {'title': 'إصدار فاتورة', 'icon': FontAwesomeIcons.sheetPlastic},
    {'title': 'دفع الفواتير', 'icon': FontAwesomeIcons.mobile},
    {'title': '7', 'icon': FontAwesomeIcons.earthAsia},
    {'title': '8', 'icon': FontAwesomeIcons.earthAsia},
    {'title': '9', 'icon': FontAwesomeIcons.earthAsia},
  ];
}
