import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/AppColor.dart';

class FloatingBottomNavigationBar extends StatefulWidget {
  @override
  _FloatingBottomNavigationBarState createState() =>
      _FloatingBottomNavigationBarState();
}

class _FloatingBottomNavigationBarState
    extends State<FloatingBottomNavigationBar> {
  int _selectedIndex = 1; // Índice de la opción seleccionada

  // Lista de íconos para la barra de navegación
  final List<IconData> _icons = [
    Icons.search, // Ícono de historial
    Icons.add, // Ícono de más
    Icons.show_chart, // Ícono de gráficos
  ];

  // Función para cambiar la opción seleccionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Lógica adicional basada en la opción seleccionada
    switch (index) {
      case 0:
        // Lógica para el ícono de historial
        break;
      case 1:
        // Lógica para el ícono de más
        break;
      case 2:
        // Lógica para el ícono de gráficos
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Prueba de Perfil'),
        showProfilePhoto: true,
        profilePhoto: AssetImage('assets/images/profile.png'),
        profilePhotoOnPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
      body: Center(
        child: Text('Contenido de la página'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
      //          peso = "";
      // errorPeso = false;
      // errorCliente = false;
      // errorSucursal = false;
      // errorDepartamento = false;
      // errorMunicipio = false;
      // errorDireccionExacta = false;
      // DireccionExacta = "";
      // cliente = "";
      // sucursal = "";
      // peso = "";
      // departamento = "";
      // municipio = "";
      // DireccionExacta = "";
      // fechaFormateada = "";

      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaquetesForm()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {          
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Index()));
              //   },
              // ),
              // IconButton(
              //   icon: Icon(Icons.show_chart),
              //   onPressed: () {
              //     _onItemTapped(2);
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Graficas()));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
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
                      image: DecorationImage(image: AssetImage('assets/images/foto-perfil.png'), fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Editar Usuario', style: TextStyle(fontFamily: 'verdana', fontWeight: FontWeight.w600, color: Colors.white)),
                      SizedBox(width: 8),
                    ],
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
                  label: 'Nombre Completo',
                  value: 'Aquí va el nombre xd',
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Correo Electrónico',
                  value: 'Aquí el correo',
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'N° de Identidad',
                  value: '0000 0000 00000',
                ),
              ],
            ),
          )
        ],
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

