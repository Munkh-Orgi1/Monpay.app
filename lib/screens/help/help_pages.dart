import 'package:flutter/material.dart';

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
