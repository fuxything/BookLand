import 'package:flutter/material.dart';
import 'package:bookland/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'BookLand',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatelessWidget(),


    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomAppBar(
        child : Container(
            height : 100.0,

            child : Row(
                children : <Widget>[
                  Text("Rock Bottom -> "),
                  Text("The Rock ->"),
                  Icon(Icons.home),
                  IconButton(
                      icon : Icon(Icons.add_box),
                      onPressed :() {
                        print("Icon Vutton BottomAppBar Pressed !!");
                      }
                  ),
                ]
            )
        ),
        color : Colors.orangeAccent,
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// This Widget is the main application widget.

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
var items = List<String>();



void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                  },
                  //controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('book'), //https://blog.usejournal.com/flutter-search-in-listview-1ffa40956685
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  ));
}


/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {

  MyStatelessWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title:  const Text('BookLand', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        actions: <Widget>[
          Container(
              child :IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,

                ),
                onPressed: () {
                  Navigator.push(
                    context, new MaterialPageRoute(builder: (context) => new Login()),
                  );
                  // TODO Login page will be here
                },
              )
              /***child : FlatButton(

                  //child: new Text('OK', style: new TextStyle(color: Colors.white)),
                  child: new Image.asset('assets/person.jpg'),
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {},
                  color: Colors.blue,
                  )*/,width: 30.0, height: 30.0),
          //Text('PROFILE', style: new TextStyle(color: Colors.white)),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search Page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: Center(
        child : Column(
            mainAxisAlignment: MainAxisAlignment.start ,
            children: <Widget>[
              /***
               *
                  - assets/last_r.jpg
                  - assets/look_l.png
                  - assets/best_seller.jpg
                  - assets/toplist.png
                  - assets/campaign.png

               */

              Container(

                child : new FlatButton(
                  //child: new Text('OK', style: new TextStyle(color: Colors.white)),
                  child: new Image.asset('assets/toplist.png'),
                  padding: EdgeInsets.all(1.0),
                  onPressed: () {},
                  color: Colors.black,

                )
                ,width: 400.0, height: 100.0,),
              Text(" "),
              Container(
                child : new FlatButton(
                  //child: new Text('OK', style: new TextStyle(color: Colors.white)),
                  child: new Image.asset('assets/campaign.png'),
                  onPressed: () {},
                  color: Colors.pink,

                )
                ,width: 400.0, height: 100.0,),
              Text(" "),
              Container(
                child : new FlatButton(
                  //child: new Text('OK', style: new TextStyle(color: Colors.white)),
                  child: new Image.asset('assets/last_r.jpg'),
                  onPressed: () {},
                  color: Colors.orange,

                )
                ,width: 400.0, height: 100.0,)
              ,
              Text(" "),
              Container(
                child : new FlatButton(
                  //child: new Text('OK', style: new TextStyle(color: Colors.white)),
                  child: new Image.asset('assets/look_l.png'),
                  onPressed: () {},
                  color: Colors.lightBlueAccent,

                )
                ,width: 400.0, height: 100.0,),

              Container(
                child : new FlatButton(
                  //child: new Text('OK', style: new TextStyle(color: Colors.white)),
                  child: new Image.asset('assets/best_seller.png'),
                  onPressed: () {},
                  color: Colors.red,

                )
                ,width: 400.0, height: 100.0,)]),


      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            new UserAccountsDrawerHeader(accountName: new  Text('Nurbüke TEKER'),
              accountEmail: new Text('nurbuke.teker7@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.black,
                child: new Text("NT"),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bookland__pp.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new ListTile(
              title: new Text("Account"),
              trailing: new Icon(Icons.account_circle),
              onTap: (){

              },
            ),
//Section Line
            new Divider(),
            new ListTile(
              title: new Text("Orders"),
              trailing: new Icon(Icons.add_shopping_cart),
              onTap: (){
              },
            ),
//Section Line
            new Divider(),

            new ListTile(
              title: new Text("Library"),
              trailing: new Icon(Icons.library_books),
              onTap: (){
              },
            ),

            new Divider(),
            new ListTile(
              title: new Text("Campaigns"),
              trailing: new Icon(Icons.notifications_active),
              onTap: (){
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Manuels"),
              trailing: new Icon(Icons.help),
              onTap: (){
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Exit"),
              trailing: new Icon(Icons.exit_to_app),
              onTap: (){
              },
            ),
            new Divider(),

          ],
        ),),
      bottomNavigationBar: BottomAppBar(
        child : Container(
            height : 50.0,

            child : Row(
                children : <Widget>[
                  Text("           "),
                  IconButton(
                      icon :  Icon(Icons.home),

                      onPressed :() {
                        print("Icon home Pressed !!");
                      }
                  ),
                  Text("           "),
                  IconButton(
                      icon : Icon(Icons.category),

                      onPressed :() {
                        print("Icon category Pressed !!");
                      }
                  ),
                  Text("           "),
                  IconButton(
                      icon : Icon(Icons.explore),

                      onPressed :() {
                        print("Icon explore Pressed !!");
                      }
                  ),
                  Text("           "),
                  IconButton(
                      icon : Icon(Icons.shopping_basket),

                      onPressed :() {
                        print("Icon shopping_basket Pressed !!");
                      }
                  ),
                ]

            )

        ),
        color : Colors.blue,
      ),
    );
  }

}
