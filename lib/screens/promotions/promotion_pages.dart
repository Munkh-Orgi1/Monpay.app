import 'package:flutter/material.dart';

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