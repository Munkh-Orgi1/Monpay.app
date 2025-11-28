// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonPayClone());
}

class MonPayClone extends StatelessWidget {
  const MonPayClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDark = false;
  final String username = "Мөнх-Оргил";

  int _currentPage = 0;
  final PageController _pageController = PageController();

  Color get headerColor => _isDark ? const Color(0xFF181818) : Colors.white;
  Color get bodyColor => _isDark ? const Color(0xFF000000) : const Color(0xFFF2F3F7);
  Color get primaryTextColor => _isDark ? Colors.white : Colors.black87;
  Color get secondaryTextColor => _isDark ? Colors.white70 : Colors.grey;
  Color get sectionTitleColor => _isDark ? Colors.white : const Color(0xFF1F2332);
  Color get cardColor => _isDark ? const Color(0xFF151515) : Colors.white;
  Color get navBarColor => _isDark ? const Color(0xFF111111) : Colors.white;
  Color get navSelectedColor => _isDark ? Colors.white : const Color(0xFF3840D9);
  Color get navUnselectedColor => Colors.grey;

  final List<Color> bannerColors = [Colors.redAccent, Colors.deepPurple, Colors.blueAccent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: headerColor,
      body: SafeArea(
        child: Column(
          children: [
            _headerSection(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: bodyColor,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16, bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bannerSection(context),
                      const SizedBox(height: 24),
                      _sectionTitle("Урамшуулал"),
                      const SizedBox(height: 12),
                      _promotionsRow(),
                      const SizedBox(height: 24),
                      _sectionTitle("Тусламж"),
                      const SizedBox(height: 12),
                      _helpButtonsRow(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _qrFab(),
      bottomNavigationBar: BottomAppBar(
        color: navBarColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomNavItem(icon: Icons.home_filled, label: "Нүүр", selected: true, onTap: () {}),
              const SizedBox(width: 40),
              _bottomNavItem(
                icon: Icons.person_outline,
                label: "Профайл",
                selected: false,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage())),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSection() {
    return Container(
      color: headerColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Оройн мэнд", style: TextStyle(color: secondaryTextColor, fontSize: 16)),
            Text(username, style: TextStyle(color: primaryTextColor, fontSize: 18, fontWeight: FontWeight.w600)),
          ]),
          Row(children: [
            _themeSwitch(),
            const SizedBox(width: 12),
            Icon(Icons.notifications_none, color: primaryTextColor),
          ]),
        ],
      ),
    );
  }

  Widget _themeSwitch() {
    return GestureDetector(
      onTap: () => setState(() => _isDark = !_isDark),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 70,
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: _isDark
              ? const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF5D5FEF), Color(0xFF5D5FEF)])
              : const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF2C2E3E), Color(0xFF141622)]),
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isDark ? 1 : 0,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_cloudDot(10), _cloudDot(12), _cloudDot(10), _cloudDot(8)]),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isDark ? 0 : 1,
              child: Row(mainAxisSize: MainAxisSize.min, children: [_starDot(2), const SizedBox(width: 2), _starDot(3), const SizedBox(width: 4), _starDot(2)]),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            alignment: _isDark ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(width: 26, height: 26, decoration: const BoxDecoration(shape: BoxShape.circle), child: _isDark ? _sunCircle() : _moonCircle()),
          ),
        ]),
      ),
    );
  }

  Widget _cloudDot(double s) => Container(width: s, height: s, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(s)));
  Widget _starDot(double s) => Container(width: s, height: s, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(s)));
  Widget _sunCircle() => Container(decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFFC045)));
  Widget _moonCircle() => Container(
    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFBFC2D1)),
    child: Stack(children: [
      Positioned(left: 6, top: 7, child: Container(width: 7, height: 7, decoration: BoxDecoration(color: const Color(0xFF9DA0B2), borderRadius: BorderRadius.circular(7)))),
      Positioned(right: 6, bottom: 7, child: Container(width: 5, height: 5, decoration: BoxDecoration(color: const Color(0xFF9DA0B2), borderRadius: BorderRadius.circular(5)))),
    ]),
  );

  Widget _bannerSection(BuildContext context) {
    // Одоо нийт 12 баннер болсон
    final int bannerCount = 13;

    return SizedBox(
      height: 220, // Өндрийг 210-аас 220 болгож бага зэрэг томруулав
      child: Column(children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _currentPage = i),
            children: [
              // 1. Mobilife
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MobilifePage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmsad61DNexxwFoy_QkYJlhIEDompM8SbEog&s'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 2. CASHBACK DATA
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CashbackDataPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black,
                    image: const DecorationImage(
                      image: AssetImage('assets/help/banner_cashback.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 3. НАЙЗАА УРИАД ДАТА АВ
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReferralDataPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF1B1B25),
                    image: const DecorationImage(
                      image: AssetImage('assets/help/banner_referral.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 4. 60GB 60% OFF
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DataAlwaysOnPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF006064),
                    image: const DecorationImage(
                      image: AssetImage('assets/help/banner_60gb.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 5. iPhone 17 Pro
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black,
                  image: const DecorationImage(
                    image: AssetImage('assets/help/banner_iphone17.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 6. Travel SIM
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black,
                  image: const DecorationImage(
                    image: AssetImage('assets/help/banner_travel_sim.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 7. MAXMALL GIVEAWAY
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MaxMallGiveawayPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF101020),
                    image: const DecorationImage(
                      image: AssetImage('assets/help/banner_maxmall.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 8. 5-10% ЭРТ ТӨЛБӨЛ
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EarlyPaymentPromoPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF151515),
                    image: const DecorationImage(
                      image: AssetImage('assets/help/banner_early_payment.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 9. MonPay PLUS
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MonPayPlusPromoPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black,
                    image: const DecorationImage(
                      image: AssetImage('assets/help/banner_monpay_plus.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 10. ВИРТУАЛ КАРТТАЙ, MACBOOK-ТЭЙ
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VirtualCardPromoPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black,
                    image: const DecorationImage(
                      image: AssetImage('assets/help/banner_virtual_promo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 11. MonPay KIDS
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MonPayKidsPromoPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFFC37E00),
                    image: const DecorationImage(
                      image: AssetImage('assets/help/banner_monpay_kids.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // --- 12. ШИНЭ: УХААЛАГ ДАТА БАГЦ ---
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SmartDataPromoPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white, // Зураг нь цагаан дэвсгэртэй тул
                    image: const DecorationImage(
                      // Энэ зургийг 'assets/help/banner_smart_data.jpg' гэж хадгалаарай
                      image: AssetImage('assets/help/banner_smart_data.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            bannerCount,
                (i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == i ? 18 : 8,
              height: 4,
              decoration: BoxDecoration(
                color: _currentPage == i ? primaryTextColor : Colors.grey.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ]),
    );
  }
  Widget _sectionTitle(String text) =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text(text, style: TextStyle(color: sectionTitleColor, fontSize: 20, fontWeight: FontWeight.w600)));

  Widget _promotionsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          // 1. 10% Mobicom
          SizedBox(
            width: 160,
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Mobicom10PercentPage())),
              child: Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFF151515),
                  image: const DecorationImage(
                    image: AssetImage('assets/help/promo_card_10percent.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 2. CASHBACK-тай ДАТА
          SizedBox(
            width: 160,
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CashbackDataPage())),
              child: Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black,
                  image: const DecorationImage(
                    image: AssetImage('assets/help/banner_cashback.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 3. MAXMALL GIVEAWAY
          SizedBox(
            width: 160,
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MaxMallGiveawayPage())),
              child: Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFF101020),
                  image: const DecorationImage(
                    image: AssetImage('assets/help/uramshuulal_maxmall.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 4. ШИНЭ: АЯЛЛЫН ДАТА СИМ 1+1 (ДАРЖ БОЛОХГҮЙ)
          SizedBox(
            width: 160,
            child: Container( // GestureDetector байхгүй тул дарахад үйлдэл хийхгүй
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.black,
                image: const DecorationImage(
                  // Баннер хэсэгт ашигласан зургаа энд дахин ашиглав
                  image: AssetImage('assets/help/data_sim.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Хуучин _promoCard функцээ олж устгаад үүгээр солино уу:
  Widget _promoCard({required String title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap, // Энд дарах үйлдлийг холбож байна
      child: Container(
        height: 190,
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              if (!_isDark)
                const BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0, 4))
            ]
        ),
        child: Center(
            child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryTextColor, fontSize: 16, fontWeight: FontWeight.w600)
            )
        ),
      ),
    );
  }

  // ... _helpButtonsRow функц дотор ...

  Widget _helpButtonsRow(BuildContext context) {
    // ЗАСВАР: Энд байсан "Худалдан авалтын зээл...", "MonPay Plus..." гэсэн
    // текстүүдийг хаслаа. Учир нь бид доор тусгай товч болгож нэмсэн.
    final others = [];

    return SizedBox(
      height: 66,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          // 1. Данс цэнэглэх
          HelpPillRecharge(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpRechargePage()));
          }),
          const SizedBox(width: 10),

          // 2. Богино хугацаат зээл
          HelpPillLoan(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpLoanPage()));
          }),
          const SizedBox(width: 10),

          // 3. Урт хугацаат зээл
          HelpPillLongLoan(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpLongLoanPage()));
          }),
          const SizedBox(width: 10),

          // 4. MonPay Awww
          HelpPillAwww(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpAwwwPage()));
          }),
          const SizedBox(width: 10),

          // 5. Виртуал карт
          HelpPillVirtualCard(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpVirtualCardPage()));
          }),
          const SizedBox(width: 10),

          // 6. MonPay Plus
          HelpPillMonPayPlus(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpMonPayPlusPage()));
          }),
          const SizedBox(width: 10),

          // 7. Худалдан авалтын зээл
          HelpPillPurchaseLoan(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpPurchaseLoanPage()));
          }),

          // Бусад товчлуурууд (хэрэв `others` жагсаалтад юм нэмбэл энд гарна)
          if (others.isNotEmpty) const SizedBox(width: 10),
          for (final t in others) ...[
            _helpButton(t),
            const SizedBox(width: 10),
          ]
        ],
      ),
    );
  }

  Widget _helpButton(String text) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: _isDark ? 0 : 2,
      backgroundColor: cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    onPressed: () {},
    child: Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
        width: 26,
        height: 26,
        decoration: const BoxDecoration(color: Color(0xFF27C46A), shape: BoxShape.circle),
        child: const Icon(Icons.account_balance_wallet_outlined, size: 16, color: Colors.white),
      ),
      const SizedBox(width: 8),
      Text(text, style: TextStyle(color: primaryTextColor, fontSize: 14)),
    ]),
  );

  Widget _qrFab() => Container(
    width: 72,
    height: 72,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: const LinearGradient(colors: [Color(0xFF5B5CFF), Color(0xFF783CFF)]),
      boxShadow: [BoxShadow(color: const Color(0xFF5B5CFF).withValues(alpha: 0.6), blurRadius: 20, offset: const Offset(0, 8))],
    ),
    child: const Center(child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 32)),
  );

  Widget _bottomNavItem({required IconData icon, required String label, required bool selected, required VoidCallback onTap}) {
    final color = selected ? navSelectedColor : navUnselectedColor;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 80,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, color: color),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(color: color, fontSize: 12)),
        ]),
      ),
    );
  }
}

// ---------------- MOBILIFE PAGE (UPDATED) ----------------
// ---------------- MOBILIFE PAGE (UPDATED - EXACT MATCH) ----------------
class MobilifePage extends StatefulWidget {
  const MobilifePage({super.key});

  @override
  State<MobilifePage> createState() => _MobilifePageState();
}

class _MobilifePageState extends State<MobilifePage> {
  // Сонгогдсон индексийг хадгалах хувьсагч
  int _selectedIndex = 0;

  // Бүтээгдэхүүний мэдээллүүд
  final List<Map<String, dynamic>> _products = [
    {
      "title": "Хорт хавдрын даатгал",
      "subtitle": "Та хамгаалалтаа нэмэгдүүлээрэй",
      "amount": "50,000,000₮",
      "icon": Icons.home_outlined, // Гэрийн дүрс
    },
    {
      "title": "Өөртөө тааруулж сонгох",
      "subtitle": "Сар бүрийн эрх",
      "amount": "100,000₮",
      "icon": Icons.umbrella_outlined, // Шүхэрний дүрс
    },
    {
      "title": "Онлайн бүртгүүлэх",
      "subtitle": "30 секундэд бүртгүүлнэ",
      "amount": "0₮",
      "icon": Icons.file_download_outlined, // Татах дүрс
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentProduct = _products[_selectedIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8), // Арын дэвсгэр саарал
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
            // 1. Дээд талын цагаан хэсэг (Header)
            _buildTopSection(),

            const SizedBox(height: 24),

            // 2. "Даатгалын бүтээгдэхүүнүүд" гарчиг
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Даатгалын бүтээгдэхүүнүүд",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF111827)),
              ),
            ),
            const SizedBox(height: 16),

            // 3. Доод талын Карт (Switcher хэсэг)
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
                  // Title
                  Text(
                    currentProduct['title'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  // Subtitle
                  Text(
                    currentProduct['subtitle'],
                    style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.3),
                  ),
                  const SizedBox(height: 24),

                  // --- SELECTOR ROW (Tab Switcher) ---
                  Row(
                    children: [
                      // Зүүн талын тасархай зураастай дугуй (Placeholder)
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid, width: 1.5), // Dotted effect is hard in pure flutter container, using solid grey for clean look matching image style
                        ),
                        child: Icon(Icons.circle_outlined, color: Colors.grey.shade300, size: 20), // Placeholder icon
                      ),

                      const SizedBox(width: 12),

                      // Pill Shaped Switcher
                      Container(
                        height: 56,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6), // Саарал дэвсгэр
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
                                  boxShadow: isSelected
                                      ? [const BoxShadow(color: Black12, blurRadius: 4, offset: Offset(0, 2))]
                                      : null,
                                ),
                                child: Icon(
                                  _products[index]['icon'],
                                  color: isSelected ? const Color(0xFFE53935) : Colors.grey, // Selected: Red, Unselected: Grey
                                  size: 24,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  // -----------------------------------

                  const SizedBox(height: 24),

                  // Amount
                  Text(
                    currentProduct['amount'],
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
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

  // Дээд талын хэсэг (Өмнөх кодтой ижил)
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
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    shape: BoxShape.circle
                ),
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

// ---------------- PRODUCT CARD WIDGET (FIXED ICONS) ----------------
class _ProductCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool isActive;

  const _ProductCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280, // Card width
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isActive
            ? Border.all(color: Colors.transparent) // Active үед хүрээгүй
            : Border.all(color: Colors.transparent),
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
          // Icon in Circle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF), // Very light blue bg
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF4F46E5), size: 22), // Blue Icon
          ),

          const Spacer(),

          // Title
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
          ),
          const SizedBox(height: 4),

          // Subtitle
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),

          const SizedBox(height: 12),

          // Amount (Right Aligned visually via Row or just Text)
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

// == НОГООН ICONТОЙ ХАР PILL ТОВЧ ==
class HelpPillRecharge extends StatelessWidget {
  final VoidCallback onTap;
  const HelpPillRecharge({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(color: const Color(0xFF171717), borderRadius: BorderRadius.circular(32), boxShadow: const [
          BoxShadow(color: Color(0x19000000), blurRadius: 8, offset: Offset(0, 3)),
        ]),
        child: Row(mainAxisSize: MainAxisSize.min, children: const [
          _GreenIcon(),
          SizedBox(width: 10),
          Text("Дансаа хэрхэн цэнэглэх вэ?", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
        ]),
      ),
    );
  }
}

// == ЯГААН/PURPLE ICON-ТОЙ ХАР PILL (Богино зээл) ==
class HelpPillLoan extends StatelessWidget {
  final VoidCallback onTap;
  const HelpPillLoan({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF171717),
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [BoxShadow(color: Color(0x19000000), blurRadius: 8, offset: Offset(0, 3))],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _LoanCircleIcon(),
            SizedBox(width: 10),
            Text(
              "Зээл хэрхэн авах вэ?",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoanCircleIcon extends StatelessWidget {
  const _LoanCircleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(color: Color(0xFF7B61FF), shape: BoxShape.circle), // purple
      child: const Icon(Icons.account_balance_wallet_outlined, size: 18, color: Colors.white),
    );
  }
}


class _GreenIcon extends StatelessWidget {
  const _GreenIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(color: Color(0xFF27C46A), shape: BoxShape.circle),
      child: const Center(
        // түр wallet дүрс – Monpay-гийнхтай төстэй
        child: Icon(Icons.account_balance_wallet_rounded, size: 18, color: Colors.white),
      ),
    );
  }
}

// == ТУСЛАМЖ: ДАНС ЦЭНЭГЛЭХ ЗААВАР ДЭЛГЭЦ ==
class HelpRechargePage extends StatelessWidget {
  const HelpRechargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          // 1) Гарчиг
          const Text(
            "Monpray данс цэнэглэх",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),

          // 2) Огноо
          const Text(
            "2024/08/13",
            style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14),
          ),
          const SizedBox(height: 16),

          // 3) Divider
          const Divider(color: Color(0xFF2A2A2D), thickness: 1),
          const SizedBox(height: 16),

          // 4) Тайлан/тайлбар текст
          const Text(
            "Хэрэглэгч та Монпэй апликейшны “Цэнэглэх” цэсээр орж Монпэй дансаа цэнэглэх боломжтой. "
                "Эсвэл өөрийн ашигладаг интернет банкны апликейшнаас Мобифинанс ББСБ-г сонгон өөрийн Монпэй дансны дугаараа оруулан шилжүүлэг хийснээр таны Монпэй данс цэнэглэгдэнэ. "
                "(Монпэй апликейшны “Миний булан” цэснээс 99******** загвар бүхий Монпэй дансны дугаараа мэдэж авах боломжтой)",
            style: TextStyle(
              color: Color(0xFFEEEEEE),
              fontSize: 16,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 16),

          // 5) Зураг
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/help/recharge_guide.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 320,
                color: const Color(0xFF1F1F22),
                alignment: Alignment.center,
                child: const Text(
                  "assets/help/recharge_guide.jpg (зураг нэмэх)",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// == Туслах жижиг виджетүүд ==
class _BrandMark extends StatelessWidget {
  const _BrandMark({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(width: 72, height: 28, decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFE53935), Color(0xFFFB6A5B)]), borderRadius: BorderRadius.all(Radius.circular(20)))),
      const SizedBox(height: 22),
      Container(width: 120, height: 120, decoration: const BoxDecoration(color: Color(0xFFFFF5E6), shape: BoxShape.circle), child: const Center(child: Icon(Icons.card_giftcard, size: 64, color: Color(0xFFFF9F1C)))),
    ]);
  }
}

// ------- OTHER PAGES -------
class HelpDetailPage extends StatelessWidget {
  final String title;
  const HelpDetailPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: Center(child: Text("Энэ бол '$title' дэлгэц.\n(Placeholder UI)", textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 18))),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Профайл"), backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: const Center(child: Text("Профайл дэлгэц (placeholder)", style: TextStyle(color: Colors.white, fontSize: 18))),
    );
  }
}

// == ТУСЛАМЖ: "Зээл хэрхэн авах вэ?" ДЭЛГЭЦ ==
class HelpLoanPage extends StatelessWidget {
  const HelpLoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = "Богино хугацаат зээл хэрхэн авах вэ?";
    const String date = "2024/08/13";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: const Color(0xFF0E0E10),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          // Гарчиг
          const Text(title, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),

          // Огноо
          const Text(date, style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14)),
          const SizedBox(height: 16),

          // Divider
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 16),

          // Урт тайлбар
          const Text(
            "Богино хугацаат зээл хэрхэн авах вэ?\n\n"
                "Хэрэглэгч та MonPay аппликейшны үндсэн цэсээс “ЗЭЭЛ АВАХ” товчийг дарж өр орлогын харьцаагаа "
                "тогтоосноор 2,500,000 хүртэлх төгрөгийн зээлийг авах боломжтой.\n\n"
                "Богино хугацаат зээлийн үндсэн мэдээлэл:\n"
                "• Зээлийн дээд хэмжээ 2,500,000 төгрөг хүртэл\n"
                "• 1–3 сар хүртэлх хугацаатай\n"
                "• Сарын хүү 1.9%–3.4%\n"
                "• Зээлийн хүү ашигласан хоногоор тооцогдоно\n"
                "• Барьцаа хөрөнгө шаардахгүй\n\n"
                "Богино хугацаат зээлийн шалгуур:\n"
                "• 18 нас хүрсэн Монгол улсын иргэн байх\n"
                "• Цахим мөнгөний гэрээ байгуулсан\n"
                "• Зээлийн эрх нээх гэрээ байгуулсан\n"
                "• Өр, орлогын харьцаа хэтрээгүй\n"
                "• Зээлийн Мэдээллийн Санд хэвийнээс бусад зээлгүй\n"
                "• Мобикомын дугаараа 6+ сар идэвхтэй ашигласан",
            style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 16, height: 1.55),
          ),
          const SizedBox(height: 18),

          // Том зураг (asset)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/help/loan_guide.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 240,
                color: const Color(0xFF1F1F22),
                alignment: Alignment.center,
                child: const Text("assets/help/loan_guide.jpg", style: TextStyle(color: Colors.white70)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================== 1) LONG-TERM LOAN PILL (NEW ADDITION) ==================
class HelpPillLongLoan extends StatelessWidget {
  final VoidCallback onTap;
  const HelpPillLongLoan({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF171717),
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [BoxShadow(color: Color(0x19000000), blurRadius: 8, offset: Offset(0, 3))],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _LongLoanIcon(),
            SizedBox(width: 10),
            Text(
              "Урт хугацаат зээл хэрхэн авах вэ?",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _LongLoanIcon extends StatelessWidget {
  const _LongLoanIcon({super.key});

  @override
  Widget build(BuildContext context) {
    const Color circleLavender = Color(0xFFB58CFF); // тойрог (илүү цайвар ягаан)
    const Color dollarPurple   = Color(0xFF7B61FF); // "$" тэмдэг (тод ягаан)

    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: circleLavender,
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: const [
          // Цагаан цүнх (briefcase)
          Icon(Icons.work_rounded, size: 18, color: Colors.white),
          // Дунд нь "$" — цүнхэн дотор харагдана
          Text(
            '\$',
            style: TextStyle(
              color: dollarPurple,
              fontSize: 12,
              fontWeight: FontWeight.w900,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
// ================== 2) LONG-TERM LOAN PAGE (NEW ADDITION) ==================
class HelpLongLoanPage extends StatelessWidget {
  const HelpLongLoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = "Урт хугацаат зээл хэрхэн авах вэ?";
    const String date = "2024/08/13";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: const Color(0xFF0E0E10),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          // Гарчиг
          const Text(title, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          // Огноо
          const Text(date, style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14)),
          const SizedBox(height: 16),
          // Divider
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 16),
          // Урт тайлбар (скриншотын бүтэцтэй адил)
          const Text(
            "Урт хугацаат зээл хэрхэн авах вэ?\n\n"
                "Хэрэглэгч та MonPay аппликейшний “УРТ ХУГАЦААТ ЗЭЭЛ” гэсэн цэс рүү орж өр орлогын харьцаагаа тогтоосноор "
                "30 сая хүртэлх төгрөгийн зээлийг авах боломжтой.\n\n"
                "Урт хугацаат зээлийн үндсэн мэдээлэл:\n"
                "• Зээлийн дээд хэмжээ 30 сая төгрөг\n"
                "• 30 сар хүртэлх хугацаатай\n"
                "• Сарын хүү 2.5%\n"
                "• Тухайн сарын төлбөрөө урьдчилж төлөх боломжтой\n"
                "• Барьцаа хөрөнгө шаардахгүй\n\n"
                "Урт хугацаат зээлийн шалгуур:\n"
                "• 18 нас хүрсэн Монгол улсын иргэн байх;\n"
                "• Урт хугацаат зээлийн эрх нээх гэрээ байгуулсан /салбарт хандсан/;\n"
                "• Өр, орлогын харьцаа хэтрээгүй;\n"
                "• нийгмийн даатгал төлдөг байх;\n"
                "• Зээлийн Мэдээллийн Санд хэвийнээс бусад зээлгүй;\n"
                "• Зээлийн эрх 2,000,000 төгрөгөөс дээш;\n\n"
                "Дээрх шалгуурыг ханган дараах зааврын дагуу Урт хугацаат зээлдээ аваарай.",
            style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 16, height: 1.55),
          ),
          const SizedBox(height: 18),
          // Том зураг (asset) – байхгүй бол placeholder
          const _LongLoanImage(),
        ],
      ),
    );
  }
}

class _LongLoanImage extends StatelessWidget {
  const _LongLoanImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        'assets/help/long_loan_guide.jpg', // таны хавтас
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: 240,
          color: const Color(0xFF1F1F22),
          alignment: Alignment.center,
          child: const Text("assets/help/long_loan_guide.jpg (зураг нэм)", style: TextStyle(color: Colors.white70)),
        ),
      ),
    );
  }
}
// ================== 3) MONPAY AWWW PILL (NEW BUTTON) ==================
class HelpPillAwww extends StatelessWidget {
  final VoidCallback onTap;
  const HelpPillAwww({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Гаднах хүрээний өнгө (Хар саарал)
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E), // Зураг дээрхтэй ижил бараан саарал
          borderRadius: BorderRadius.circular(32), // Бөөрөнхий өнцөг
          boxShadow: const [
            BoxShadow(color: Color(0x19000000), blurRadius: 8, offset: Offset(0, 3))
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Айконы хэсэг
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                // Зураг дээрх зөөлөн улбар шар/хулд өнгө
                color: Color(0xFFEF8761),
                shape: BoxShape.circle,
              ),
              child: const Center(
                // Дэлгүүрийн уутны дүрс (Яг ижилхэн нь shopping_bag_outlined)
                child: Icon(Icons.shopping_bag_outlined, size: 22, color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),

            // 2. Текстийн хэсэг (2 мөр)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "MonPay Awww",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  "shop гэж юу вэ?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

class _AwwwIcon extends StatelessWidget {
  const _AwwwIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // Зургийн эхний icon шиг улбар шар өнгөтэй, дэлгүүрийн уут шиг дүрс
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(color: Color(0xFFF08C5A), shape: BoxShape.circle),
      child: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.white),
    );
  }
}

// ================== MONPAY AWWW HELP PAGE (FULL REPLICA) ==================
class HelpAwwwPage extends StatelessWidget {
  const HelpAwwwPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = "MonPay Awww гэж юу вэ?";
    const String date = "2024/08/13";

    // Text style constants for consistency
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFEEEEEE), fontSize: 15, height: 1.6);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: const Color(0xFF0E0E10),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // --- TOP HEADER ---
          const Text(title, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const Text(date, style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14)),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // --- SECTION 1: Intro ---
          const Text("MonPay Awww гэж юу вэ?", style: headerStyle),
          const SizedBox(height: 12),
          const Text(
            "MonPay-чин танд энэ өдрийн мэндийг хүргэе! Та MonPay Awww гэж юу яриад байгаа бол гэж гайхаж байна уу? Эсвэл MonPay Awww-ийг хэрхэн ашиглахаа сайн мэдэхгүй байна уу? Тэгвэл та яг зөв газраа ирсэн байна.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          const Text(
            "MonPay Awww нь цахим худалдааны нэгдсэн платформ бөгөөд хэрэглэгч таны өдөр тутамдаа үйлчлүүлэх дуртай дэлгүүрүүдийн бараа бүтээгдэхүүнийг танд онлайнаар хаанаас ч хэзээ ч авах боломжийг олгох зорилготой MonPay апп дотор байрлах мини апп юм.",
            style: bodyStyle,
          ),
          const SizedBox(height: 24),

          // --- SECTION 2: How to access ---
          const Text("MonPay Awww руу хэрхэн нэвтрэх вэ гэж бодож байна уу?", style: headerStyle),
          const SizedBox(height: 12),
          const Text(
            "Та MonPay Awww мини апп руу нүүр хуудсан дээр харагдаж байгаа “Awww” логон дээр дараад нэвтрэх боломжтой. Шинээр бүртгүүлсэн хэрэглэгч нартаа 100 лоялти оноо бэлэглэж байгаа гэснэ шүү.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          // IMAGE 1: Orange Banner
          _buildImagePlaceholder("assets/help/awww_banner_1.jpg", Colors.orange.shade800),

          const SizedBox(height: 24),

          // --- SECTION 3: Feedback ---
          const Text("MonPay Awww-д таны үйлчлүүлмээр байгаа дэлгүүр байхгүй байна уу?", style: headerStyle),
          const SizedBox(height: 12),
          const Text(
            "Хэрэв танд MonPay Awww-д оруулмаар байгаа дэлгүүр байгаа бол MonPay Awww мини аппын чат хэсгээр дамжуулан манай үйлчилгээний ажилтанд өөрийн санал хүсэлтийг илгээж боломжтой. Бидэнд хэрэглэгч бүрийн санал хүсэлт маш чухал байх болно.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          // IMAGE 2: Feedback Banner
          _buildImagePlaceholder("assets/help/awww_banner_2.jpg", const Color(0xFFFA7E50)),

          const SizedBox(height: 24),

          // --- SECTION 4: Benefits (Bullet Points) ---
          const Text("MonPay Awww-ийн давуу талуудыг та мэдмээр байна уу?", style: headerStyle),
          const SizedBox(height: 12),
          _buildBulletPoint("Таны дуртай дэлгүүрийн хямдралууд"),
          _buildBulletPoint("Бэлэгтэй урамшууллууд"),
          _buildBulletPoint("Хөнгөлөлтийн купонууд"),
          _buildBulletPoint("Дэлгүүртэйгээ шууд холбогдох боломж бий шүү дээ."),
          const SizedBox(height: 16),
          // IMAGE 3: Screens Banner
          _buildImagePlaceholder("assets/help/awww_banner_3.jpg", const Color(0xFFFDF4E8)),

          const SizedBox(height: 24),

          // --- SECTION 5: Loyalty ---
          const Text(
            "Та MonPay Awww-аас бараа худалдаж аваад худалдан авалт тутмаасаа оноо цуглуулаад дараагийн худалдан авалтаасаа оноогоо хасуулж болно гээд боддоо.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          // IMAGE 4: Loyalty Banner
          _buildImagePlaceholder("assets/help/awww_banner_4.jpg", const Color(0xFFFDF4E8)),

          const SizedBox(height: 24),

          // --- SECTION 6: Loan ---
          const Text("MonPay Awww-аас зээлээр худалдан авалт хиймээр байна гэж үү?", style: headerStyle),
          const SizedBox(height: 12),
          const Text(
            "Хэрэв та MonPay-ийн зээлийн гэрээтэй бөгөөд зээлэр авах нөхцөлийг бүрэн хангасан бол MonPay Awww-аас хүссэн бараагаа зээлээр авах боломжтой. Та яг одоо оролдоод үзээрэй.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          // IMAGE 5: Loan Banner
          _buildImagePlaceholder("assets/help/awww_banner_5.jpg", const Color(0xFF477A5E)),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.circle, size: 6, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFEEEEEE), fontSize: 15, height: 1.6))),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder(String assetPath, Color placeholderColor) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        // Хэрэв зураг олдохгүй бол placeholder өнгө харуулна
        errorBuilder: (_, __, ___) => Container(
          height: 200,
          color: placeholderColor, // Зургийн ерөнхий өнгө
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.image_not_supported_outlined, color: Colors.white54, size: 40),
              const SizedBox(height: 8),
              Text(assetPath, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
// ================== 4) VIRTUAL CARD PILL (BLUE GRADIENT) ==================
class HelpPillVirtualCard extends StatelessWidget {
  final VoidCallback onTap;
  const HelpPillVirtualCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E), // Хар саарал дэвсгэр
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(color: Color(0x19000000), blurRadius: 8, offset: Offset(0, 3))
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Градиент өнгөтэй дугуй Icon
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF64B5F6), // Цайвар цэнхэр (Дээд хэсэг)
                    Color(0xFF1976D2), // Тод цэнхэр (Доод хэсэг)
                  ],
                ),
              ),
              child: const Center(
                child: Icon(Icons.credit_card, size: 20, color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),

            // Текст (2 мөр)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Виртуал карт",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  "хэрхэн захиалах...",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

// ================== VIRTUAL CARD HELP PAGE (FULL REPLICA) ==================
class HelpVirtualCardPage extends StatelessWidget {
  const HelpVirtualCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Текстийн үндсэн загварууд
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFEEEEEE), fontSize: 15, height: 1.6);
    const TextStyle subHeaderStyle = TextStyle(color: Color(0xFFEEEEEE), fontSize: 15, fontWeight: FontWeight.w600, height: 1.6);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: const Color(0xFF0E0E10),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // --- HEADER ---
          const Text(
            "Олон улсын худалдан авалтаа MONPAY ВИРТУАЛ КАРТААР",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          const Text("2024/05/06", style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14)),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 16),

          // --- HERO IMAGE (Card Banner) ---
          _buildImagePlaceholder("assets/help/vcard_banner.jpg", const Color(0xFF1A0528)),
          const SizedBox(height: 16),

          // --- INTRO TEXT ---
          const Text(
            "Олон улсын худалдан авалтаа MONPAY ВИРТУАЛ КАРТААР",
            style: headerStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "Та MonPay апликейшнаа шинэчлэн виртуал картаа онлайнаар үнэгүй захиалан үүсгэж, олон улсын дижитал үйлчилгээг хамгийн хялбараар авах боломжтой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "Жишээ нь, та олон улсын онлайн худалдааны Netflix, Appstore, Spotify, Pinduoduo, Taobao, Amazon гэх мэт сайтуудаас хялбараар худалдан авалт хийх боломжтой болж байна.",
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "Хэрэв та цахим мөнгөний гэрээгүй бол өөрт ойр үйлчилгээний салбарт хандан гэрээгээ байгуулаад MonPay апп дээрээсээ Виртуал картаа өөрөө үүсгэн ашиглах боломжтой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),

          // --- STEPS IMAGE (Phone Screens) ---
          _buildImagePlaceholder("assets/help/vcard_steps.jpg", const Color(0xFF151518)),
          const SizedBox(height: 24),

          // --- FAQ SECTION ---
          const Text("Түгээмэл асуулт, хариултууд:", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 16),

          // FAQ 1
          _buildFaqItem(
              "Виртуал карт гэж юу вэ?",
              "Зөвхөн интернэт орчинд онлайнаар төлбөр хийх зориулалттай буюу онлайн дэлгүүрээс худалдан авалт хийхэд зориулагдсан биет бус карт юм.\nБиет бус карт учраас ПОС болон АТМ дээр гүйлгээ хийх боломжгүйг анхаарна уу."
          ),
          // FAQ 2
          _buildFaqItem(
              "Валютын ханш хэрхэн тооцогдох вэ?",
              "Монпэй данстай олон улсын виртуал карт нь төгрөгөөр тооцогдож бодогдох ба худалдан авалтад тухайн үеийн валютын ханшаар хөрвүүлж тооцно. /Хэрэглэгчийн картын гэрээний 2.6/"
          ),
          // FAQ 3
          _buildFaqItem(
              "Виртуал карт захиалахад төлбөртэй юу?",
              "Монпэй виртуал карт захиалахад ямар нэгэн шимтгэл хураамж байхгүй."
          ),
          // FAQ 4
          _buildFaqItem(
              "Бага насны хүүхэд ашиглах боломжтой юу?",
              "Боломжгүй, Зөвхөн 18 нас хүрсэн хэрэглэгч виртуал карт захиалах боломжтой."
          ),
          // FAQ 5
          _buildFaqItem(
              "Биет карт гаргаж өгөх үү?",
              "Үгүй, Монпэй виртуал карт нь зөвхөн онлайн гүйлгээ хийх боломжтой биет бус карт болно."
          ),
          // FAQ 6
          _buildFaqItem(
              "Картаа хэрхэн цэнэглэх вэ?",
              "Та картаа цэнэглэх шаардлагагүй, Таны монпэй данснаас гүйлгээ хийгдэнэ."
          ),
          // FAQ 7
          _buildFaqItem(
              "И-Пин кодоо мартчихлаа?",
              "Та виртуал картын цэс доторх И-Пин \"Код авах\" дээр дарж хэдэн ч удаа авах боломжтой."
          ),
          // FAQ 8
          _buildFaqItem(
              "Виртуал картын цэс харагдахгүй байна?",
              "Та MonPay апп-аа шинэчлэн татсанаар виртуал карт захиалах боломжтой болно."
          ),
          // FAQ 9
          _buildFaqItem(
              "Жилийн хураамж хэд вэ?",
              "Одоогээр жилийн хураамжгүй байгаа."
          ),
          // FAQ 10
          _buildFaqItem(
              "Unionpay карт захиалж болох уу?",
              "Одоогээр боломжгүй, зөвхөн VISA карт захиалах боломжтой."
          ),
          // FAQ 11
          _buildFaqItem(
              "Хэдэн карт захиалах боломжтой вэ?",
              "Хэрэглэгч зөвхөн 1 карт захиалах боломжтой."
          ),

          const SizedBox(height: 40),
          const Text("MONPAY, \"Хялбар\" байлаа", style: TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Icon(Icons.circle, size: 6, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(question, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 8),
            child: Text(answer, style: const TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.5)),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder(String assetPath, Color placeholderColor) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: 220,
          color: placeholderColor,
          alignment: Alignment.center,
          child: Text(assetPath, style: const TextStyle(color: Colors.white54)),
        ),
      ),
    );
  }
}
// ================== 5) MONPAY PLUS PILL (BLUE ICON) ==================
class HelpPillMonPayPlus extends StatelessWidget {
  final VoidCallback onTap;
  const HelpPillMonPayPlus({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E), // Хар саарал
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(color: Color(0x19000000), blurRadius: 8, offset: Offset(0, 3))
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Custom Icon Widget - 4 хуваагдсан дугуй
            const _MonPayPlusIcon(),
            const SizedBox(width: 12),

            // Текст (2 мөр)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "MonPay Plus гэж",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  "юу вэ?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

// MonPay Plus-ийн Icon-ыг зурж байна (4 хэсэгтэй цагаан дугуй)
class _MonPayPlusIcon extends StatelessWidget {
  const _MonPayPlusIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Color(0xFF007AFF), // Тод хөх өнгө
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Icon доторх зай
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  _slice(Colors.white), // Зүүн дээд
                  const SizedBox(width: 2),
                  _slice(Colors.white), // Баруун дээд
                ],
              ),
            ),
            const SizedBox(height: 2),
            Expanded(
              child: Row(
                children: [
                  _slice(Colors.white), // Зүүн доод
                  const SizedBox(width: 2),
                  _slice(Colors.white.withOpacity(0.5)), // Баруун доод (Бүдэг)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Icon-ы нэг зүсэм
  Widget _slice(Color color) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          // Дүрсийг дугуй хэлбэртэй харагдуулахын тулд радиус өгнө (optional, жижиг учраас анзаарагдахгүй байж мэднэ)
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// ================== MONPAY PLUS HELP PAGE (FULL REPLICA) ==================
class HelpMonPayPlusPage extends StatelessWidget {
  const HelpMonPayPlusPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Текстийн загварууд
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFEEEEEE), fontSize: 15, height: 1.6);
    const TextStyle subHeaderStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: const Color(0xFF0E0E10),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // --- Header ---
          const Text("Monpay plus хэрхэн авах вэ?", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const Text("2024/08/13", style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14)),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // --- Intro ---
          const Text("Monpay plus хэрхэн авах вэ?", style: headerStyle),
          const SizedBox(height: 12),
          const Text(
            "Хэрэглэгч та MonPay Plus үйлчилгээг ашиглан бараа бүтээгдэхүүн худалдан авахдаа MonPay апп-аараа ороод QR кодыг уншуулан өөрт тохируулан 2-6 хуваан төлөх боломжтой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 24),

          // --- Terms Section ---
          const Text("Урт хугацаат зээлийн үндсэн мэдээлэл:", style: subHeaderStyle),
          const SizedBox(height: 8),
          const Text("Зээлийн хэмжээ: 50,000₮ -2,500,000₮ хүртэл", style: bodyStyle),
          const SizedBox(height: 8),

          _buildBulletPoint("1-3 сарын хугацаатай"),
          _buildBulletPoint("Хүү, Урьдчилгаа, Шимтгэлгүй"),
          _buildBulletPoint("2-6 хуваан төлөх боломжтой"),

          const SizedBox(height: 24),

          // --- Requirements Section ---
          const Text("Урт Хугацаат Зээлийн шалгуурууд:", style: subHeaderStyle),
          const SizedBox(height: 12),
          _buildBulletPoint("18 нас хүрсэн Монгол улсын иргэн байх;"),
          _buildBulletPoint("Цахим мөнгөний гэрээ байгуулсан;"),
          _buildBulletPoint("Богино хугацаат зээлийн эрх нээх гэрээ байгуулсан;"),
          _buildBulletPoint("Өр, орлогын харьцаа хэтрээгүй;"),
          _buildBulletPoint("Зээлийн Мэдээллийн Санд хэвийнээс бусад зээлгүй;"),

          const SizedBox(height: 24),

          // --- Footer Instruction ---
          const Text(
            "Хэрэглэгч та дээр дурдсан шалгууруудыг ханган дараах зааврын дагуу MonPay Plus үйлчилгээгээ аваарай.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),

          // --- Guide Image ---
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/monpay_plus_guide.jpg", // Зургийн нэр
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 240,
                color: const Color(0xFF182045), // Зураг дээрхтэй төстэй хар хөх дэвсгэр
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image, color: Colors.white24, size: 48),
                    SizedBox(height: 8),
                    Text("MonPay Plus Guide Image", style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.circle, size: 5, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFEEEEEE), fontSize: 15, height: 1.5))),
        ],
      ),
    );
  }
}
// ================== 6) PURCHASE LOAN PILL (CYAN BLUE) ==================
class HelpPillPurchaseLoan extends StatelessWidget {
  final VoidCallback onTap;
  const HelpPillPurchaseLoan({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E), // Хар саарал
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(color: Color(0x19000000), blurRadius: 8, offset: Offset(0, 3))
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon Container
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF29B6F6), // Зураг дээрх тод цайвар цэнхэр өнгө
                shape: BoxShape.circle,
              ),
              child: const Center(
                // Энгийн картны дүрс
                child: Icon(Icons.credit_card_rounded, size: 20, color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),

            // Текст (2 мөр)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Худалдан",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  "авалтын зээл хэ...", // Зураг дээрх шиг товчилж бичив
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

// ================== PURCHASE LOAN HELP PAGE (FULL REPLICA) ==================
class HelpPurchaseLoanPage extends StatelessWidget {
  const HelpPurchaseLoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Текстийн загварууд
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFEEEEEE), fontSize: 15, height: 1.6);
    const TextStyle subHeaderStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600, height: 1.6);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: const Color(0xFF0E0E10),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // --- Header ---
          const Text(
            "Худалдан авалтын зээл хэрхэн авах вэ?",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text("2024/08/13", style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14)),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // --- Intro Text ---
          const Text("Худалдан авалтын зээл хэрхэн авах вэ?", style: headerStyle),
          const SizedBox(height: 12),
          const Text(
            "Хэрэглэгч та MonPay QR-тай хамтрагч байгууллагуудаас худалдан авалт хийхдээ урьдчилгаа төлбөр төлөлгүйгээр зээл аваад эхний 10 өдөртөө багтааж хүү, шимтгэлгүйгээр зээлээ эргүүлэн төлөөрэй.",
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // --- Loan Info Section ---
          const Text("Урт хугацаат зээлийн үндсэн мэдээлэл:", style: subHeaderStyle),
          const SizedBox(height: 8),

          _buildBulletPoint("Зээлийн хэмжээ: 20,000₮ -2,500,000₮ хүртэл"),
          _buildBulletPoint("Зээл авсан эхний 10 өдөр хүүгүй"),
          _buildBulletPoint("Урьдчилгаа, шимтгэлгүй"),
          _buildBulletPoint("10-аас хойш хоногт сарын зээлийн хүү 4%"),
          _buildBulletPoint("Урт Хугацаат Зээлийн шалгуурууд:"),
          _buildBulletPoint("18 нас хүрсэн Монгол улсын иргэн байх;"),

          const SizedBox(height: 12),
          const Text("Цахим мөнгөний гэрээ байгуулсан;", style: subHeaderStyle),
          const SizedBox(height: 8),

          _buildBulletPoint("Богино хугацаат зээлийн эрх нээх гэрээ байгуулсан;"),
          _buildBulletPoint("Өр, орлогын харьцаа хэтрээгүй;"),
          _buildBulletPoint("Зээлийн Мэдээллийн Санд хэвийнээс бусад зээлгүй;"),

          const SizedBox(height: 24),

          // --- Footer Instruction ---
          const Text(
            "Хэрэглэгч та дээр дурдсан шалгууруудыг ханган дараах зааврын дагуу Худалдан авалтын зээлээ аваарай.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),

          // --- Guide Image ---
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/purchase_loan_guide.jpg", // Зураг
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 220,
                color: const Color(0xFF151625), // Зургийн дэвсгэр хар хөх
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.broken_image_outlined, color: Colors.white24, size: 48),
                    SizedBox(height: 8),
                    Text("assets/help/purchase_loan_guide.jpg", style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 9),
            child: Icon(Icons.circle, size: 5, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFEEEEEE), fontSize: 15, height: 1.5))),
        ],
      ),
    );
  }
}
// ================== CASHBACK DATA PAGE (FULL DETAIL) ==================
class CashbackDataPage extends StatelessWidget {
  const CashbackDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Текстийн загварууд
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 14, height: 1.5);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10), // Хар дэвсгэр
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // --- 1. Header Title ---
          const Text(
            "“CASHBACK-ТАЙ ДАТА” УРАМШУУЛАЛ ЭХЭЛЛЭЭ",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text("2025/08/05", style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14)),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // --- 2. Description Text ---
          const Text(
            "Монпэй болон Мобиком хамтран хэрэглэгчдэдээ зориулан “Cashback-тай дата” урамшууллыг эхлүүллээ. "
                "Та Монпэй аппликейшны “Цэнэглэгч карт” мини апп-ын “ДАТА” цэсээс дурын дата багц худалдан авснаар 5% - 10%-ийн буцаан олголтыг Монпэй дансандаа шууд авах боломжтой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // --- 3. Reminder Bullet Points ---
          const Text("Бяцхан сануулга:", style: headerStyle),
          const SizedBox(height: 12),
          _buildBullet("Буцаан олголт нь хэрэглэгчийн Монпэй дансанд автоматаар олгогдоно."),
          _buildBullet("Хэрэглэгч нэг сард хамгийн ихдээ 20,000₮ хүртэл буцаан авна."),
          _buildSubBullet("5%-ийн багцуудаас хамгийн ихдээ 10,000₮"),
          _buildSubBullet("10%-ийн багцуудаас хамгийн ихдээ 10,000₮"),
          _buildBullet("Зөвхөн өөрийн дугаарт дата авсан тохиолдолд буцаан авна."),
          _buildBullet("Бусдын дугаарт авсан дата урамшуулалд хамрагдахгүй."),
          _buildBullet("Зөвхөн Монпэй аппликейшнаас худалдан авсан тохиолдолд урамшуулал хүчинтэй."),
          _buildBullet("Kids Account хэрэглэгчид мөн урамшуулалд хамрагдана."),
          _buildBullet("Бусад операторын хэрэглэгчид оролцох боломжгүй."),

          const SizedBox(height: 24),

          // --- 4. Data Packages Table ---
          const Text("Дата багцууд болон буцаан олголтын мэдээлэл", style: headerStyle),
          const SizedBox(height: 16),

          // Table Header
          _buildTableHeader(),

          // --- Sections ---
          _buildSectionHeader("Хэрэглээний\nхязгааргүй дата"),
          _buildTableRow("1", "3GB /3 хоног/", "3,000₮"),
          _buildTableRow("2", "5GB /5 хоног/", "5,000₮"),
          _buildTableRow("3", "7GB /7 хоног/", "7,000₮"),
          _buildTableRow("4", "Social /1 хоног/", "1,500₮"),
          _buildTableRow("5", "Social /3 хоног/", "3,500₮"),
          _buildTableRow("6", "Social /7 хоног/", "7,500₮"),
          _buildTableRow("7", "15GB /15 хоног/", "15,000₮", isTenPercent: true),
          _buildTableRow("8", "25GB /30 хоног/", "25,000₮", isTenPercent: true),
          _buildTableRow("9", "70GB /30 хоног/", "65,000₮", isTenPercent: true),
          _buildTableRow("10", "99GB /30 хоног/", "90,000₮", isTenPercent: true),

          _buildSectionHeader("Сошиал багц"),
          _buildTableRow("1", "10GB /Instagram/", "5,000₮"),
          _buildTableRow("2", "10GB /Tiktok/", "5,000₮"),
          _buildTableRow("3", "10GB /Facebook/", "5,000₮"),

          _buildSectionHeader("Видео багц"),
          _buildTableRow("1", "10GB /Netflix/", "7,000₮"),
          _buildTableRow("2", "40GB /Voo/", "7,000₮"), // Image shows 40GB for Voo maybe? corrected based on price similarity
          _buildTableRow("3", "10GB /Youtube/", "7,000₮"),

          _buildSectionHeader("Music багц"),
          _buildTableRow("1", "10GB /Apple music/", "3,000₮"),
          _buildTableRow("2", "10GB /Spotify/", "3,000₮"),

          _buildSectionHeader("Gaming багц"),
          _buildTableRow("1", "Fortnite 10GB + 1GB", "3,000₮"),
          _buildTableRow("2", "MLBB 10GB + 1GB", "3,000₮"),
          _buildTableRow("3", "FC Mobile 10GB + 1GB", "3,000₮"),
          _buildTableRow("4", "League of Legends 10GB + 1GB", "3,000₮"), // Wrapped text handled by widget
          _buildTableRow("5", "PUBG 10GB + 1GB", "3,000₮"),
          _buildTableRow("6", "Roblox 10GB + 1GB", "3,000₮"),

          _buildSectionHeader("Шөнийн дата"),
          _buildTableRow("1", "30GB /Night owl/", "3,000₮"),
          _buildTableRow("2", "100GB /Night owl/", "5,000₮"),

          _buildSectionHeader("Triple boost"),
          _buildTableRow("1", "4GB+4GB Game +12GB Night", "8,000₮", isTenPercent: true),
          _buildTableRow("2", "4GB+4GB Social +12GB Night", "8,000₮", isTenPercent: true),

          _buildSectionHeader("Бусад багц"),
          _buildTableRow("1", "10GB /Teams/", "5,000₮"),
          _buildTableRow("2", "10GB /Google meeting/", "5,000₮"),
        ],
      ),
    );
  }

  // --- Helper Widgets for Table & Lists ---

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.circle, size: 6, color: Colors.white)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFDDDDDD), fontSize: 14, height: 1.4))),
        ],
      ),
    );
  }

  Widget _buildSubBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 20), // Indent
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.circle_outlined, size: 6, color: Colors.white)), // Hollow circle
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFDDDDDD), fontSize: 14, height: 1.4))),
        ],
      ),
    );
  }

  // Хүснэгтийн толгой (Тэр саарал хэсэг биш, баганын нэрс)
  Widget _buildTableHeader() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white24))
      ),
      child: Row(
        children: [
          // Эхний багана (Саарал хэсэгт гарчиг орно, энд хоосон байж болно эсвэл "Багц")
          // Зураг дээр header нь section header дотроо байна.
          // Гэхдээ баруун талд "Cashback %" гэж байна.
          Expanded(flex: 5, child: Container()), // Spacer for the Section Header part
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center, // Зураг дээр Price болон % нь нэг багана шиг харагдаж байна
                child: const Text("", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              )
          ),
        ],
      ),
    );
  }

  // Хэсгийн гарчиг (Саарал дэвсгэртэй)
  Widget _buildSectionHeader(String title) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFD1D1D1), // Light grey background
        border: Border(bottom: BorderSide(color: Colors.white, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ),
          Container(width: 1, height: 40, color: Colors.white), // Vertical divider
          const Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "Cashback %",
                style: TextStyle(color: Colors.black, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Хүснэгтийн мөр (Хар дэвсгэртэй)
  Widget _buildTableRow(String index, String name, String price, {bool isTenPercent = false}) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(bottom: BorderSide(color: Colors.white24, width: 0.5)),
      ),
      child: Row(
        children: [
          // Index (1, 2...)
          SizedBox(
            width: 30,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
              child: Text(index, style: const TextStyle(color: Colors.white, fontSize: 13)),
            ),
          ),
          // Vertical Divider
          Container(width: 1, height: 40, color: Colors.white24),

          // Package Name
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 13)),
            ),
          ),
          // Vertical Divider
          Container(width: 1, height: 40, color: Colors.white24),

          // Price
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Text(price, style: const TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.center),
            ),
          ),
          // Vertical Divider
          Container(width: 1, height: 40, color: Colors.white24),

          // Percent (5% or 10%)
          SizedBox(
            width: 50,
            child: Center(
              child: Text(
                isTenPercent ? "10%" : "5%",
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ================== REFERRAL DATA PAGE (НАЙЗАА УРИАД ДАТА АВ) ==================
class ReferralDataPage extends StatelessWidget {
  const ReferralDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Текстийн загварууд
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);
    const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 14, height: 1.5);
    const TextStyle linkStyle = TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.underline);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10), // Хар дэвсгэр
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // --- Header Title ---
          const Text("Найзаа уриад дата ав", style: titleStyle),
          const SizedBox(height: 8),
          const Text("2025/02/24", style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14)),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // --- Hero Image (Banner) ---
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/banner.jpg", // Таны явуулсан 2 дахь зураг
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 200,
                color: const Color(0xFF1B1B25),
                alignment: Alignment.center,
                child: const Text("assets/help/banner.jpg", style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // --- Дүрэм Section ---
          const Text("Дүрэм:", style: headerStyle),
          const SizedBox(height: 12),
          const Text(
            "Хэрэглэгч та урилгын кодоо ашиглан урьдчилсан төлбөрт багцтай найзаа уриад, урьсан найз тань дараа төлбөрт багц руу амжилттай шилжсэн тохиолдолд:",
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          const Text("- Танд 5GB дата бэлэглэнэ.", style: bodyStyle),
          const SizedBox(height: 8),
          const Text("- Дараа төлбөрт багцын шинэ хэрэглэгч болсон найзад тань 15GB дата бэлэглэнэ.", style: bodyStyle),

          const SizedBox(height: 24),

          // --- Уралдаан Section ---
          const Text("Уралдаан:", style: headerStyle),
          const SizedBox(height: 12),
          const Text(
            "Урьсан 1 найз тань Дараа төлбөрт багц руу амжилттай шилжсэн тохиолдолд та 1 оноотой болно. (Оноо тэнцсэн тохиолдолд багц ахилт хийсэн хугацааг харгалзан зэрэглэл тогтооно.",
            style: bodyStyle,
          ),

          const SizedBox(height: 24),

          // --- Link ---
          GestureDetector(
            onTap: () {
              // Энд линк рүү үсрэх код бичиж болно (url_launcher ашиглан)
              debugPrint("Link tapped");
            },
            child: const Text(
              "https://mobicom.mn/mobiapp/referral",
              style: linkStyle,
            ),
          ),
        ],
      ),
    );
  }
}
// ================== DATA ALWAYS ON PAGE (60GB 60% OFF) ==================
class DataAlwaysOnPage extends StatelessWidget {
  const DataAlwaysOnPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.5);
    const TextStyle subHeaderStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 16, fontWeight: FontWeight.w600);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          const Text("DATA ALWAYS ON “60GB 60% OFF” УРАМШУУЛАЛ", style: titleStyle),
          const SizedBox(height: 8),
          const Text("2025/11/11", style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 14)),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          const Text("DATA ALWAYS ON “60GB 60% OFF” УРАМШУУЛАЛ", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 16),

          const Text(
            "2025 оны 11 сарын 30-ыг дуустал 30 өдрийн 60GB дата багц 60,000₮-өөс хямдарч 24,000₮ боллоо. Та зөвхөн Мобиком аппликэйшнээр идэвхжүүлэх боломжтой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),

          const Text("Идэвхжүүлэх заавар:", style: subHeaderStyle),
          const SizedBox(height: 12),
          const Text("- Мобиком апп нүүр хуудас -> “60GB 60% off” баннер", style: bodyStyle),
          const SizedBox(height: 8),
          const Text("- Мобиком апп нүүр хуудас -> “Урамшуулал цэс” -> “Data always on” баннер", style: bodyStyle),
          const SizedBox(height: 8),
          const Text(
            "- Мобиком апп нүүр хуудас -> “Дата” -> “Урамшуулал дата багц” -> “Data always on” баннер дээр дарж идэвхжүүлээрэй.",
            style: bodyStyle,
          ),

          const SizedBox(height: 24),

          // --- Bottom Image (Poster) ---
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/60gb.jpg", // ЗАМ ЗАСАВ
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 300,
                color: const Color(0xFF00838F),
                alignment: Alignment.center,
                child: const Text("assets/help/60gb.jpg", style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ================== MAXMALL GIVEAWAY PAGE ==================
class MaxMallGiveawayPage extends StatelessWidget {
  const MaxMallGiveawayPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Текстийн загварууд
    const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.5);
    const TextStyle dateStyle = TextStyle(color: Color(0xFFA3A3A3), fontSize: 14);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10), // Хар дэвсгэр
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // --- Header ---
          const Text("MAXMALL GIVEAWAY эхэллээ!", style: titleStyle),
          const SizedBox(height: 8),
          const Text("2025/11/04", style: dateStyle),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // --- Intro Text ---
          const Text(
            "Maxmall-аас худалдан авалт хийж, 1,000,000 төгрөгийн ялагч болох боломжийг MonPay хэрэглэгчиддээ олгож байна.",
            style: bodyStyle,
          ),
          const SizedBox(height: 24),

          // --- How to participate ---
          const Text("Яаж оролцох вэ?", style: headerStyle),
          const SizedBox(height: 8),
          const Text(
            "Худалдан авалтаа MonPay-р хийхэд л хангалттай. Мөн MonPay PLUS үйлчилгээг ашиглан урьдчилгаагүй, шимтгэлгүй, 2–6 хуваан төлөх нөхцөлтэйгээр худалдан авалт хийгээд Giveaway-д оролцох боломжтой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 24),

          // --- Prize ---
          const Text("Шагнал:", style: headerStyle),
          const SizedBox(height: 8),
          const Text(
            "Нийт 1,000,000 төгрөгийн тус бүр 3 азтан тодруулна.",
            style: bodyStyle,
          ),
          const SizedBox(height: 24),

          // --- Duration ---
          const Text("Урамшууллын хугацаа:", style: headerStyle),
          const SizedBox(height: 8),
          const Text(
            "2024 оны 10-р сарын 20-наас 11-р сарын 30-ныг хүртэл.\nЯлагчдыг MonPay-ийн албан ёсны фэйсбүүк хуудаснаас LIVE хийн тодруулна.",
            style: bodyStyle,
          ),
        ],
      ),
    );
  }
}
// ================== EARLY PAYMENT PROMO PAGE (ЗАСВАРЛАСАН - 1 ЗУРАГТАЙ) ==================
class EarlyPaymentPromoPage extends StatelessWidget {
  const EarlyPaymentPromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Text Styles
    const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 14, height: 1.5);
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
    const TextStyle subHeaderStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
    const TextStyle dateStyle = TextStyle(color: Color(0xFFA3A3A3), fontSize: 14);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10), // Хар дэвсгэр
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // 1. Header
          const Text("Мобикомын төлбөрөө monpay-ээр төлөөд 10%, ...", style: titleStyle),
          const SizedBox(height: 8),
          const Text("2022/08/08", style: dateStyle),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // 2. Banner Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/promo_early_payment_banner.jpg",
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 250,
                color: const Color(0xFF2D221E),
                alignment: Alignment.center,
                child: const Text("assets/help/promo_early_payment_banner.jpg", style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 3. Intro Text
          const Text(
            "бөгөөд төлбөрөө monpay апликейшн, эсвэл mobicom апликейшн -> MonPay дансаар сар бүрийн",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          _buildGiftRow("5-10-ны дотор төлөхөд 10%,"),
          const SizedBox(height: 8),
          _buildGiftRow("11-20-ны дотор төлөхөд 5%-ийн буцаан олголтыг MonPay дансандаа урамшуулал болгон авна."),
          const SizedBox(height: 24),

          const Text(
            "MonPay нь Монголын хамгийн анхны цахим мөнгөний тусгай зөвшөөрлийг эзэмшигч Мобифинанс ББСБ-ын хөгжүүлж буй апликейшн юм. Уг апликейшныг ашигласнаар та төрөл бүрийн урамшуулалд хамрагдахаас гадна...",
            style: bodyStyle,
          ),
          const SizedBox(height: 40),

          // --- 4. Mobicom App Instructions (SINGLE IMAGE) ---
          const Center(child: Text("Mobicom апликейшн", style: headerStyle)),
          const SizedBox(height: 20),

          // Mobicom-ийн 4 утастай том зургийг энд тавина
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/promo_mobicom_steps.jpg", // Mobicom-ийн бүтэн зураг
              fit: BoxFit.fitWidth, // Өргөндөө тааруулна
              errorBuilder: (_, __, ___) => Container(
                height: 400,
                color: const Color(0xFF1F1F22),
                alignment: Alignment.center,
                child: const Text("assets/help/promo_mobicom_steps.jpg", style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // --- 5. MonPay App Instructions (SINGLE IMAGE) ---
          const Center(child: Text("2. MONPAY АПЛИКЕЙШН", style: headerStyle)),
          const SizedBox(height: 20),

          // MonPay-ийн 2 утастай том зургийг энд тавина
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/promo_monpay_steps.jpg", // MonPay-ийн бүтэн зураг
              fit: BoxFit.fitWidth,
              errorBuilder: (_, __, ___) => Container(
                height: 300,
                color: const Color(0xFF1F1F22),
                alignment: Alignment.center,
                child: const Text("assets/help/promo_monpay_steps.jpg", style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // --- 6. Notes (Санамж) ---
          const Text("Санамж:", style: subHeaderStyle),
          const SizedBox(height: 16),
          _buildPinPoint("Буцаан олголтын урамшуулал нь роуминг, гар утас, төхөөрөмжийн зээл... зэрэгт хамаарахгүй."),
          _buildPinPoint("MonPay цахим мөнгөний гэрээ байгуулаагүй хэрэглэгчид өдөрт 40'000₮-өөс дээш гүйлгээ хийх боломжгүй..."),
          _buildPinPoint("Төлбөрөө эрт төлөх тусам илүү их буцаан олголт авах тул..."),

          const SizedBox(height: 40),
          const Center(child: Text("MONPAY, “хялбар” байлаа", style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildGiftRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("🎁", style: TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.5))),
      ],
    );
  }

  Widget _buildPinPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("📌", style: TextStyle(fontSize: 16)),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFDDDDDD), fontSize: 14, height: 1.5))),
        ],
      ),
    );
  }
}
// ================== MONPAY PLUS PROMO PAGE ==================
class MonPayPlusPromoPage extends StatelessWidget {
  const MonPayPlusPromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.6);
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
    const TextStyle dateStyle = TextStyle(color: Color(0xFFA3A3A3), fontSize: 14);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // Header
          const Text("MonPay PLUS - Төлбөрийн боломж нэмэгдлээ", style: titleStyle),
          const SizedBox(height: 8),
          const Text("2024/06/11", style: dateStyle),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // Intro Text
          const Text("MonPay PLUS - Төлбөрийн боломж нэмэгдлээ", style: headerStyle),
          const SizedBox(height: 16),
          const Text(
            "Та Монпэй PLUS үйлчилгээг 50,000₮-с дээш үнийн дүнтэй бүтээгдэхүүн үйлчилгээ худалдан авахдаа ашиглан ямар ч урьдчилгаа төлбөр төлөхгүйгээр, хүүгүй, шимтгэлгүй 2-6 хуваан төлөх боломжтой боллоо.",
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "Танд Монпэй зээлийн эрх үүссэн бол 50,000-2,500,000 төгрөгийн бүтээгдэхүүн үйлчилгээ худалдан авахдаа Monpay PLUS ашиглан 2-6 хуваан төлөөрэй.",
            style: bodyStyle,
          ),
          const SizedBox(height: 24),

          // Advantages List
          const Text("MonPay PLUS үйлчилгээний давуу талууд:", style: headerStyle),
          const SizedBox(height: 12),
          _buildBulletPoint("50,000₮-с дээш үнийн дүнтэй худалдан авалтад ашиглах боломжтой"),
          _buildBulletPoint("Доод үнийн дүн бага"),
          _buildBulletPoint("Урьдчилгаагүй"),
          _buildBulletPoint("Шимтгэлгүй"),
          _buildBulletPoint("2-6 хуваан төлөх боломжтой"),
          _buildBulletPoint("Танд Монпэй зээлийн эрх үүссэн бол шууд ашиглах боломжтой"),

          const SizedBox(height: 24),

          // Banner Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/banner_monpay_plus.jpg", // "Боломжоо нэм" зураг
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 200,
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text("assets/help/banner_monpay_plus.jpg", style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Footer Text
          const Text(
            "Та MonPay PLUS үйлчилгээг ашиглан BTF компанийн оруулж ирдэг дэлхийн алдартай брэндүүд болох Adidas, Reebok, Levi's, Summit, Menbur, Crocs, Dr.Martens, Guess, Liu-Jo, New Era зэрэг дэлгүүрээр үйлчлүүлэхдээ MonPay PLUS үйлчилгээг ашиглаарай.",
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "Мөн Gobi, BLU, DEER, RG Label зэрэг үндэсний брэндүүдээс бараа, бүтээгдэхүүн худалдан авахдаа урьдчилгаагүй, хүүгүй хуваан төлөөрэй. MonPay PLUS үйлчилгээг ашиглах боломжтой хамтрагч байгууллагуудын талаарх мэдээллийг MonPay апп-н Зээл цэс рүү орж Дэлгүүрүүд хэсгээс хараарай.",
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "Та бизнесээ MonPay PLUS үйлчилгээг нэвтрүүлэн бидэнтэй хамтарч ажиллахыг хүсвэл digitalbusiness@mobifinance.mn мэйл хаягаар хүсэлтээ илгээнэ үү.",
            style: bodyStyle,
          ),
          const SizedBox(height: 30),
          const Text("MonPay PLUS -Төлбөрийн боломжоо нэм.", style: TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.circle, size: 5, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.5))),
        ],
      ),
    );
  }
}
// ================== VIRTUAL CARD PROMO PAGE (MACBOOK) ==================
class VirtualCardPromoPage extends StatelessWidget {
  const VirtualCardPromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.5);
    const TextStyle dateStyle = TextStyle(color: Color(0xFFA3A3A3), fontSize: 14);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10), // Хар дэвсгэр
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // Header
          const Text("Виртуал Карттай, Macbook-тэй", style: titleStyle),
          const SizedBox(height: 8),
          const Text("2024/06/24", style: dateStyle),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // Content Text
          const Text(
            "Супер бэлгүүдтэй Монпэй виртуал картын урамшуулал үргэлжилж байна.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          const Text(
            "Монпэй Виртуал картаар олон улсын худалдан авалтаа хийгээд iPhone 15, Playstation 5, Macbook Air-M2 чиптэй, 100,000₮- 1,000,000₮ хүртэлх худалдан авалтын эрхийн бичиг зэрэг олон супер бэлгүүдийн эзэн болоорой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          const Text(
            "Виртуал картаа ашиглан 30,000₮-с дээш худалдан авалт, төлбөр төлөлт гэх мэт гүйлгээ хийх бүрдээ урамшуулалд оролцох 1 эрх авч тохиролд оролцоорой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          const Text(
            "Бэлгийн эзнийг 10-р сарын 02-нд Monpay facebook хуудсанд Live-р тодруулна.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          const Text(
            "Урамшуулал 06-р сарын 24-с 09-р сарын 30-г дуустал.",
            style: bodyStyle,
          ),
          const SizedBox(height: 24),

          // Banner Image (Macbook)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/promo_virtual_macbook.jpg", // Macbook-тэй зураг
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 300,
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text("assets/help/promo_virtual_macbook.jpg", style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ================== MONPAY KIDS PROMO PAGE ==================
class MonPayKidsPromoPage extends StatelessWidget {
  const MonPayKidsPromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.55);
    const TextStyle boldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w700);
    const TextStyle dateStyle = TextStyle(color: Color(0xFFA3A3A3), fontSize: 14);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // Header
          const Text("MonPay Kids - үйлчилгээний заавар", style: titleStyle),
          const SizedBox(height: 8),
          const Text("2023/10/18", style: dateStyle),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // Main Image (Girl reading book)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/promo_kids_main.jpg", // "MonPay Kids" том зураг
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 250,
                color: Colors.purple,
                alignment: Alignment.center,
                child: const Text("assets/help/promo_kids_main.jpg", style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Description
          const Text(
            "Хүүхдийн дансны үндсэн зорилго нь хүүхдэд санхүүгийн анхан шатны мэдлэг олгож зөв дадал суулгах зорилготой бөгөөд эцэг эх болон хүүхдийн хоорондын санхүүгийн үл ойлголцлыг үгүй болгоход оршино.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          const Text(
            "Эцэг эх нь өөрсдийн Монпэй дансаар хүүхдийнхээ дансны хуулга, үлдэгдэл харж хэрэглээг хянаж, сонирхолтой даалгаваруудыг зохиож, зорилгын дансны биелэлтийг ч мөн харах боломжтой байна.",
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // Bullet 1: Task
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("• ", style: titleStyle),
            Expanded(
              child: RichText(
                text: TextSpan(style: bodyStyle, children: [
                  const TextSpan(text: "Task буюу даалгавар: ", style: boldStyle),
                  const TextSpan(
                      text: "хүүхэд болон эцэг эх тохиролцон гэрийн ажил хийх, ном унших эсвэл шинэ үг цээжлэх гэх мэт даалгаврууд дээр урамшууллын дүн тохирон биелүүлснээр хүүхдээ урамшуулах функц юм. Энэ функц нь хүүхдэд багаас санхүүгийн харилцаанд орох мэдлэгийг өгөх зорилготой. Хүүхэд даалгавар/task/ биелүүлснээр авах мөнгөний 70%-нь хүүхдийн үндсэн дансанд орно."
                  ),
                ]),
              ),
            ),
          ]),
          const SizedBox(height: 16),

          // Bullet 2: Goal
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("• ", style: titleStyle),
            Expanded(
              child: RichText(
                text: TextSpan(style: bodyStyle, children: [
                  const TextSpan(text: "Goal буюу зорилгын данс: ", style: boldStyle),
                  const TextSpan(
                      text: "зорилгын функц нь хүүхдэд бага наснаас хуримтлал болон мөнгө хадгалах ойлголтыг өгөх зорилготой. Хүүхэд даалгавар/task/ биелүүлснээр авах мөнгөний 30%-нь зорилгын биелэлтэд орно."
                  ),
                ]),
              ),
            ),
          ]),

          const SizedBox(height: 16),
          const Text("i Зорилгын функц нь хадгаламж биш учир хүү тооцохгүй", style: TextStyle(color: Colors.white70, fontSize: 13, fontStyle: FontStyle.italic)),
          const SizedBox(height: 24),

          // Diagram Image (Piggy bank tree)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/promo_kids_diagram.jpg", // Схем зураг
              fit: BoxFit.fitWidth,
              errorBuilder: (_, __, ___) => Container(
                height: 300,
                color: Colors.white,
                alignment: Alignment.center,
                child: const Text("assets/help/promo_kids_diagram.jpg", style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ================== SMART DATA PROMO PAGE (УХААЛАГ ДАТА БАГЦ) ==================
class SmartDataPromoPage extends StatelessWidget {
  const SmartDataPromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Styles
    const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.55);
    const TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
    const TextStyle dateStyle = TextStyle(color: Color(0xFFA3A3A3), fontSize: 14);
    const TextStyle linkStyle = TextStyle(color: Colors.blue, fontSize: 14, decoration: TextDecoration.underline);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10), // Хар дэвсгэр
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // Header
          const Text("Хэрэгтэйгээ сонго... “Ухаалаг дата багц”", style: titleStyle),
          const SizedBox(height: 8),
          const Text("2025/02/24", style: dateStyle),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // Main Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/banner_smart_data.jpg", // "Ухаалаг дата багц" зураг
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 220,
                color: Colors.white,
                alignment: Alignment.center,
                child: const Text("assets/help/banner_smart_data.jpg", style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Header 2
          const Text("Хэрэгтэйгээ сонго... “Ухаалаг дата багц”", style: headerStyle),
          const SizedBox(height: 12),
          const Text(
            "Бүх хэрэглээнд ашиглах 30 хоногийн 3GB, 10GB, 15GB ДАТА БАГЦ дээрээ нэмээд өөрт хэрэгтэй дагалдах эрхүүдээ хамтад нь авах уу?",
            style: bodyStyle,
          ),
          const SizedBox(height: 24),

          // Features List
          const Text("Дата багцын дагалдах эрхүүд:", style: headerStyle),
          const SizedBox(height: 12),

          const Text("Хэл сурах хүсэлтэй хэрэглэгчдэд зориулсан -> 7 орны хэл сурах боломжтой uTalk аппликэйшны эрх (Англи, Солонгос, Орос, Япон, Турк, Хятад, Франц)", style: bodyStyle),
          const SizedBox(height: 12),
          const Text("Mobile Legends тоглогчдод зориулсан -> Mobile Legends 110 Diamonds", style: bodyStyle),
          const SizedBox(height: 12),
          const Text("Кино хорхойтнуудад зориулсан -> VOO багцууд", style: bodyStyle),
          const SizedBox(height: 12),
          const Text("MonPay хэрэглэгчдэд зориулсан -> MonPay 1000₮, 1500₮, 4500₮ -ийн купон", style: bodyStyle),

          const SizedBox(height: 24),

          const Text("Та дата болон дагалдах эрхээ сонгож хэрэгтэйгээ аваарай.", style: bodyStyle),
          const SizedBox(height: 12),
          const Text("“Ухаалаг дата багц”-аа мобиком аппликэйшний “дата” -> “ухаалаг” цэсээс аваарай.", style: bodyStyle),
          const SizedBox(height: 12),
          const Text("Дагалдах эрхээ идэвхжүүлэх код болон зааврыг таны дугаар руу мессежээр илгээх болно.", style: bodyStyle),

          const SizedBox(height: 16),

          // Link
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              Text("Дэлгэрэнгүй мэдээлэл: ", style: bodyStyle),
              Text("https://www.mobicom.mn/mobiapp/data-smart/", style: linkStyle),
            ],
          ),

          const SizedBox(height: 24),
          const Text("“Ухаалаг дата багц”-ын дагалдах эрхүүдийн тухай:", style: headerStyle),
          const SizedBox(height: 12),

          const Text(
            "uTalk нь гадаад хэлний өдөр тутмын хэрэглээний үг, хэллэгийг дуудлага, сонсгол болон харилцаагаар дамжуулан сургах аргыг санал болгодог ба интерактив тоглоом, дасгалуудтай тул хэл сурах явцыг сонирхолтой, хялбар, үр дүнтэй болгодгоороо давуу талтай.Тус аппликэйшнаар Англи, Солонгос, Орос, Япон, Турк, Хятад, Франц хэл суралцах боломжтой бөгөөд гадаад хэлийг эхнээс нь сурах гэж буй хүмүүст ч тохиромжтой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "MonPay-р хийж байгаа худалдан авалтын төлбөрөө төлөх үед купоноо ашиглах боломжтой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "Гадаад, дотоодын шилдэг кино, контентын ертөнцөөр аялуулах VOO платформ 7 хоногийн эрхтэй Content, Premium, Premium Plus багцуудаас сонгоорой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "Mobile Legends тоглоомын 110 Diamonds-г идэвхжүүлэх кодыг таны дугаар руу мессежээр илгээх болно.",
            style: bodyStyle,
          ),
        ],
      ),
    );
  }
}
// ================== MOBICOM 10% PROMO PAGE ==================
class Mobicom10PercentPage extends StatelessWidget {
  const Mobicom10PercentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Styles
    const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700);
    const TextStyle bodyStyle = TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.5);
    const TextStyle dateStyle = TextStyle(color: Color(0xFFA3A3A3), fontSize: 14);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10), // Хар дэвсгэр
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Таны сонорт"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          // Header
          const Text("MonPay апп-р мобикомын төлбөрөө төлөөд 10%...", style: titleStyle),
          const SizedBox(height: 8),
          const Text("2024/05/10", style: dateStyle),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2D)),
          const SizedBox(height: 24),

          // Main Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/help/10%.jpg", // Дэлгэрэнгүй доторх зураг
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 300,
                color: const Color(0xFF8AB4F8),
                alignment: Alignment.center,
                child: const Text("assets/help/10%.jpg", style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Content
          const Text(
            "MonPay апп-р мобикомын төлбөрөө төлөөд 10%, 5% буцаан олголт авах боломжтой.",
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          _buildBulletPoint("5-10ны өдрийн хооронд төлбөл 10%"),
          _buildBulletPoint("11-20ны өдрийн хооронд төлбөл 5% MonPay дансандаа шууд аваарай."),

          const SizedBox(height: 24),
          const Text("Ямар хэрэглэгч урамшуулалд хамаарах вэ?", style: bodyStyle),
          const SizedBox(height: 12),
          _buildBulletPoint("Хувь хэрэглэгч, байгууллагын хувь хэрэглэгчийн гэрээтэй дараа төлбөрт болон хосолсон төлбөрт хэрэглэгч"),
          _buildBulletPoint("Зөвхөн өөрийн дугаарын төлбөрийг төлсөн хэрэглэгч"),

          const SizedBox(height: 24),
          const Text("Төлөх заавар:", style: bodyStyle),
          const SizedBox(height: 12),
          _buildBulletPoint("monpay апп > Төлбөр цэс > Мобиком төлбөр төлөлт"),
          _buildBulletPoint("mobicom апп > Төлбөр цэс > Төлбөр төлөлт > Утасны төлбөр > monpay-ээр төлөх"),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: Icon(Icons.circle, size: 5, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFDDDDDD), fontSize: 15, height: 1.5))),
        ],
      ),
    );
  }
}