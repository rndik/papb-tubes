import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Pengguna Toko',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget addButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-user'); // Navigasi ke halaman tambah pengguna
        },
        backgroundColor: secondaryColor,
        shape: const CircleBorder(),
        child: Icon(Icons.add, size: 24, color: Colors.white),
      );
    }

    Widget content() {
      // Contoh daftar pengguna (ganti dengan data dari backend)
      List<Map<String, String>> users = [
        {'number': '1', 'name': 'Pengguna 1', 'email': 'pengguna1@example.com'},
        {'number': '2', 'name': 'Pengguna 2', 'email': 'pengguna2@example.com'},
        {'number': '3', 'name': 'Pengguna 3', 'email': 'pengguna3@example.com'},
      ];

      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: Text(
                  user['number']!,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                title: Text(
                  user['name']!,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                subtitle: Text(
                  user['email']!,
                  style: secondaryTextStyle.copyWith(fontSize: 14),
                ),
                trailing: Icon(
                  Icons.edit,
                  color: secondaryColor,
                ),
                onTap: () {
                  // Logika untuk edit pengguna
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[600], // Warna garis pembatas
                thickness: 1, // Ketebalan garis
              );
            },
          ),
        ),
      );
    }

    Widget emptyUser() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_outline,
                size: 80,
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              Text(
                'Belum ada pengguna yang terdaftar',
                style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(height: 12),
              Text(
                'Ayo tambahkan pengguna baru!',
                style: secondaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      floatingActionButton: addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          // Tampilkan `content` atau `emptyUser` berdasarkan kondisi
          Expanded(
            child: content(), // Jika ada pengguna
            // emptyUser(), // Jika pengguna kosong
          ),
        ],
      ),
    );
  }
}
