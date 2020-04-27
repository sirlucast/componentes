import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar pages'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              child: Text('LT'),
              backgroundColor: Colors.greenAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/3a/86/a5/3a86a5d7a7472d99365b4ffa01bd21bd.jpg'),
              radius: 20,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/original.gif',
          image:
              'https://eloutput.com/app/uploads-eloutput.com/2020/04/Batman.jpg',
          fadeInDuration: Duration(milliseconds: 250),
        ),
      ),
    );
  }
}
