// lib/screens/home_screen.dart
import 'package:coffe_shop/models/coffee_model.dart';
import 'package:coffe_shop/screen/details_screen.dart';
import 'package:coffe_shop/widgets/coffeeselector_andgrid.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/data/dummy_data.dart';
import 'package:coffe_shop/widgets/background.dart';
import 'package:coffe_shop/widgets/location_dropdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedLocation = 'Seoul,Korea';

  void _navigateToDetailsScreen(Coffee coffee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DetailsScreen(coffee: coffee, selectedLocation: _selectedLocation),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                child: LocationDropdown(
                  value: _selectedLocation,
                  onChanged: (value) {
                    setState(() {
                      _selectedLocation = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: CategorySelectorAndGrid(
                  coffees: dummyCoffee,
                  onCoffeeSelected: _navigateToDetailsScreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
