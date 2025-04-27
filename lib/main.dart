import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // 📦 App Launch হবে, MyApp() থেকে শুরু
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ui example',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter UI Example'),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'WELCOME',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            //description part
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'This is a description about the item. Here you can describe the content of the image and provide more details.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            // horizontal Listview Section 
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 150, // ↕️ ListView এর Height 150px
                child: ListView.builder(
                  itemCount: 15, // 📋 মোট ৫টি আইটেম
                  scrollDirection: Axis.horizontal, // ↔️ সোজা পাশে স্ক্রল হবে
                  itemBuilder: (ctx, index) => Card( // 🗂️ Card আকারে আইটেম দেখাবে
                    margin: EdgeInsets.all(8), // 📦 প্রত্যেক Card এর চারদিকে ৮px গ্যাপ
                    child: Container(
                      width: 120, // ↔️ প্রত্যেকটি আইটেমের প্রস্থ ১২০px
                      child: Center(child: Text('Item ${index + 1}')), // 🖋️ Center এ Text
                    ),
                  ),
                ),
              ),

            ),

            //gridview title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Gridview Section',
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              ),
            ),

            //gridview section
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              crossAxisSpacing:10,
              mainAxisSpacing: 10,
              ),
              itemCount: 19,
              itemBuilder: (ctx, index) => Card(
                elevation: 5,
                child:Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Image.network(
                         'https://picsum.photos/200?random=$index',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: (){
                          },
                        child: Text('View'),
                      ),
                    )
                  ],
                )
              )
            ),

          ],
        ),
      ),
    );
  }
}
