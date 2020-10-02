import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
 
        primarySwatch: Colors.blue,
     
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
       routes: {
        '/second': (context)=> SecondRoute(),
      },
      home: Scaffold(
        
        appBar: AppBar(title: Text('Menu'),),
        drawer: MenuLateral(),
        body: Center(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
                  child: Image(
                   image: AssetImage('images/prueba.jpg')
                 ),       
               ),
               Text('Hotel el Cielo'),

               Padding(
              padding: const EdgeInsets.all(8.0),
                  child: Image(
                   image: AssetImage('images/promo.jpg')
                 ),       
               ),
               Text('Hotel el Cielo'),
          ],)
      
          ),
        backgroundColor: Colors.blueGrey,
      )
      
    );
  }
}
class MenuLateral extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text('Hotel el Cielo'), 
            accountEmail: Text(''),   
            ),
             ListTile(
               leading: Icon(Icons.room_service),
                title: Text('Habitaciones'),
                onTap: () {
               // change app state...
                  Navigator.pushNamed(context,'/second');
                 },
              ),
        ]
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Habitaciones"),
      ),
      body: Center(
        child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
                  child: Image(
                   image: AssetImage('images/prueba.jpg')
                 ),       
               ),
               Text('Hotel el Cielo'),

               Padding(
              padding: const EdgeInsets.all(8.0),
                  child: Image(
                   image: AssetImage('images/promo.jpg')
                 ),       
               ),
               Text('Hotel el Cielo'),

               RaisedButton(
                 onPressed: () {
                  // Navigate back to first route when tapped.
                 Navigator.pop(context);
                  },
                 child: Text('Volver'),
                 ),
          ],),

      ),
    );
  }
}