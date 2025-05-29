import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/helper.dart'; // Pastikan path sesuai struktur folder kamu

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 48, bottom: 32),
            decoration: BoxDecoration(
              color: cPrimary,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('asset/pramuka.png'),
                ),
                vsSmall,
                Text(
                  'John Doe',
                  style: headline4.copyWith(
                    color: cWhite,
                    fontWeight: bold,
                  ),
                ),
                vsSuperTiny,
                Text(
                  'johndoe@gmail.com',
                  style: subtitle2.copyWith(
                    color: cWhite.withOpacity(0.8),
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ),
          vsLarge,
          _buildMenuItem('Akun', Icons.person_outline, () {}),
          _buildMenuItem('Ubah Password', Icons.lock_outline, () {}),
          _buildMenuItem('Pengaturan', Icons.settings_outlined, () {}),
          _buildMenuItem('Pusat Bantuan', Icons.help_outline, () {}),
          _buildMenuItem('Log Out', Icons.logout, () {
            // Tambahkan aksi logout
          }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: cPrimary,
        unselectedItemColor: cTextBlue,
        type: BottomNavigationBarType.fixed,
        backgroundColor: cWhite,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Berita'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: 'Transaksi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: cPrimary),
              hsMedium,
              Expanded(
                child: Text(
                  title,
                  style: subtitle1.copyWith(
                    color: cBlack,
                    fontWeight: medium,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
