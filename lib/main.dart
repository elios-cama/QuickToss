import 'package:QuickToss/provider.dart';
import 'package:QuickToss/results.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (context) => Result(),
          child: MaterialApp(
          theme: ThemeData(
      cursorColor: Colors.white,
          ),
          home: Home(),
        ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/fond.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black, width: 2),
                color: Colors.transparent),
            child: Container(
              height: 70,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white, width: 4),
                color: Color(0xFFFF4747),
              ),
              child: FlatButton(
                color: Colors.transparent,
                child: Text(
                  "Let's toss",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                ),
                onPressed: () async {
                  List<String> persons = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SOF(),
                    ),
                  );
                  if (persons != null) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultScreen(persons: [],)),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  var nameTECs = <TextEditingController>[];

  var cards = <Container>[];

  Container createCard() {
    var nameController = TextEditingController();

    nameTECs.add(nameController);

    return Container(
      
      margin : EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF0077C2), width: 4),
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.black
      ),
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Person ${cards.length + 1}',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: TextStyle(color:Color(0xFFFF4747), fontWeight: FontWeight.bold),
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black)),
                    // border: OutlineInputBorder(
                    //   borderRadius:  BorderRadius.all(
                    //     Radius.circular(15.0),
                    //   ),
                    )),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<String> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = nameTECs[i].text;
      print(name);
     
      entries.add(name); print(entries);
    }
    Navigator.pop(context, entries);
    
  }
  // decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(330),
  //                           gradient: LinearGradient(
  //                               begin: Alignment.bottomLeft,
  //                               colors: [
  //                             Colors.purple.shade300,
  //                             Colors.purple.shade900
  //                           ])),

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                colors: [
                              Color(0xFFFF4747),
                              Color(0xFFf8a902)
                            ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF4747),
          elevation : 0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return cards[index];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                onPressed: () => setState(() => cards.add(createCard())),
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Icon(Icons.add, size: 30, color: Colors.black,),
                ),
              ),
            )
          ],
        ),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.done), 
            onPressed: (){
                _onDone();
                
            } ,
            backgroundColor: Colors.green,),
      ),
    );
  }
}

// class PersonEntry {
//   final String name;

//   PersonEntry(
//     this.name,
//   );
//   @override
//   String toString() {
//     return 'Person: name= $name';
//   }
// }
