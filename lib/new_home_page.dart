import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queues_project/screens/deterministic_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:queues_project/screens/stochastic_screen.dart';
class NewHomePage extends StatefulWidget {
  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {

  Text arrivalPattern,servicePattern;
  bool isButtonDisabled = true;
  bool isBottomSheetVisible=false;
  bool isTextPreFinal = true;

  String arrivalText= " Arrival Pattern ";
  String serviceText= " Service Pattern ";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 50,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu,color: Colors.pink,),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text('Queues\' Project',style: TextStyle(fontSize: 22,color: Colors.black87,letterSpacing: 2,fontFamily: 'Blackjack',),),
      ),

      drawer: Container(
        margin: EdgeInsets.only(bottom: 40.0,top: 40.0),
        child: Drawer(

          child: ListView(
            children: [

              DrawerHeader(child: Center(
                child: Column(
                  children: [
                    Container(width: 100,height: 100, child: CircleAvatar(backgroundImage: AssetImage('assets/queue.jpg'),)),
                    SizedBox(height: 10.0,),
                    Text('Queues\' Project ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ],
                ),
              )
          ),
              SizedBox(height: 30.0,),
              Center(child: Text('Select a Queues\' type:',style: TextStyle(color: Colors.pink,fontSize: 18.0,fontWeight: FontWeight.w400),)),
              SizedBox(height: 60.0,),

              ListTile(
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text('1.Deterministic Queue',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
              onTap: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DeterministicScreen()));


              },),

              SizedBox(height: 20.0,),

              ListTile(
                title: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text('2.Stochastic Queue',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
                onTap: () {

                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => StochasticScreen()));

                },),

            ],
          ),

        ),
      ),


      body:

      ListView(

          children: [

            SizedBox(height: 200.0,),

            Text('Pls Enter The Queues\' Pattern below',textAlign: TextAlign.center,style: TextStyle(color: Colors.black87,fontSize: 20.0),),
            SizedBox(height: 10.0,),

            Builder(
              builder: (context) =>
              Container(
                margin: EdgeInsets.symmetric(horizontal: 45.0),
                child: FlatButton(color: Colors.pink[200], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0)
                    ,onPressed: () {

                  Scaffold.of(context).openDrawer();

                    }, child: Text('Or Choose a type from here',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),)),
              ),
            ),

            SizedBox(height: 20.0,),
            Container(

              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 70.0),
              height: 100.0,
              width: MediaQuery.of(context).size.width/2,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Flexible(child: GestureDetector(
                      onTap: pickArrivalOptions,
                      child: Text(arrivalText,textAlign: TextAlign.center,style: TextStyle(color: isTextPreFinal ? Colors.grey : Colors.black),))),
                  Text('/',style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.bold),),
                  Flexible(child: GestureDetector(
                  onTap: pickArrivalOptions
                  ,child: Text(serviceText,textAlign: TextAlign.center,style: TextStyle(color: isTextPreFinal ? Colors.grey : Colors.black)))),

 
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 80.0),
              height: 50,
              child:
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    ),
                onPressed: isButtonDisabled ? () {

                  Fluttertoast.showToast(msg: 'pls fill all the fields above first',toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM,textColor: Colors.red);

                } : handleSubmit,
                color: Colors.white,
                textColor: isButtonDisabled ? Colors.grey : Colors.black,
                child: Text("Submit",
                    style: TextStyle(fontSize: 18)),
              ),
            ),

          ],




      ),

      // Text('Deterministic (D)',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize: 20),) ),


      bottomSheet: Visibility(
        visible: isBottomSheetVisible,
        child: Container(
          height: 100,
          child: BottomSheet(onClosing: (){}, builder: (BuildContext context){

            return Container(

              child: ListView(
                children: [

                  Text('Choose a type ',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 20),),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            arrivalText = 'D';
                            serviceText = 'D';
                            isBottomSheetVisible=false;
                            isButtonDisabled=false;
                            isTextPreFinal=false;
                            setState(() {

                            });
                          },
                          child: Text('Deterministic (D)',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize: 20),)),
                      GestureDetector(
                          onTap: (){
                            arrivalText = 'M';
                            serviceText = 'M';
                            isBottomSheetVisible=false;
                            isButtonDisabled=false;
                            isTextPreFinal=false;
                            setState(() {

                            });
                          },
                          child: Text('Markovian (M)',textAlign: TextAlign.center,style: TextStyle(color: Colors.pink,fontSize: 20),)),
                    ],
                  ),
                ),



                ],
              ),

            );

          }),
        ),
      ),


    );
  }

  void pickArrivalOptions(){

    isBottomSheetVisible = true;
    setState(() {

    });

  }

  void handleSubmit() {

    if (arrivalText=='D' || serviceText=='D'){

      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {

        return DeterministicScreen();

      }));

    }else {

      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {

        return StochasticScreen();

      }));

    }


  }

}
