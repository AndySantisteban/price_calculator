import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Ventas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController product1Controller = TextEditingController();
  TextEditingController product2Controller = TextEditingController();
  TextEditingController product3Controller = TextEditingController();
  TextEditingController quantity1Controller = TextEditingController();
  TextEditingController quantity2Controller = TextEditingController();
  TextEditingController quantity3Controller = TextEditingController();
  TextEditingController price1Controller = TextEditingController();
  TextEditingController price2Controller = TextEditingController();
  TextEditingController price3Controller = TextEditingController();
  double igv = 0.18;
  double subtotal = 0;
  double subtotal2 = 0;
  TextEditingController totalController = TextEditingController();

  late String name, lastname, dni;
  void erase() {
    setState(() {
      /* clean */
    });
  }

  void sum() {
    setState(() {
      int price1 = int.tryParse(price1Controller.text)?.toInt() ?? 0;
      int price2 = int.tryParse(price2Controller.text)?.toInt() ?? 0;
      int price3 = int.tryParse(price3Controller.text)?.toInt() ?? 0;
      int quantity1 = int.tryParse(quantity1Controller.text)?.toInt() ?? 1;
      int quantity2 = int.tryParse(quantity2Controller.text)?.toInt() ?? 1;
      int quantity3 = int.tryParse(quantity3Controller.text)?.toInt() ?? 1;
      double total =
          ((price1 * quantity1) + (price2 * quantity2) + (price3 * quantity3))
              .toDouble();
      subtotal = total;
      subtotal2 = total * igv;

      totalController.text = (subtotal + subtotal2).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Client',
                  hintText: 'Name of the client',
                ),
              ),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Document',
                  hintText: 'Number of document',
                ),
              ),
              //** divide and create group inputs of quantity producs */
              Container(
                margin: const EdgeInsets.only(top: 20),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: product1Controller,
                decoration: InputDecoration(
                  labelText: 'Product 1',
                  hintText: 'Name of the product',
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: quantity1Controller,
                      decoration: InputDecoration(
                        labelText: 'Quantity 1',
                        hintText: 'Quantity of the product',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: price1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price 1',
                        hintText: 'Price of the product',
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
              ),
              //** divide and create group inputs of quantity product 2*/
              TextField(
                keyboardType: TextInputType.number,
                controller: product2Controller,
                decoration: InputDecoration(
                  labelText: 'Product 2',
                  hintText: 'Name of the product',
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: quantity2Controller,
                      decoration: InputDecoration(
                        labelText: 'Quantity 2',
                        hintText: 'Quantity of the product',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: price2Controller,
                      decoration: InputDecoration(
                        labelText: 'Price 2',
                        hintText: 'Price of the product',
                      ),
                    ),
                  ),
                ],
              ),
              //** divide and create group inputs of quantity product 3*/
              Container(
                margin: const EdgeInsets.only(top: 20),
              ),
              TextField(
                controller: product3Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Product 3',
                  hintText: 'Name of the product',
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: quantity3Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quantity 3',
                        hintText: 'Quantity of the product',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: price3Controller,
                      decoration: InputDecoration(
                        labelText: 'Price 3',
                        hintText: 'Price of the product',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Base Imponible",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(subtotal.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ))),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("IGV",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(igv.toString())),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Total",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Text(totalController.text)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        primary: Colors.white,
                        padding: EdgeInsets.all(10),
                      ),
                      child: Text('Calculate price'),
                      onPressed: () {
                        sum();
                      },
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        primary: Colors.white,
                      ),
                      child: Text('Erase'),
                      onPressed: () {
                        erase();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
