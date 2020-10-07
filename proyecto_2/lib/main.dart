import 'package:flutter/material.dart';
import 'package:proyecto/CieloHabitacionDetails.dart';
import 'package:proyecto/hotel_pra.dart';

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
          '/second': (context) => SecondRoute(),
        },
        home: Scaffold(
          appBar: AppBar(
            title: Text('Menu'),
          ),
          drawer: MenuLateral(),
          body: Center(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(image: AssetImage('images/prueba.jpg')),
              ),
              Text('Hotel el Cielo'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(image: AssetImage('images/promo.jpg')),
              ),
              Text('Hotel el Cielo'),
            ],
          )),
          backgroundColor: Colors.blueGrey,
        ));
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: Text('Hotel el Cielo'),
          accountEmail: Text(''),
        ),
        ListTile(
          leading: Icon(Icons.room_service),
          title: Text('Habitaciones'),
          onTap: () {
            // change app state...
            Navigator.pushNamed(context, '/second');
          },
        ),
      ]),
    );
  }
}

class SecondRoute extends StatelessWidget {

  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

void _onHabitacionPressed(CieloHabitacion habitacion, BuildContext context) async {
  notifierBottomBarVisible.value = false;
  await Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2){
         return FadeTransition(
           opacity: animation1,
           child: CieloHabitacionDetails(),
           );
      }
    )
    );
    notifierBottomBarVisible.value = true;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/logbueno.jpg',
                  height: 60,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: habitacion.length,
                    padding: const EdgeInsets.only(bottom: 35),
                    itemBuilder: (context, index){
                      final habitacionItem = habitacion[index];
                      return CieloHabitacionItem(habitacionItem: habitacionItem,
                      onTap: (){
                        _onHabitacionPressed(habitacionItem, context);
                      }
                      );
                      },
                    ),
                )
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: notifierBottomBarVisible,
            child: Container(
                  color: Colors.white.withOpacity(0.7),
                  child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Icon(Icons.home),
                          ),
                        Expanded(
                          child: Icon(Icons.search),
                          ),
                        Expanded(
                          child: Icon(Icons.favorite),
                          )
                      ]
                    )
                  ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight,
                height: kToolbarHeight,
                child: child,
              );
            }
          )
        ]));
  }
}

class CieloHabitacionItem extends StatelessWidget {

  final CieloHabitacion habitacionItem;
  final VoidCallback onTap;

  const CieloHabitacionItem({
    Key key, 
    this.habitacionItem,
    this.onTap,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 180.0;
    return InkWell(
        onTap: onTap,
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(habitacionItem.color),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                height: itemHeight * 0.4,
                child: Image.asset(
                  habitacionItem.images.first,
                  fit: BoxFit.contain,
                  ),
                ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      habitacionItem.tipoHabitacion,
                      style: TextStyle(
                        color: Colors.grey
                        )
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$${habitacionItem.precio.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.green),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\Capacidad: ${habitacionItem.capacidad.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.black),
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}