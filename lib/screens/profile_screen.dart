import 'package:flutter/material.dart';
import '../utils/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffolddark
            : AppColors.scaffoldlight,
        leading: InkWell(
            onTap: () {
              // Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "https://a10.gaanacdn.com/gn_img/artists/Bp1bAynb02/p1bALxPW02/size_m_1568906766.jpg",
                ),
              ),
            )),
        title: Text("Firad Fd"),
      ),
      body: Center(),
    );
  }
}
