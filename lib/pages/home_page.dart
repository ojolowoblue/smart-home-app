import 'package:flutter/material.dart';
import 'package:smart_home/components/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 20;
  final double verticalPadding = 25;

  final List mySmartDevices = [
    ["Smart Light", Icons.light, true],
    ["AC Unit", Icons.ac_unit, false],
    ["TV", Icons.tv, true],
    ["Game", Icons.gamepad, true],
  ];

  void onPowerSwitchChange(bool on, int index) {
    setState(() {
      mySmartDevices[index][2] = on;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 45,
                ),
                Icon(
                  Icons.person,
                  size: 45,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Home,"),
                Text(
                  "ENGR. BLUE",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Text("Smart Devices"),
          ),
          Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(5),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mySmartDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      name: mySmartDevices[index][0],
                      icon: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChange: (v) => onPowerSwitchChange(v, index),
                    );
                  }))
        ],
      )),
    );
  }
}
