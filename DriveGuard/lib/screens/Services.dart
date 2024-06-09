import 'package:bro/data/Servicesdata.dart';
import 'package:bro/screens/ServiceDetails.dart';
import 'package:bro/styles/bold_text.dart';
import 'package:bro/widgets/ServicesCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});
  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Image.asset(
              "lib/assets/logo/WhatsApp_Image_2024-05-05_at_1.09.14_PM-removebg-preview.png",
              scale: 4),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(20),
              BoldText(text: "Certified Service Providers", fontSize: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: servicesData.length,
                itemExtent: 150,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServicesDetailsScreen(
                                  servicesData: servicesData[index]),
                            ));
                      },
                      child: ServiesCard(servicesData: servicesData[index]));
                },
              ),
            ],
          ),
        ));
  }
}
