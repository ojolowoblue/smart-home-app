import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool powerOn;
  void Function(bool)? onChange;

  SmartDeviceBox(
      {super.key,
      required this.name,
      required this.icon,
      required this.powerOn,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[800] : Colors.grey[200],
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 65,
                color: powerOn ? Colors.white : Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: powerOn ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(value: powerOn, onChanged: onChange),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
