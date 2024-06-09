import 'package:bro/data/Servicesdata.dart';
import 'package:bro/screens/BookingForm.dart';
import 'package:bro/styles/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class ServicesDetailsScreen extends StatefulWidget {
  ServicesDetailsScreen({super.key, required this.servicesData});

  final ServicesData servicesData;

  @override
  State<ServicesDetailsScreen> createState() => _ServicesDetailsScreenState();
}

class _ServicesDetailsScreenState extends State<ServicesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> providedServices = widget.servicesData.providedServices;
    var info = widget.servicesData.Info;
    var address = info['address'];
    var email = info['email'];
    var phoneno = info['phone_no'];

    print(address);

    print(providedServices);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Service Details"),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingFormScreen(
                  providedServices: providedServices,
                  slots: widget.servicesData.slots,
                ),
              ));
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 40),
          backgroundColor: const Color.fromRGBO(150, 117, 250, 1),
        ),
        child: const Text("Book Service"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.servicesData.imagPath),
              RatingBar.builder(
                initialRating: widget.servicesData.rating.toDouble(),
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 30,
                itemPadding: const EdgeInsets.symmetric(horizontal: 3),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const Gap(10),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldText(text: "Description", fontSize: 20),
                    Text(
                      widget.servicesData.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const Gap(10),
                    BoldText(text: "Address", fontSize: 20),
                    Text(address),
                    const Gap(10),
                    BoldText(text: "Contact Information", fontSize: 20),
                    Text(
                      'Phone no : ${phoneno}\nEmail: ${email}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const Gap(10),
                    BoldText(text: "Services Offered", fontSize: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: providedServices.length,
                      itemBuilder: (context, index) {
                        return Text(
                          '${index + 1} ${providedServices[index]}',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
