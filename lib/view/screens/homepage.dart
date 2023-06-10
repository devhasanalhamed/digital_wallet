import 'package:digital_wallet/controller/app_structure_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var itemIndicator = 0;
  var pageIndicator = 0;
  @override
  Widget build(BuildContext context) {
    final pageCategory =
        Provider.of<AppStructure>(context, listen: false).homepageCategories;
    var balance = '9654';
    var floatBalance = '80';
    var currency = 'YER';
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(210, 243, 243, 243),
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndicator,
        onTap: (value) => setState(() {
          pageIndicator = value;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portable_wifi_off),
            label: 'home',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: ListView(
          children: [
            SizedBox(
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
            const SizedBox(height: 40.0),
            SizedBox(
              height: 380,
              child: PageView.builder(
                itemCount: (pageCategory.length / 6).ceil(),
                onPageChanged: (value) {
                  setState(() {
                    itemIndicator = value;
                  });
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, pageVeiwIndex) => SizedBox(
                  width: screenSize.width,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 16.0,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (ctx, index) {
                        var indicator = index;
                        switch (pageVeiwIndex) {
                          case 0:
                            indicator += 0;
                            break;
                          case 1:
                            indicator += 6;
                            break;
                          case 2:
                            indicator += 12;
                            break;
                          default:
                            indicator += 0;
                        }
                        return indicator >= pageCategory.length
                            ? null
                            : InkWell(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                onTap: () {},
                                child: Card(
                                  elevation: 5.0,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FaIcon(
                                        pageCategory[indicator]['icon']
                                            as IconData,
                                        size: 46,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      Text(
                                        pageCategory[indicator]['title']
                                            as String,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 112, 112, 112),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      }),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 40,
                  child: ListView.builder(
                    itemCount: (pageCategory.length / 6).ceil(),
                    itemBuilder: (ctx, index) => Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: index == itemIndicator
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          height: 10,
                          width: 10,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 360,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 3,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        top: 25.0,
                        right: 10.0,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                            ),
                            child: Text('card info'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity,
                            height: 130,
                            color: Colors.green,
                            child: Text('ads ads ads ads ads'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<AuthProvider>(context, listen: false).logout();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FontAwesomeIcons.anglesUp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
