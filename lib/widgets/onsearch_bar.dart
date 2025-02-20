// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class onSearchbar extends StatelessWidget {
  const onSearchbar(
      {super.key, required this.onSearch, required this.onFilter});
  final Function(String) onSearch;
  final VoidCallback onFilter;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search coffee",
                hintStyle: GoogleFonts.sora(
                  color: Color(0xFFA2A2A2),
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
              onChanged: onSearch,
            ),
          ),
        ),
        SizedBox(width: 15),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(0xFFC67C4E),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: onFilter,
            icon: Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
