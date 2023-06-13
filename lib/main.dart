import 'package:bmi_calculator/widgets/measurement_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MAinApp());
}

class MAinApp extends StatelessWidget {
  const MAinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.cyan,
      ),
      home: const BmiHomePage(),
    );
  }
}

class BmiHomePage extends StatefulWidget {
  const BmiHomePage({super.key});

  @override
  State<BmiHomePage> createState() => _BmiHomePageState();
}

String gender = 'male';
int height = 0;
int weight = 0;
int age = 0;

double bmi = 0.0;

double _calculateBMI() {
  // Formula : [weight (kg) / height (cm) / height (cm)] x 10,000
  double bmi = (weight / height / height) * 10000;
  return bmi;
}

String _detectbmilevel(double bmi) {
  if (bmi < 18.5) {
    return 'Under Weight';
  } else if (bmi > 18.5 && bmi < 24.9) {
    return 'Normal';
  } else if (bmi > 25 && bmi < 29.9) {
    return 'Over Weight';
  } else if (bmi > 30 && bmi < 34.9) {
    return 'Obesity (Class I)';
  } else if (bmi > 35 && bmi < 39.9) {
    return 'Obesity (Class II)';
  } else {
    return 'Extreme Obesity';
  }
}

class _BmiHomePageState extends State<BmiHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        elevation: 0,
      ),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Gender',
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: RadioListTile(
                title: const Text("Male"),
                value: "male",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: const Text("Female"),
                value: "female",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        MeasurementCard(
            measurement: height,
            title: 'Height',
            decreaseAction: () {
              setState(() {
                height = height - 1;
                bmi = _calculateBMI();
              });
            },
            increaseAction: () {
              setState(() {
                height = height + 1;
                bmi = _calculateBMI();
              });
            }),
        const SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MeasurementCard(
                measurement: weight,
                title: 'Weight',
                decreaseAction: () {
                  setState(() {
                    weight = weight - 1;
                    bmi = _calculateBMI();
                  });
                },
                increaseAction: () {
                  setState(() {
                    weight = weight + 1;
                    bmi = _calculateBMI();
                  });
                }),
            MeasurementCard(
                measurement: age,
                title: 'Age',
                showCm: false,
                decreaseAction: () {
                  setState(() {
                    age = age - 1;

                    bmi = _calculateBMI();
                  });
                },
                increaseAction: () {
                  setState(() {
                    age = age + 1;
                    bmi = _calculateBMI();
                  });
                }),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          'BMI ${bmi.toStringAsFixed(1)}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Remark: ${_detectbmilevel(bmi)}',
          style: const TextStyle(fontSize: 30),
        )
      ]),
    );
  }
}
