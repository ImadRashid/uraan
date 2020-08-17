import 'package:flutter/material.dart';


class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,

        child: Scaffold(
          appBar: AppBar(
            title: const Text('Member\'s Panel'),
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: choices.map((Choice choice) {

                return Tab(
                  text: choice.title,


                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
      body: TabBarView(
        children: choices.map((Choice choice) {
          return Padding(

            padding: const EdgeInsets.all(16.0),
            child: ChoiceCard(choice: choice),
          );
        }).toList(),

      ),





      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
        DrawerHeader(
        child: Container(

          child: ListView(
            children: <Widget>[
          Text(
          'Side menu',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),

        ListTile(
          leading: Icon(Icons.perm_identity,size:100.0),


        ),


          ],
        ),

        ),

        decoration: BoxDecoration(
            color: Colors.green,

            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/cover.jpg'),



            ),



        ),


      ),
      ListTile(
        leading: Icon(Icons.home,color: Colors.green,),
        title: Text('Home'),
        onTap: () => {},
      ),
      ListTile(
          leading: Icon(Icons.verified_user,color: Colors.green,),
          title: Text('Profile'),
          onTap: () => {Navigator.of(context).pop()},
    ),
    ListTile(
    leading: Icon(Icons.settings,color: Colors.green,),
    title: Text('Settings'),
    onTap: () => {Navigator.of(context).pop()},
    ),
    ListTile(
    leading: Icon(Icons.border_color,color: Colors.green,),
    title: Text('Feedback'),
    onTap: () => {Navigator.of(context).pop()},
    ),
    ListTile(
    leading: Icon(Icons.exit_to_app,color: Colors.green,),
    title: Text('Logout'),
    onTap: () => {Navigator.of(context).pop()},
    ),
    ],
    ),
    ),

    ),
    ),
    );
  }
}




class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'Notification', icon: Icons.notification_important),

];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline;
    return Card(
      color: Colors.white,


    );
  }
}