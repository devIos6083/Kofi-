import 'package:coffe_shop/data/dummy_data.dart';
import 'package:coffe_shop/models/coffee_model.dart';
import 'package:coffe_shop/screen/details_screen.dart';
import 'package:coffe_shop/widgets/coffeeselector_andgrid.dart';
import 'package:coffe_shop/widgets/location_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/widgets/background.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectLocation = 'Seoul,Korea';

// _HomeState 클래스 내에서
  void _navigateToDetailsScreen(Coffee coffee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(coffee: coffee),
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
                    value: _selectLocation,
                    onChanged: ((value) {
                      setState(() {
                        _selectLocation = value!;
                      });
                    })),
              ),
              Expanded(
                child: CategorySelectorAndGrid(
                  coffees: dummyCoffee,
                  onCoffeeSelected: _navigateToDetailsScreen, // 여기를 변경
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
