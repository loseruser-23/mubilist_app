import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/api_service_cuaca.dart';
import 'services/data_cuaca.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'authentication/loginpage.dart';
import 'navbar/homepage.dart';
import 'navbar/newspage.dart';
import 'navbar/profilepage.dart';

class HalUt extends StatefulWidget {
  const HalUt({super.key});

  @override
  State<HalUt> createState() => _HalUtState();
}

class _HalUtState extends State<HalUt> {
  final ApiServiceCuaca apiServiceCuaca = ApiServiceCuaca();
  late Future<DataCuaca> futureDataCuaca;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Tambahkan halaman-halaman lain di sini
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    futureDataCuaca = apiServiceCuaca.fetchWeather('Palembang');
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 198, 40, 40),
        foregroundColor: Colors.white,
        title: FutureBuilder<DataCuaca>(
          future: futureDataCuaca,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('Loading...'),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final dataCuaca = snapshot.data!;
              return _buildAppBarTitle(dataCuaca);
            } else {
              return Text('No data');
            }
          },
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: const Color.fromARGB(255, 245, 179, 1),

        unselectedItemColor: Colors.black,
      ),
    );
  }

  Widget _buildAppBarTitle(DataCuaca dataCuaca) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          'https://openweathermap.org/img/w/${dataCuaca.iconCode}.png',
          width: 50,
          height: 50,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${dataCuaca.cityName}',
              style: GoogleFonts.outfit(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${dataCuaca.temperature}°C,',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            Text(
              '${dataCuaca.description}',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
        SizedBox(width: 120),
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () async {
            Get.to(LoginPage());
          },
        ),
         SizedBox(width: 5),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () async {
            Get.to(LoginPage());
          }
        )
      ],
    );
  }
}
