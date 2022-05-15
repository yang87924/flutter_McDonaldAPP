import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList=[
    'assets/images/meal1.jpg',
    'assets/images/meal2.jpg',
    'assets/images/meal3.jpg',
    'assets/images/meal4.jpg',
  ];
  int tabidx=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('m',
            style:TextStyle(fontSize: 40,color:Colors.amber,fontFamily: 'MClawsui')
        ),
        actions: [
          IconButton(iconSize:30,color:Colors.black45,onPressed: (){},
              icon: Icon(Icons.add_alert_outlined),splashColor: Colors.transparent,highlightColor: Colors.transparent,)
        ],
      ),
        body:SingleChildScrollView(
          child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              //Text('STUST, 日安',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
              Container(
                  height:150,
                  child: Center(child:CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                    ),
                    items: imgList
                        .map((item) => Container(
                      child: Center(
                          child:
                          Image.asset(item, fit: BoxFit.cover,)),
                    ))
                        .toList(),
                  ))),
              SizedBox(height:20),
              Center(
                child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                    child:Row(
                  children:[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:Column(
                      children:[
                        Icon(Icons.monetization_on,color:Colors.red,size:20),
                        Text("儲值金"),
                        Text("0",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ]
                    )),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:Column(
                        children:[
                          Icon(Icons.monetization_on,color:Colors.red,size:20),
                          Text("點數"),
                          Text("180",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                        ]
                    )),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:Column(
                        children:[
                          Icon(Icons.monetization_on,color:Colors.red,size:20),
                          Text("積分"),
                          Text("4749",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                        ]
                    )),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:Column(
                        children:[
                          Icon(Icons.monetization_on,color:Colors.red,size:20),
                          Text("商品卷"),
                          Text("0",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                        ]
                    )),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:Column(
                        children:[
                          Icon(Icons.monetization_on,color:Colors.red,size:20),
                          Text("優惠卷"),
                          Text("1",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                        ]
                    )),

                  ]
                ))
              ),
              SizedBox(height:20),
              Container(
                width:double.infinity,
                height:100,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image:AssetImage("assets/images/back1.png"),
                    fit:BoxFit.cover
                  ),
                ),
                child:Row(
                  children:[
                    Image.asset("assets/images/pic2.png"),
                    Text("天天來簽到\n開禮物領積分"),
                    Expanded(child:
                    Align(alignment:Alignment.centerRight, child:SizedBox(width:100,child:TextButton(
                          onPressed: (){},
                          child:Text("立即參加"),
                          style:ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          )
                        )))),
                    SizedBox(width:20)

                  ]
                )
              )
            ]
          )
          )
        ),
       bottomNavigationBar: BottomNavigationBar(
         type:BottomNavigationBarType.fixed,
         onTap: (int newidx){
           setState(() {
             tabidx=newidx;
           });
         },
         currentIndex: tabidx,
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:"首頁"),
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:"首頁"),
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: Colors.transparent,),label:"首頁"),
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:"首頁"),
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:"首頁"),
         ],
       ),
       floatingActionButton: FloatingActionButton(
         child:Icon(Icons.monetization_on,color:Colors.red,size:40),
         onPressed: (){},
         backgroundColor: Colors.transparent,
         elevation: 0,
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
