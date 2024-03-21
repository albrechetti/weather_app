import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/domain.dart';
import 'geolocation_view_model.dart';

class GeolocationPage extends StatefulWidget {
  const GeolocationPage({super.key});

  @override
  State<GeolocationPage> createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocation'),
      ),
      body: Consumer<GeolocationViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: Column(
              children: [
                const Text('Geolocation Page'),
                ElevatedButton(
                    onPressed: () async {
                      final result = await viewModel.getCityId(
                        GetCityParam(lat: -20.2022384, lng: -50.9647237),
                      );
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(result.name),
                              content: Text(
                                  '${result.state} - ${result.country} - ${result.id}'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () async {
                                    final weather =
                                        await viewModel.getWeatherData(
                                      result.id.toString(),
                                    );
                                    print(weather.temperature);
                                  },
                                  child: const Text('Show weather temp'),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Get Location'))
              ],
            ),
          );
        },
      ),
    );
  }
}
