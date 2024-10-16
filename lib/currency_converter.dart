import 'package:flutter/material.dart';

//1. create a variable that can convert the currency value
//2. create a function that multiplies the value given by the text-field into 300
//3. store the value in the variable that we created
//4. display the variable

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    double result = 0;
    //Border shaping variable for TextField
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
        style: BorderStyle.solid,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result.toString(),
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            //TextField
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  hintText: "Please enter the Currency in LKR",
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            //TextButton
            Padding(
              padding: const EdgeInsets.all(10.0),
              //ElevatedButton -> Previously Known as RaisedButton -> Kind of 3D elevation
              //TextButton -> Previously Known as FlatButton
              child: TextButton(
                  onPressed: () {
                    result = double.parse(textEditingController.text) * 300;
                    // print(result);
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
                  child: const Text("Convert")),
            )
          ],
        ),
      ),
    );
  }
}
