import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationDropdown extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;

  const LocationDropdown({
    required this.onChanged,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: GoogleFonts.sora(
              fontSize: 12,
              color: Color(0xFFA2A2A2),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              isExpanded: false,
              value: value,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              underline: SizedBox(),
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFFD8D8D8),
              ),
              items: [
                'Seoul,Korea',
                'LA,USA',
                'Tokyo,Japan',
                'London,UK',
                'Paris,France',
                'New York,USA',
                'Beijing,China',
                'Sydney,Australia',
                'Dubai,UAE',
                'Rome,Italy',
                'Berlin,Germany',
                'Moscow,Russia',
              ]
                  .map((location) => DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
