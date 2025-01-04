import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const ExamPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class ExamPage extends StatelessWidget {
  const ExamPage({super.key});
  static const List<String> colors_name = [
    'Runaway',
    'Revenge',
    'tv off',
    'Fall',
    'Not like us',
    'a lot',
  ];
  static const List<Color> colors = [
    Colors.amber,
    Colors.red,
    Colors.green,
    Colors.cyan,
    Colors.purple,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // ************ Appbar : Inanna Jabbour *************
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: const Icon(Icons.music_note,color: Colors.greenAccent,size: 40,),
        title: Title(color: Colors.black, child: const Text("Music App")),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search),tooltip: "Search for song",
          ),
        ],
      ),
      // *********** floating action button : Karam Donia ************
      floatingActionButton: FloatingActionButton.extended(tooltip:"add a song to your favorites",
        onPressed: (){
        var snackBar = const SnackBar(content: Text("This song has been added to favorite",
          style: TextStyle(color: Colors.black,backgroundColor: Colors.greenAccent),),
          duration: Duration(seconds: 1),
          showCloseIcon: true,
          closeIconColor: Colors.red,
          backgroundColor: Colors.teal,
        );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
        label: Text("add to favorite"),
        icon: const Icon(Icons.favorite),backgroundColor: Colors.greenAccent,
      ),
      // *********** body : Nagham Ajeeb *****************
      body: ListView.builder(
            itemCount: colors.length,
            itemBuilder: (context,index) => Container(
              child: FloatingActionButton(onPressed: (){}, child: Text(colors_name[index],),
                backgroundColor: colors[index],tooltip: "this is ${colors_name[index]}",),
            )
        ),
      // **************** bottom navigation bar : Hadi Kanjo *****************
      bottomNavigationBar:
          Container(
            width: 1080,height: 80,color: Colors.teal,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Container(width: 60,height: 80,child: Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.settings) ),
                  Text("settings",style: TextStyle(fontSize: 11),)
                ],
              ),
              ),Container(width: 60,height: 80,child: Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow) ),
                  Text("play",style: TextStyle(fontSize: 11),)
                ],
              ),
              ),Container(width: 60,height: 80,child: Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite) ),
                  Text("favorites",style: TextStyle(fontSize: 11),)
                ],
              ),
              ),
              ],
            ) ,
          )

    );
  }
}

