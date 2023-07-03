import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/API/weather_api.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

final weatherArrayProvider = Provider<StateController<List<dynamic>>>((ref) {
  return ref.watch(weatherArrayStateProvider);
});

final weatherArrayStateProvider = StateProvider((ref) {
  return StateController<List<dynamic>>(['', '**', '**']);
});

void updateArray(ProviderContainer container, String weatherData) {
  final weatherMap =
      WeatherApi.fromJson(jsonDecode(weatherData) as Map<String, dynamic>);

  final weatherArray = container.read(weatherArrayProvider);
  // ignore: cascade_invocations
  weatherArray.state = [
    weatherMap.weatherCondition,
    weatherMap.maxTemperature,
    weatherMap.minTemperature,
  ];
}

const jsonString = '''
{
    "area": "tokyo",
    "date": "2020-04-01T12:00:00+09:00"
}''';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: GreenPage(),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final yumemiWeather = YumemiWeather();
  late String weather;
  final container = ProviderContainer();

  @override
  void initState() {
    super.initState();
    weather = '';
  }

  @override
  void dispose() {
    container.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceSizePlaceholder = deviceSize.width / 2;
    final deviceSizeText = deviceSizePlaceholder / 2;
    final deviceSizeHeight = (deviceSize.height / 2) + deviceSizeText + 32;

    return ProviderScope(
      child: Scaffold(
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
                      'assets/images/${container.read(weatherArrayProvider).state[0]}.svg',
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
                          '${container.read(weatherArrayProvider).state[2]}℃',
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
                          '${container.read(weatherArrayProvider).state[1]}℃',
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                          try {
                            weather = yumemiWeather.fetchWeather(jsonString);
                            updateArray(container, weather);
                            // ignore: avoid_catches_without_on_clauses
                          } catch (e) {
                            // ignore: inference_failure_on_function_invocation
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('エラったよ'),
                                  actions: [
                                    GestureDetector(
                                      child: Text(
                                        'OK',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(color: Colors.blue),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
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

mixin GreenPageMixin<T extends StatefulWidget> on State<T> {
  void navigatorGreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        // ignore: inference_failure_on_instance_creation
        MaterialPageRoute(builder: (context) => const MainApp()),
      ).then((value) {
        (context as Element).markNeedsBuild();
      });
    });
  }

  Widget buildGreenPage(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(),
    );
  }
}

class GreenPage extends StatefulWidget {
  const GreenPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GreenPageState createState() => _GreenPageState();
}

class _GreenPageState extends State<GreenPage> with GreenPageMixin<GreenPage> {
  @override
  Widget build(BuildContext context) {
    navigatorGreen();
    return buildGreenPage(context);
  }
}
