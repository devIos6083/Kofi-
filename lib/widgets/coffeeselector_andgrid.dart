// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:coffe_shop/models/coffee_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySelectorAndGrid extends StatefulWidget {
  final List<Coffee> coffees;
  final Function(Coffee) onCoffeeSelected;

  const CategorySelectorAndGrid({
    super.key,
    required this.coffees,
    required this.onCoffeeSelected,
  });

  @override
  State<CategorySelectorAndGrid> createState() =>
      _CategorySelectorAndGridState();
}

class _CategorySelectorAndGridState extends State<CategorySelectorAndGrid> {
  CoffeeType? _selectedCategory;
  String _searchQuery = '';
  List<Coffee> _filteredCoffees = [];

  @override
  void initState() {
    super.initState();
    _filteredCoffees = widget.coffees;
  }

  void _filterCoffees() {
    setState(() {
      _filteredCoffees = widget.coffees.where((coffee) {
        // 카테고리 필터
        bool matchesCategory =
            _selectedCategory == null || coffee.type == _selectedCategory;

        // 검색어 필터
        bool matchesSearch = _searchQuery.isEmpty ||
            coffee.name.toLowerCase().contains(_searchQuery.toLowerCase());

        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _filterCoffees();
    });
  }

  void _updateCategory(CoffeeType? category) {
    setState(() {
      _selectedCategory = category;
      _filterCoffees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 검색바
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: onSearchbar(
            onSearch: _updateSearchQuery,
            onFilter: () {
              // 필터 버튼 기능 - 필요시 구현
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: SizedBox(
            height: 140,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("img/banner.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFED5151),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 30,
                        width: 60,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Promo",
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Buy one get",
                        style: GoogleFonts.sora(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "one Free",
                        style: GoogleFonts.sora(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // 카테고리 선택기
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildCategorySelector(),
        ),

        const SizedBox(height: 20),

        // 커피 그리드
        Expanded(
          child: _buildCoffeeGrid(),
        ),
      ],
    );
  }

  Widget _buildCategorySelector() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryButton(null, 'ALL'),
          ...CoffeeType.values.map((type) => _buildCategoryButton(
                type,
                _getCategoryDisplayName(type),
              )),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(CoffeeType? type, String label) {
    final isSelected = _selectedCategory == type;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () => _updateCategory(type),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color:
                isSelected ? Color(0xFFC67C4E) : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: GoogleFonts.sora(
              color: isSelected ? Colors.white : Color(0xFFA2A2A2),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: _filteredCoffees.length,
        itemBuilder: (context, index) {
          return _buildCoffeeItem(_filteredCoffees[index]);
        },
      ),
    );
  }

  Widget _buildCoffeeItem(Coffee coffee) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 커피 이미지와 평점
          Stack(
            children: [
              // 이미지
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  coffee.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // 평점
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      SizedBox(width: 2),
                      Text(
                        '${coffee.rating}',
                        style: GoogleFonts.sora(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 커피 정보
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 이름
                Text(
                  coffee.name,
                  style: GoogleFonts.sora(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                // 타입
                Text(
                  _getCategoryDisplayName(coffee.type),
                  style: GoogleFonts.sora(
                    color: Color(0xFFA2A2A2),
                    fontSize: 12,
                  ),
                ),

                SizedBox(height: 10),

                // 가격과 주문 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₩${coffee.price.toStringAsFixed(0)}',
                      style: GoogleFonts.sora(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => widget.onCoffeeSelected(coffee),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color(0xFFC67C4E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getCategoryDisplayName(CoffeeType type) {
    switch (type) {
      case CoffeeType.coldbrew:
        return 'Cold Brew';
      case CoffeeType.brewdCoffee:
        return 'Brewed Coffee';
      case CoffeeType.espresso:
        return 'Espresso';
      case CoffeeType.frappuccino:
        return 'Frappuccino';
      case CoffeeType.blended:
        return 'Blended';
      case CoffeeType.tea:
        return 'Tea';
      case CoffeeType.juice:
        return 'Juice';
      default:
        return 'Unknown';
    }
  }
}

// 검색바 위젯 업데이트
class onSearchbar extends StatelessWidget {
  const onSearchbar({
    super.key,
    required this.onSearch,
    required this.onFilter,
  });

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
