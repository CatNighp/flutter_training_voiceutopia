import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceSizePlaceholder = deviceSize.width / 2;
    final deviceSizeText = deviceSizePlaceholder / 2;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: deviceSizePlaceholder,
                    height: deviceSizePlaceholder,
                    child: Placeholder(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
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
                        padding: EdgeInsets.all(16),
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
              bottom: 80,
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
                      onPressed: () {},
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
