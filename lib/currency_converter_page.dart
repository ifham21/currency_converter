import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverterPage());
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPage();
}

class _CurrencyConverterPage extends State<CurrencyConverterPage> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;

  //All the controllers should be disposed after running
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
        style: BorderStyle.solid,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      //To create appbar in an app --> appBar: AppBar()
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        //Padding Widget is to set padding
        child: Padding(
          //to create padding we use padding: EdgeInsets.all(10.0)
          padding: const EdgeInsets.all(10.0),
          //Column() for column and Row() for rows
          //main axis of Column() is vertical axis
          //main axis of Row() is horizontal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rs.${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              //TextField
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  hintText: "Please enter the Currency in USD",
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              //TextButton
              TextButton(
                  onPressed: () {
                    result = double.parse(textEditingController.text) * 301.36;
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  // style: ButtonStyle(
                  //   backgroundColor: const WidgetStatePropertyAll(Colors.black),
                  //   minimumSize: const WidgetStatePropertyAll(
                  //     Size(double.infinity, 50),
                  //   ),
                  //   foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  //   shape: WidgetStatePropertyAll(
                  //     RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //   ),
                  // ),
                  child: const Text("Convert"))
            ],
          ),
        ),
      ),
    );
  }
}
