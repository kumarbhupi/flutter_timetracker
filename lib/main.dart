import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/main_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}




//Clases para saber que tipo de accion se esta haciendo
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

//Clase que se encarga de llevar el recuento del contador, es decir la logica.
class CounterBloc {
  CounterBloc(this._counter);

  int _counter;
  final _streamController = StreamController<int>();

  //El "sink" osea por donde le entran los eventos que tiene que atender
  StreamSink<int> get counterSink => _streamController.sink;

  //El que da la respuesta de las cosas atendidas, osea la salida
  Stream<int> get counterStream => _streamController.stream;

  final _eventController = StreamController<CounterEvent>();

  StreamSink<CounterEvent> get counterEvent => _eventController.sink;

  void incrementCounter() {
    counterSink.add(++_counter);
  }

  //En caso de tener mas de un evento que atender podemos utilizar la siguiente
  //para atender una u otra.
  void incrementCounterAdvanced(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    }
    if (event is DecrementEvent) {
      _counter--;
    }
    counterSink.add(_counter);
  }

  void dispose() {
    _streamController.close();
    _eventController.close();
  }
}

class HomePage extends StatelessWidget {
  HomePage(this.title);

  final String title;
  final bloc = CounterBloc(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActivityDialogView(),
            IntervalCardView(),
            Text(
              'You have pushed the button this many times:',
            ),
            PlayerButtonView(type: ButtonType.pausedTask),
            //TaskProjectCardView(),
            StreamBuilder<int>(
              initialData: 0, //Si no quieres que salga el null en la etiqueta.
              stream: bloc.counterStream,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            //Same shit
            //onPressed: () => bloc.incrementCounterAdvanced(IncrementEvent()),
            onPressed: bloc.incrementCounter,
            //Con el simple, ademas no usamos el => porque si te fijas no se le pasa nada por los parametros.
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => bloc.incrementCounterAdvanced(DecrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove, size: 25),
          )
        ],
      ),
    );
  }
}

class IntervalCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(183, 253, 204, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Interval X",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Start'), Text('End'), Text('Duration')],
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('2020-10-4 09:47:03'),
              Text('2020-10-4 12:53:03'),
              Text('03:06:00')
            ],
          )
        ],
      ),
    );
  }
}

class ActivityDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Create'),
            content:SingleChildScrollView(
              child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name: ",
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Insert Name Here',
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tags: ",
                  ),
                ),

                Row(
                  children: [
                    Flexible(child: TextField(

                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Insert Tags Here',
                      ),
                    ),),
                    IconButton(
                        icon: Icon(Icons.add_circle_outline), onPressed: null)
                  ],
                ),
                Row(
                  children: [

                  ],
                )
              ],
          ),),
            actions: <Widget>[
              TextButton(
                child: Text('Create'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return FloatingActionButton(
      onPressed: _showMyDialog,
      child: Text('Dialog'),
    );
  }
}

enum ButtonType { project, pausedTask, playingTask }

class PlayerButtonView extends StatelessWidget {
  final ButtonType type;

  PlayerButtonView({@required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.project:
        {
          return RaisedButton(
            onPressed: () {},
            textColor: Colors.black,
            padding: const EdgeInsets.all(42.00),
            child: Text('View'),
          );
        }
        break;
      case ButtonType.pausedTask:
        {
          return RaisedButton(
            onPressed: () {},
            textColor: Colors.black,
            padding: const EdgeInsets.all(29.00),
            child: Icon(Icons.play_arrow, size: 46),
          );
        }
        break;
      case ButtonType.playingTask:
        {
          return RaisedButton(
            onPressed: () {},
            textColor: Colors.black,
            padding: const EdgeInsets.all(29.00),
            child: Icon(Icons.pause, size: 46),
          );
        }
        break;
      default:
        {
          return null;
        }
        break;
    }
  }
}
