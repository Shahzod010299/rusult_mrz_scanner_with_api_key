import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ocr_sdk_example/es130/pages/pin_code_field.dart';
import 'package:flutter_ocr_sdk_example/es130/pages/result_page.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pin Screens Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pin Screens'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PinAuthScreen(),
                  ),
                );
              },
              icon: const Text('Pin Auth'),
              label: const Icon(Icons.lock),
            ),
          ],
        ),
      ),
    );
  }
}

class PinAuthScreen extends StatefulWidget {
  const PinAuthScreen({Key? key}) : super(key: key);

  @override
  State<PinAuthScreen> createState() => _PinAuthScreenState();
}

class _PinAuthScreenState extends State<PinAuthScreen> {
  String pin = "";
  PinTheme pinTheme = PinTheme(
    keysColor: Colors.white,
  );

  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
        _supportState = isSupported;
      }),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason:
        'Subcribe or you will never find any stack overflow answer',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );

      print("Authenticated ---- : $authenticated");
      if (authenticated) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResultPage()));
      }
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) {
      return;
    }
    // we can call setState here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35.0,
                vertical: 35.0,
              ),
              child: Text(
                "PIN kodni kiriting",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Davom etish uchun PIN kodingizni kiriting",
              style: TextStyle(
                // color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  PinCodeField(
                    key: Key('pinField$i'),
                    pin: pin,
                    pinCodeFieldIndex: i,
                    theme: pinTheme,
                  ),
              ],
            ),
            const SizedBox(height: 80),
            CustomKeyBoard(
              pinTheme: pinTheme,
              onChanged: (v) {
                if (kDebugMode) {
                  print(v);
                  pin = v;
                  setState(() {

                  });
                }
              },
              onCompleted: (v) {
                if (pin == '1234') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultPage()),
                  );
                }
                pin = '';
                v = '';
                setState(() {

                });


                print('onCompleted ------->>>>>>>>> $v');
              },
              specialKey: Icon(
                Icons.fingerprint,
                key: const Key('fingerprint'),
                color: pinTheme.keysColor,
                size: 50,
              ),
              specialKeyOnTap: () {
                // open face id and fingerprint
                _authenticate();

                if (kDebugMode) {
                  print('fingerprint');
                }
              },
              maxLength: 4,
            ),
          ],
        ),
      ),
    );
  }
}
