// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// void main() async {
//   //Initialize Flutter Binding
//   WidgetsFlutterBinding.ensureInitialized();

//   //Assign publishable key to flutter_stripe
//   Stripe.publishableKey = "pk_test_fHdNwHIx1WpMFhc55RPXASgy00JfawALGk";

//   //Load our .env file that contains our Stripe Secret key
//   await dotenv.load(fileName: "assets/.env");

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// Future<void> makePayment() async {
//   try {
//     //STEP 1: Create Payment Intent
//     paymentIntent = await createPaymentIntent('100', 'USD');

//     //STEP 2: Initialize Payment Sheet
//     await Stripe.instance
//         .initPaymentSheet(
//             paymentSheetParameters: SetupPaymentSheetParameters(
//                 paymentIntentClientSecret: paymentIntent![
//                     'client_secret'], //Gotten from payment intent
//                 style: ThemeMode.light,
//                 merchantDisplayName: 'Ikay'))
//         .then((value) {});

//     //STEP 3: Display Payment sheet
//     displayPaymentSheet();
//   } catch (err) {
//     throw Exception(err);
//   }
// }

// createPaymentIntent(String amount, String currency) async {
//   try {
//     //Request body
//     Map<String, dynamic> body = {
//       'amount': calculateAmount(amount),
//       'currency': currency,
//     };

//     //Make post request to Stripe
//     var response = await http.post(
//       Uri.parse('https://api.stripe.com/v1/payment_intents'),
//       headers: {
//         'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
//         'Content-Type': 'application/x-www-form-urlencoded'
//       },
//       body: body,
//     );
//     return json.decode(response.body);
//   } catch (err) {
//     throw Exception(err.toString());
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_integration_example/home_screen.dart';

void main() async {
  //Initialize Flutter Binding
  WidgetsFlutterBinding.ensureInitialized();

  //Assign publishable key to flutter_stripe
  Stripe.publishableKey = "pk_test_fHdNwHIx1WpMFhc55RPXASgy00JfawALGk";

  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //initial route
      home: const HomeScreen(),
    );
  }
}
