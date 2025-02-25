import 'package:coffe_shop/models/coffee_model.dart';
import 'package:coffe_shop/screen/order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  final Coffee coffee;
  final String selectedLocation;
  const DetailsScreen(
      {super.key, required this.coffee, required this.selectedLocation});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isFavorite = false;
  String _selectedSize = 'M';
  final Map<String, double> _sizePriceMultiplier = {
    'S': 0.8,
    'M': 1.0,
    'L': 1.2,
  };

  double get _currentPrice {
    return widget.coffee.price * _sizePriceMultiplier[_selectedSize]!;
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
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Details',
          style: GoogleFonts.sora(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.pink : Colors.white,
                size: 28,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coffee Image
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.coffee.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Coffee Name
                  Text(
                    widget.coffee.name,
                    style: GoogleFonts.sora(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Temperature
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _getTemperature(widget.coffee.type),
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),

                  // Rating
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 22),
                        SizedBox(width: 4),
                        Text(
                          '${widget.coffee.rating}',
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '(${_isFavorite ? widget.coffee.participants + 1 : widget.coffee.participants} reviews)',
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Container(
                      height: 4,
                      color: Colors.grey[800],
                    ),
                  ),

                  // Description Title
                  Text(
                    'Description',
                    style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Description Content
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 24.0),
                    child: Text(
                      widget.coffee.description,
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        color: Colors.grey[400],
                        height: 1.5,
                      ),
                    ),
                  ),

                  // Size Title
                  Text(
                    'Size',
                    style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Size Buttons
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ['S', 'M', 'L'].map((size) {
                        bool isSelected = _selectedSize == size;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSize = size;
                            });
                          },
                          child: Container(
                            width: 80,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color(0xFFC67C4E)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? Color(0xFFC67C4E)
                                    : Colors.grey[500]!,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              size,
                              style: GoogleFonts.sora(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[500],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Bar with Price and Buy Button
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFF2D2132),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Price',
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(
                      '₩${_currentPrice.toStringAsFixed(0)}',
                      style: GoogleFonts.sora(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC67C4E),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // 구매 로직 구현
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => Order(
                          coffee: widget.coffee,
                          selectedLocation: widget.selectedLocation,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Buy Now',
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTemperature(CoffeeType type) {
    switch (type) {
      case CoffeeType.coldbrew:
      case CoffeeType.frappuccino:
      case CoffeeType.blended:
      case CoffeeType.juice:
        return 'Ice';
      case CoffeeType.brewdCoffee:
      case CoffeeType.espresso:
      case CoffeeType.tea:
        return 'Hot';
      default:
        return 'Ice/Hot';
    }
  }
}
