import 'package:countapp_provider/state/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState provider = Provider.of<AppState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Count App"),
          backgroundColor: Color(0xff03dac6),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 30,
              bottom: 20,
              child: FloatingActionButton(
                heroTag: 'minus',
                backgroundColor: Color(0xff03dac6),
                onPressed: () {
                  provider.decrement();
                },
                child: const Icon(
                  Icons.remove,
                  size: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              child: FloatingActionButton(
                heroTag: 'add',
                backgroundColor: Color(0xff03dac6),
                onPressed: () {
                  provider.increment();
                },
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Value : ",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),),
                    Text(" ${provider.count}",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900),)
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
