import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
    
            Container(
              color: Colors.grey[800],
              child: DrawerHeader(
                margin: EdgeInsets.all( 0 ),
                padding: EdgeInsets.all( 0 ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('datos', style: TextStyle(fontSize: 35, fontFamily: 'CromaSans', fontWeight: FontWeight.bold)),
                      Text('gob', style: TextStyle(fontSize: 35, fontFamily: 'CromaSans', fontWeight: FontWeight.normal),),
                      Text('ar', style: TextStyle(fontSize: 35, fontFamily: 'CromaSans', fontWeight: FontWeight.normal),),
                    ],
                  ),
                )
              ),
            ),
        
    
            Column(
              children: [
    
                ListTile(
                  leading: Icon( Icons.show_chart, color: Colors.blue, ),
                  title: Text('Ipc'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'chart');
                  }
                ),
    
                ListTile(
                  leading: Icon( Icons.show_chart_sharp, color: Colors.pink, ),
                  title: Text('Variación'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'variation');
                  }
                ),
    
                ListTile(
                  leading: Icon( Icons.table_chart_outlined, color: Colors.yellow, ),
                  title: Text('Datos'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'data');
                  }
                ),
              ],
            ),
    
          ],
        ),
      ),
    );
  }
}