import 'package:coffe_shop/models/coffee_model.dart';
import 'package:coffe_shop/widgets/location_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Order extends StatefulWidget {
  final Coffee coffee;
  final String selectedLocation;

  const Order({
    super.key,
    required this.coffee,
    required this.selectedLocation,
  });

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool _isDelivery = true;
  late String _selectedLocation;
  int _quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedLocation = widget.selectedLocation;
  }

  double get _deliveryFee {
    return _isDelivery ? 3000 : 0;
  }

  double get _coffeePrice {
    return widget.coffee.price;
  }

  double get _totalPrice {
    return (_coffeePrice * _quantity) + _deliveryFee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF201520),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Order',
          style: GoogleFonts.sora(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Delivery Toggle
                  Row(
                    children: [Expanded(child: _buildToggleButton())],
                  ),

                  SizedBox(height: 24),

                  // Delivery Address
                  Text(
                    "Delivery Address",
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 12),

                  // Location Dropdown
                  _isDelivery
                      ? LocationDropdown(
                          value: _selectedLocation,
                          onChanged: (value) {
                            setState(() {
                              _selectedLocation = value!;
                            });
                          })
                      : Text(
                          "Pick up in store",
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),

                  SizedBox(height: 32),

                  // Coffee Item
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2D2132),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // Image
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(widget.coffee.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 16),

                        // Coffee Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.coffee.name,
                                style: GoogleFonts.sora(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                _getCoffeeType(widget.coffee.type),
                                style: GoogleFonts.sora(
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Quantity Selector
                        Row(
                          children: [
                            _buildQuantityButton(Icons.remove, () {
                              if (_quantity > 1) {
                                setState(() {
                                  _quantity--;
                                });
                              }
                            }),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                '$_quantity',
                                style: GoogleFonts.sora(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            _buildQuantityButton(Icons.add, () {
                              setState(() {
                                _quantity++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),

                  // Payment Summary
                  Text(
                    "Payment Summary",
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 16),

                  // Price
                  _buildPaymentRow("Price",
                      "₩${(_coffeePrice * _quantity).toStringAsFixed(0)}"),

                  SizedBox(height: 8),

                  // Delivery Fee
                  _buildPaymentRow(
                      "Delivery Fee", "₩${_deliveryFee.toStringAsFixed(0)}"),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(color: Colors.grey[800]),
                  ),

                  // Total
                  _buildPaymentRow(
                    "Total",
                    "₩${_totalPrice.toStringAsFixed(0)}",
                    isTotal: true,
                  ),
                ],
              ),
            ),
          ),

          // Order Button
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFF2D2132),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("40분 후 도착됩니다"),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Order',
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF2D2132),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildToggleOption("Delivery", true),
          ),
          Expanded(
            child: _buildToggleOption("Pick up", false),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption(String text, bool isDeliveryOption) {
    final isSelected = _isDelivery == isDeliveryOption;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isDelivery = isDeliveryOption;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFC67C4E) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.grey[400],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFF3D3143),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildPaymentRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.sora(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.white : Colors.grey[400],
          ),
        ),
        Text(
          value,
          style: GoogleFonts.sora(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Color(0xFFC67C4E) : Colors.white,
          ),
        ),
      ],
    );
  }

  String _getCoffeeType(CoffeeType type) {
    switch (type) {
      case CoffeeType.coldbrew:
        return "Cold Brew";
      case CoffeeType.brewdCoffee:
        return "Brewed Coffee";
      case CoffeeType.espresso:
        return "Espresso";
      case CoffeeType.frappuccino:
        return "Frappuccino";
      case CoffeeType.blended:
        return "Blended";
      case CoffeeType.tea:
        return "Tea";
      case CoffeeType.juice:
        return "Juice";
      default:
        return "Coffee";
    }
  }
}
