import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pruebas.dart';
import 'package:flutter_application_1/views/AppColor.dart';

import 'auth/welcome_page.dart';
import 'graficas_screen copy.dart';
import 'index_screen.dart';

/////////////////////////////////////////////////////////
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
               automaticallyImplyLeading: false,
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: true,
        title: Text('Perfil', style: TextStyle(fontFamily: 'stabillo', fontWeight: FontWeight.w400, fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(), 
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: AppColor.primary,
            padding: EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onTap: () {
                print('Code to open file manager');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      // Profile Picture
                      image: DecorationImage(image: AssetImage('assets/images/profile.jpeg'), fit: BoxFit.cover),
                    ),
                  ),
                GestureDetector(
  onTap: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage()));
  },
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Cerrar Sesión',
        style: TextStyle(
          fontFamily: 'verdana',
          fontWeight: FontWeight.w600,
          color: Colors.white,
          decoration: TextDecoration.underline, // Agregamos subrayado para indicar que es clickeable
        ),
      ),
      SizedBox(width: 8),
    ],
  ),
)
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Username',
                  value: user_Username,
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Nombre Completo',
                  value: user_NombreCompleto,
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'N° de Identidad',
                  value: pers_Identidad,
                ),
              ],
            ),
          )
        ],
      ),
           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FloatingBottomNavigationBar()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {          
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Index()));
                },
              ),
              IconButton(
                icon: Icon(Icons.show_chart),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Graficas()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool showProfilePhoto;
  final ImageProvider? profilePhoto;
  final Function? profilePhotoOnPressed;

  CustomAppBar({required this.title, required this.showProfilePhoto, this.profilePhoto, this.profilePhotoOnPressed});

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: AppColor.primary,
      title: title,
      elevation: 0,
      actions: [
        Visibility(
          visible: showProfilePhoto,
          child: Container(
            margin: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: IconButton(
              onPressed: profilePhotoOnPressed == null ? null : () => profilePhotoOnPressed!(),
              icon: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black,
                  image: DecorationImage(
                    image: profilePhoto ?? AssetImage('assets/images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/////////////////////////////////////////////////////////
class UserInfoTile extends StatelessWidget {
  final String? label, value;
  final EdgeInsetsGeometry? margin, padding;
  UserInfoTile({@required this.label, @required this.value, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('$label', style: TextStyle(color: Colors.black, fontSize: 12)),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Text('$value', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'inter')),
          )
        ],
      ),
    );
  }
}

