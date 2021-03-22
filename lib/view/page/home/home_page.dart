import 'package:flutter/material.dart';
import 'package:mobile_sisola_dev/view/page/listKontrak/contract_page.dart';
import 'package:mobile_sisola_dev/view/page/menu/menu_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeFrag = 0;

  // list halaman yang ditampilin dari botnav
  List<Widget> _frag = [MenuPage(), ContractPage()];

  // list menu bot nav
  List<BottomNavigationBarItem> _botMenu = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black38,),
      label: 'Beranda',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.contacts_sharp, color: Colors.black38,),
      label: 'Contract',
    ),
  ];

  // function mengubah botnav yang aktif
  void _selectFrag(int i) {
    setState(() {
      _activeFrag = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _frag[_activeFrag],
      bottomNavigationBar: BottomNavigationBar(
        items: _botMenu,
        currentIndex: _activeFrag,
        onTap: _selectFrag,
      ),
    );
  }
}
