import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profilepic.jpeg'),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Febriyansyah',
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text('pebrie23@gmail.com',
                        style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    )),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text('Follows: 150',
                            style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        )),
                        Text('Followers: 800',
                            style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        )),
                      ],
                    ),
                  ],
                ),
                        SizedBox(width: 10),
                        IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.edit_rounded),
                        color: Colors.black,),
              ],
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text('Bio :', style: GoogleFonts.poppins(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('I am a movie enthusiast who loves to explore different genres and styles of films. I enjoy watching movies in my free time and discussing them with fellow movie buffs.',
                  style: GoogleFonts.poppins(fontSize: 14),),
      
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Saved Movies', style: GoogleFonts.poppins(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/soon1.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/soon2.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/soon3.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/soon4.jpg'),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/soon5.jpg'),
                ),
              ),
            ],
          ),
        )
      
                ],
              ),
            ),
          ],
      ),
    );
  }
}
