import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MeasurementCard extends StatelessWidget {
  final int measurement;
  final String title;
  final VoidCallback decreaseAction;
  final VoidCallback increaseAction;
  final bool showCm;
  const MeasurementCard(
      {super.key,
      required this.measurement,
      required this.title,
      required this.decreaseAction,
      this.showCm = true,
      required this.increaseAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$title: $measurement ${showCm ? 'CM' : ''}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: decreaseAction,
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                        child: Text(
                          '-',
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      )),
                ),
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: increaseAction,
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                        child: Text(
                          '+',
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
