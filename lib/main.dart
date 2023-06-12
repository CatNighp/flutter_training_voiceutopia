import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final yumemiWeather = YumemiWeather();
  late String weather;

  @override
  void initState() {
    super.initState();
    weather = '';
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceSizePlaceholder = deviceSize.width / 2;
    final deviceSizeText = deviceSizePlaceholder / 2;
    final deviceSizeHeight = (deviceSize.height / 2) + deviceSizeText + 32;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: deviceSizePlaceholder,
                    height: deviceSizePlaceholder,

                    child: SvgPicture.asset(
                      'assets/images/$weather',
                      width: deviceSizePlaceholder,
                      height: deviceSizePlaceholder,
                      placeholderBuilder: (context) {
                        return const Placeholder();
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        width: deviceSizeText,
                        child: Text(
                          '**℃',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.blue),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        width: deviceSizeText,
                        child: Text(
                          '**℃',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: deviceSizeHeight + 80,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: deviceSizeText,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Close',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.blue),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: deviceSizeText,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          weather = '${yumemiWeather.fetchSimpleWeather()}.svg';
                        });
                      },
                      child: Text(
                        'Reload',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
