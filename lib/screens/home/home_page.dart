import 'package:flutter/material.dart';
import '../help/help_pages.dart';
import '../mobilife/mobilife_page.dart';
import '../profile/profile_page.dart';
import '../promotions/promotion_pages.dart';

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
    final int bannerCount = 13;

    return SizedBox(
      height: 220,
      child: Column(children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _currentPage = i),
            children: [
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
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SmartDataPromoPage())),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    image: const DecorationImage(
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

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(text, style: TextStyle(color: sectionTitleColor, fontSize: 20, fontWeight: FontWeight.w600)),
      );

  Widget _promotionsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
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
          SizedBox(
            width: 160,
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.black,
                image: const DecorationImage(
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

  Widget _promoCard({required String title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            if (!_isDark) const BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0, 4))
          ],
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: primaryTextColor, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _helpButtonsRow(BuildContext context) {
    final others = [];

    return SizedBox(
      height: 66,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          HelpPillRecharge(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpRechargePage()))),
          const SizedBox(width: 10),
          HelpPillLoan(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpLoanPage()))),
          const SizedBox(width: 10),
          HelpPillLongLoan(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpLongLoanPage()))),
          const SizedBox(width: 10),
          HelpPillAwww(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpAwwwPage()))),
          const SizedBox(width: 10),
          HelpPillVirtualCard(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpVirtualCardPage()))),
          const SizedBox(width: 10),
          HelpPillMonPayPlus(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpMonPayPlusPage()))),
          const SizedBox(width: 10),
          HelpPillPurchaseLoan(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpPurchaseLoanPage()))),
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
