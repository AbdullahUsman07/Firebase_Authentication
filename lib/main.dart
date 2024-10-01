
import 'package:flutter/material.dart';


void main()=>runApp(
  MaterialApp(  
    debugShowCheckedModeBanner: false,
    home: HomePage()
  )
);

class HomePage extends StatefulWidget{
  @override
  _homePageState createState()=> _homePageState();
}

class _homePageState extends State<HomePage>{
  PageController? _pageController;

  void onScroll(){

  }

  @override
  void initState(){
    _pageController=PageController(
      initialPage: 0,
    )..addListener(onScroll);

    super.initState();
  }


  @override  
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage("assets/images/badshahi.jpg","Lahore",1,875643),
          makePage("assets/images/faisal-mosque.jpg","Islamabad",2,50000),
          makePage("assets/images/Karachi.jpg", "Karachi", 3,600000),
        ],
      ),
    );
  }
}

Widget makePage(String imgPath,String city_name,double page_no,int voters){
  return Container(  
    decoration: BoxDecoration(  
      image: DecorationImage( 
        image: AssetImage(imgPath),
        fit: BoxFit.fitHeight,
      ),
    ),
    child:Container(  
      decoration: BoxDecoration(  
        gradient: LinearGradient( 
          begin: Alignment.bottomRight,
          stops: [0.3,0.9],
          colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ]
        ),
      ),
      child: Padding(padding: EdgeInsets.all(20),
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(  
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              const SizedBox(height:70,),
              Text(page_no.toString(),style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
              const Text('/4',style:TextStyle(color:Colors.white,fontSize: 15)),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(city_name,style:const TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                
                Row( 
                  children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(3.0),  
                    child:const Icon(Icons.star,color:Colors.yellow),
                  ),
                  Container(
                    margin: const EdgeInsets.all(3.0),  
                    child:const Icon(Icons.star,color:Colors.yellow),
                  ),
                  Container(
                    margin: const EdgeInsets.all(3.0),  
                    child:const Icon(Icons.star,color:Colors.yellow),
                  ),
                  Container(
                    margin: const EdgeInsets.all(3.0),  
                    child:const Icon(Icons.star,color:Colors.yellow),
                  ),
                  Container(
                    margin:const EdgeInsets.all(3.0),  
                    child:const Icon(Icons.star,color:Colors.grey),
                  ),
                  const Text('4.0',style: TextStyle(color: Colors.white,fontSize: 18),),
                  Text('(${voters.toString()})',style: TextStyle(color:Colors.white70,fontSize: 13),)
                ],)
              
              ],
              
            )
            ),
        ],
        )
      ),
    )
  );
}