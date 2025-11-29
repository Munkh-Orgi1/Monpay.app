import 'package:flutter/material.dart';

class MobilifePage extends StatefulWidget {
  const MobilifePage({super.key});

  @override
  State<MobilifePage> createState() => _MobilifePageState();
}

class _MobilifePageState extends State<MobilifePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _products = [
    {
      "title": "Хорт хавдрын даатгал",
      "subtitle": "Та хамгаалалтаа нэмэгдүүлээрэй",
      "amount": "50,000,000₮",
      "icon": Icons.home_outlined,
    },
    {
      "title": "Өөртөө тааруулж сонгох",
      "subtitle": "Сар бүрийн эрх",
      "amount": "100,000₮",
      "icon": Icons.umbrella_outlined,
    },
    {
      "title": "Онлайн бүртгүүлэх",
      "subtitle": "30 секундэд бүртгүүлнэ",
      "amount": "0₮",
      "icon": Icons.file_download_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentProduct = _products[_selectedIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Mobilife", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white70),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopSection(),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Даатгалын бүтээгдэхүүнүүд",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF111827)),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentProduct['title'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    currentProduct['subtitle'],
                    style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.3),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid, width: 1.5),
                        ),
                        child: Icon(Icons.circle_outlined, color: Colors.grey.shade300, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 56,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(_products.length, (index) {
                            final isSelected = _selectedIndex == index;
                            return GestureDetector(
                              onTap: () => setState(() => _selectedIndex = index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 44,
                                height: 44,
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.white : Colors.transparent,
                                  shape: BoxShape.circle,
                                  boxShadow: isSelected ? [const BoxShadow(color: Black12, blurRadius: 4, offset: Offset(0, 2))] : null,
                                ),
                                child: Icon(
                                  _products[index]['icon'],
                                  color: isSelected ? const Color(0xFFE53935) : Colors.grey,
                                  size: 24,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    currentProduct['amount'],
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16, right: 16),
                children: [
                  _ProductCard(
                    icon: Icons.favorite_outline,
                    title: "Мянган талархал",
                    subtitle: "Сар бүрийн эрх",
                    amount: "300,000₮",
                    isActive: _selectedIndex == 0,
                  ),
                  _ProductCard(
                    icon: Icons.local_hospital_outlined,
                    title: "Төгрөгийн хуримтлал",
                    subtitle: "Онлайн бүртгүүлэх",
                    amount: "5,000,000₮",
                    isActive: _selectedIndex == 1,
                  ),
                  _ProductCard(
                    icon: Icons.shield_outlined,
                    title: "Хамгаалалт",
                    subtitle: "Сар бүрийн эрх",
                    amount: "1,000,000₮",
                    isActive: _selectedIndex == 2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(color: Color(0x08000000), blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), shape: BoxShape.circle),
                child: const Icon(Icons.person_outline, size: 20, color: Colors.black54),
              ),
              const SizedBox(width: 12),
              const Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                  children: [
                    TextSpan(text: "mobi", style: TextStyle(color: Colors.black)),
                    TextSpan(text: "life", style: TextStyle(color: Color(0xFFE53935))),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Icon(Icons.all_inclusive, color: Color(0xFFE53935), size: 48),
          const SizedBox(height: 16),
          const Text(
            "Хорт хавдрын даатгал",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Мобиком Дараа төлбөрт болон Хосолсон төлбөрт хэрэглэгчдэдээ хорт хавдрын даатгалын 1-4 саяын хамгаалалтыг олгож байна.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, height: 1.5, color: Color(0xFF6B7280)),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(color: Color(0xFFFFF5D1), shape: BoxShape.circle),
                ),
                const Icon(Icons.card_giftcard, size: 70, color: Color(0xFFFFB300)),
                const Positioned(top: 20, right: 10, child: Icon(Icons.star, size: 12, color: Colors.pinkAccent)),
                const Positioned(bottom: 25, left: 10, child: Icon(Icons.star, size: 10, color: Colors.pinkAccent)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF3D3D),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: const Text("Шалгах", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

const Color Black12 = Color(0x1F000000);

class _ProductCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool isActive;

  const _ProductCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isActive ? Border.all(color: Colors.transparent) : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF4F46E5), size: 22),
          ),
          const Spacer(),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              amount,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
