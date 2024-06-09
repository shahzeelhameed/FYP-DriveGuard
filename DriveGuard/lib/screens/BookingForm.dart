import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bro/screens/Services.dart';
import 'package:bro/screens/bottoNavigation.dart';
import 'package:bro/styles/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookingFormScreen extends StatefulWidget {
  BookingFormScreen(
      {super.key, required this.providedServices, required this.slots});

  List<String> providedServices;
  List<String> slots;

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  String? selectedService;
  String? slots;
  String paymentMethod = "Cash on Delivery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset(
            "lib/assets/logo/WhatsApp_Image_2024-05-05_at_1.09.14_PM-removebg-preview.png",
            scale: 4),
      ),
      body: Card(
        margin: EdgeInsets.all(30),
        elevation: 15,
        child: Container(
          height: 500,
          width: 400,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                BoldText(text: "Booking Form", fontSize: 20),
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedService,
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(10),
                  items: [
                    const DropdownMenuItem<String>(
                      value: null, // Set null as initial value
                      child: Text("Select the Service"),
                    ),
                    ...widget.providedServices.map((service) {
                      return DropdownMenuItem<String>(
                        value: service,
                        child: Text(service),
                      );
                    }).toList(),
                  ],
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      selectedService = value;
                    });
                    // Do something with the selected service
                  },
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: slots,
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(10),
                  items: [
                    const DropdownMenuItem<String>(
                      value: null, // Set null as initial value
                      child: Text("Select the Slot"),
                    ),
                    ...widget.slots.map((service) {
                      return DropdownMenuItem<String>(
                        value: service,
                        child: Text(service),
                      );
                    }).toList(),
                  ],
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      slots = value;
                    });
                    // Do something with the selected service
                  },
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: paymentMethod,
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(10),
                  items: [
                    DropdownMenuItem<String>(
                      value: 'Cash on Delivery', // Set null as initial value
                      child: Text("Cash on Delivery"),
                    ),
                  ],
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      paymentMethod = value!;
                    });
                    // Do something with the selected service
                  },
                ),
                Gap(30),
                ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'Service Status',
                      desc:
                          'Your Service is booked.You will receive phone call shortly',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnOkOnPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BotttomNavigationScreen(),
                            ));
                      },
                    ).show();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(150, 117, 250, 1),
                    fixedSize: Size(130, 50),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
