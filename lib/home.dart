import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://i.pinimg.com/originals/e5/fe/61/e5fe61379e15532d96231f1b5a0d1e37.jpg'),
        fit: BoxFit.cover
        )

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Home'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
             


              Center(
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white

                    ),
                    onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>screen()));

                    }, icon: Icon(Icons.play_arrow),label: Text('Play'),),
              )
            ],
          ),
        ),
        
      );

  }
}














class screen extends StatefulWidget {
   const screen({super.key});

   @override
   State<screen> createState() => _homeState();
 }
 
 class _homeState extends State<screen> {


  final TextEditingController glasscountEcontroll= TextEditingController(text: '1');

  List<Waterconsume> waterconsumelist=[];

   @override
   Widget build(BuildContext context) {
     return Container(
       
       decoration: BoxDecoration(
         image: DecorationImage(image: NetworkImage('https://plexcollectionposters.com/images/2021/05/16/background-images-for-login-page3bc68c53b0db224b.jpg'),
         fit: BoxFit.cover
         )
       ),
       child: Scaffold(
         backgroundColor: Colors.transparent,
       
         appBar: AppBar(
       
           backgroundColor: Colors.red,
           title: Text('Play'),
         ),
         
         
         body: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
       
       
       
             children: [
       
               Center(
                 child: Column(
                   children: [
       
       
       
       
                     GestureDetector(
                       onTap: (){addwaterconsume();},
                       child: Container(
       
                         decoration: BoxDecoration(
       
                           border: Border.all(width: 10,color: Colors.red),
       
                           borderRadius: BorderRadius.circular(200)
       
                         ),
       
       
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Column(
                             children: [
                               Icon(Icons.water_drop_outlined,size: 28,color: Colors.blue,),
                               Text('Tap here  ',style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold
                               ),),
       
                             ],
                           ),
                         ),
       
       
                       ),
                     ),
       
                     const SizedBox(
                       height: 20,
       
                     ),
                     SizedBox(
                       width: 90,
                       child: TextFormField(

                         style: TextStyle(
                           color: Colors.white
                         ),

                         decoration: InputDecoration(

       
                           labelText: 'No of glass',

                           labelStyle: TextStyle(
                             color: Colors.white
                           ),
                           enabledBorder: OutlineInputBorder(
       
                             borderRadius: BorderRadius.circular(8),
                             borderSide: BorderSide(width: 2,color: Colors.black)
                           ),
                             focusedBorder: OutlineInputBorder(
       
                                 borderRadius: BorderRadius.circular(6),
                                 borderSide: BorderSide(width: 4,color: Colors.blue)
                             )
       
                         ),
                         controller: glasscountEcontroll,
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
       
       
                       ),
                     ),
                   ],
                 ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('History',style: TextStyle(
                     fontSize: 24,
                     color: Colors.yellow
                   ),),
                   Text('Total :${totalglascount()} ',style: TextStyle(
                       fontSize: 26,
                       fontWeight: FontWeight.bold,
                     color: Colors.yellow
                   ),),
                 ],
               ),
               Divider(
                 color: Colors.brown,
               ),
       
       
       
               Expanded(
                 child: ListView.builder(
       
                     itemCount: waterconsumelist.length,
                     itemBuilder: (context,index){
       
                       return ListTile(
       
                         title: Text(DateFormat.yMEd ().add_jms().format(waterconsumelist[index].time,),style: TextStyle(
                           color: Colors.amber
                         ),),
       
                         leading: CircleAvatar(
       
                           child: Text('${index+1}'),
       
       
                         ),
                         trailing: Text(waterconsumelist[index].glascount.toString(),style: TextStyle(
                           fontSize: 18,
                           color: Colors.black

                         ),),
                       );
       
       
       
                     }),
               ),
       
       
             ],
           ),
         ),
       ),
     );
   }

   void addwaterconsume(){

     int glasscount = int.tryParse(glasscountEcontroll.text)??1;

     Waterconsume waterconsume= Waterconsume(time: DateTime.now(), glascount: glasscount);

     waterconsumelist.add(waterconsume);
     setState(() {

     });




   }

   int totalglascount (){


     int totalcount=0;
      for(Waterconsume waterconsume in waterconsumelist ){

        totalcount += waterconsume.glascount;
      }
      return totalcount;





   }
   @override
  void dispose() {
glasscountEcontroll.dispose();
    super.dispose();
  }
 }

 class Waterconsume {


  final DateTime time;

  final int glascount ;

  Waterconsume({required this.time, required this.glascount});



 }
