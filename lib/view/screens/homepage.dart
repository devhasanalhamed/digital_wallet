import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final catList = [
    'إضافة مال',
    'نقل أموال',
    'حوالة محلية',
    'حوالة دولية',
    'دفع الفواتير',
    'إصدار فاتورة',
  ];

  final catIcons = [
    Icons.phone_iphone_outlined,
    Icons.money,
    Icons.phone_iphone_outlined,
    Icons.money,
    Icons.phone_iphone_outlined,
    Icons.money,
  ];

  @override
  Widget build(BuildContext context) {
    var balance = '9654';
    var floatBalance = '80';
    var currency = 'YER';
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        foregroundColor: const Color.fromARGB(255, 10, 75, 149),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
            size: 36,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 36,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      const Text(
                        'الرصيد الحالي',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        padding: const EdgeInsets.only(
                          right: 10.0,
                        ),
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          Icons.add_box_outlined,
                          size: 28,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        balance,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontSize: 52.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '.$floatBalance',
                            style: const TextStyle(
                              fontSize: 38.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                          ),
                          Text(
                            currency,
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            SizedBox(
              width: screenSize.width,
              height: 400,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 16.0,
                ),
                itemCount: catList.length,
                itemBuilder: (ctx, index) => Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        catIcons[index],
                        size: 46,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        catList[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Provider.of<AuthProvider>(context, listen: false).logout();
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
