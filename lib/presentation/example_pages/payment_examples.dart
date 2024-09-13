import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:starter_template_get_x/data/data.dart';
import 'package:starter_template_get_x/presentation/example_pages/stripe_payment.dart';
import 'package:starter_template_get_x/presentation/presentation.dart';
import 'package:uuid/uuid.dart';

// TODO: NOTE: Following setups are all testing setup and also you need to pass
// TODO: this secrets from backends don't pass this from frontend.

class PaymentExamples extends StatefulWidget {
  const PaymentExamples({super.key});

  @override
  State<StatefulWidget> createState() {
    return PaymentExamplesState();
  }
}

class PaymentExamplesState extends State<PaymentExamples> {
  String? orderIdByUUID;
  var cfPaymentGatewayService = CFPaymentGatewayService();

  final uuid = const Uuid();

  String selectedId = "";

  @override
  void initState() {
    super.initState();
    orderIdByUUID = generateUniqueId();
    cfPaymentGatewayService.setCallback(verifyPayment, onError);
  }

  String generateUniqueId() {
    String uniqueId =
        uuid.v4(); // Generates a random unique ID (UUID version 4)
    return uniqueId;
  }

  void verifyPayment(String orderId) {
    // TODO: If payment is completed then the flow comes here.
    //  Handle the success flow here
    print("Verify Payment $orderId");
    orderId = generateUniqueId();
  }

  void onError(CFErrorResponse errorResponse, String orderId) {
    // TODO: If payment is completed then the flow comes here.
    //  Handle the error flow here.
    print("Error while making payment");
    orderIdByUUID = generateUniqueId();
  }

  initiatePayment() async {
    // TODO: Following are the test credentials please use your test credentials

    final String appId = dotenv.env['CASHFREE_APPID'] ?? '';
    final String secretKey = dotenv.env['CASHFREE_SCRETKEY'] ?? '';

    final String orderamount = (299 + 29.00).toStringAsFixed(2).toString();

    final headers = {
      'Content-Type': 'application/json',
      'x-client-id': appId,
      'x-client-secret': secretKey,
      'x-api-version': '2025-01-01',
    };

    final data = {
      'order_id': orderIdByUUID,
      'order_amount': orderamount,
      'order_currency': 'INR',
      'customer_details': {
        'customer_id': 'CUST001',
        'customer_email': "vikrantp758@gmail.com",
        'customer_phone': "9021902190",
      },
      'order_note': 'Test Order',
      'order_meta': {
        'return_url':
            'https://example.com/return', // Replace with your return URL
      },
    };

    final response = await Dio().post('https://sandbox.cashfree.com/pg/orders',
        options: Options(headers: headers), data: data);
    // final response = await http.post(
    //   Uri.parse('https://sandbox.cashfree.com/pg/orders'),
    //   headers: headers,
    //   body: json.encode(data),
    // );

    final responseData = await response.data;
    print('response data  :${responseData}');
    return responseData;
    // await createSession(responseData);
  }

  Future<CFSession?> createSession() async {
    try {
      final mySessionIDData = await initiatePayment();
      print(mySessionIDData);

      var session = CFSessionBuilder()
          .setEnvironment(CFEnvironment.SANDBOX)
          .setOrderId(mySessionIDData["order_id"])
          .setPaymentSessionId(mySessionIDData["payment_session_id"])
          .build();
      return session;
    } on CFException catch (e) {
      print(e.message);
    }
    return null;
  }

  startPayment() async {
    try {
      var session = await createSession();
      var cfWebCheckout =
          CFWebCheckoutPaymentBuilder().setSession(session!).build();
      cfPaymentGatewayService.doPayment(cfWebCheckout);
    } on CFException catch (e) {
      print(e);
    }
  }

  startStripePayment() async {
    //TODO :change to stripe
    try {
      var session = await createSession();
      var cfWebCheckout =
          CFWebCheckoutPaymentBuilder().setSession(session!).build();
      cfPaymentGatewayService.doPayment(cfWebCheckout);
    } on CFException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      addSafeArea: true,
      selectedDrawerElement: DrawerElements.logout,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
              onPressed: startPayment,
              buttonText: "Cash Free Example",
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StripePayScreen()));
              },
              buttonText: "Stripe Setup",
            ),
          ],
        ),
      ),
    );
  }
}
