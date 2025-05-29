import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';
import 'package:berita_1/routes/route_names.dart';
import 'package:berita_1/views/utils/helper.dart'; // Ganti sesuai path helper-mu

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  int _selectedIndex = 0;
  final List<String> categories = ['Development', 'Marketing'];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              // Header & Search
              Container(
                decoration: BoxDecoration(
                  color: cPrimary,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(),
                        hsSmall,
                        Expanded(
                          child: Text(
                            'Halo, Rendi R!',
                            style: subtitle1.copyWith(
                              color: cWhite,
                              fontWeight: semibold,
                            ),
                          ),
                        ),
                        const Icon(Icons.notifications, color: Colors.white),
                      ],
                    ),
                    vsSmall,
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Apa yang ingin kamu pelajari?',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: cWhite,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              vsMedium,

              // Kategori
              sectionTitle("Kategori Kelas", () {}),
              vsTiny,
              Row(
                children: List.generate(categories.length, (index) {
                  final isSelected = index == selectedCategoryIndex;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() => selectedCategoryIndex = index);
                      },
                      selectedColor: cPrimary,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(
                        color: isSelected ? cWhite : cBlack,
                      ),
                    ),
                  );
                }),
              ),
              vsMedium,

              // Konten: ListView
              Expanded(
                child: ListView(
                  children: [
                    sectionTitle("Lanjutkan Belajarmu", () {}),
                    courseCard("UI/UX Design", "Lanjutkan pembelajaran",
                        'asset/intro1.png'),
                    sectionTitle("Rekomendasi Kelas", () {}),
                    courseCard(
                        "JavaScript", "Dasar - Pemula", 'asset/intro2.png'),
                    sectionTitle("Siap Menjadi Web Developer", () {}),
                    courseCard("HTML & CSS", "Lanjutkan pembelajaran",
                        'asset/img intro 3.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // int _selectedIndex = 0;

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: cPrimary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              context.goNamed(RouteName.home);
              break;
            case 1:
              context.goNamed(RouteName.Bookmal);
              break;
            case 2:
              context.goNamed(RouteName.proFile);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: headline5.copyWith(fontWeight: bold)),
        TextButton(
          onPressed: onSeeAll,
          child:
              Text("Lihat Semua", style: subtitle2.copyWith(color: cPrimary)),
        ),
      ],
    );
  }

  Widget courseCard(String title, String subtitle, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title, style: subtitle1.copyWith(fontWeight: semibold)),
        subtitle: Text(subtitle, style: subtitle2),
      ),
    );
  }
}
