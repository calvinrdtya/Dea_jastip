import 'package:flutter/material.dart';
import 'package:justipin/app/features/location/widgets/detail_view.dart';
import 'package:justipin/app/features/location/widgets/simple_view.dart';

class LocationMapsScreen extends StatefulWidget {
  @override
  _LocationMapsScreenState createState() => _LocationMapsScreenState();
}

class _LocationMapsScreenState extends State<LocationMapsScreen> {
  bool showDetail = false;
  String selectedLocationType = '';

  void toggleDetail() {
    setState(() {
      showDetail = !showDetail;
    });
  }

  void selectLocationType(String type) {
    setState(() {
      selectedLocationType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map view (dummy map)
          Positioned.fill(
            child: Container(
              color: Colors.grey[300],
              child: const Center(child: Text('Map View')),
            ),
          ),
          // Bottom Sheet-like container
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              height: showDetail ? 480 : 300,
              child: showDetail
                  ? LocationDetailView(
                      isLocationSelected: selectedLocationType.isNotEmpty,
                      onBack: toggleDetail,
                      onEdit: toggleDetail,
                      onConfirm: () {
                        Navigator.pushNamed(context, '/list-profile');
                      },
                      onSelectType: selectLocationType,
                    )
                  : LocationSimpleView(
                      isLocationSelected: selectedLocationType.isNotEmpty,
                      onBack: () {
                        Navigator.of(context).pushNamed('/list-profile');
                      },
                      onEdit: toggleDetail,
                      onConfirm: () {
                        // Handle confirm address
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
