import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../line_chart.dart';
class DeterministicScreen extends StatefulWidget {
  @override
  _DeterministicScreenState createState() => _DeterministicScreenState();
}

class _DeterministicScreenState extends State<DeterministicScreen> {

  final lambdaController = TextEditingController();
  final meoController = TextEditingController();
  final nServersController = TextEditingController();
  final capacityController = TextEditingController();
  final timeController = TextEditingController();
  final alreadyPresentPeopleController = TextEditingController();


  bool isTextFieldEnabled=true;
  bool isTextVisible=false;
  bool isDrawVisible= false;

  Color lambda_borderColor = Color(0xff0b86e5);
  Color meo_borderColor = Color(0xff0b86e5);
  Color nServers_borderColor = Color(0xff0b86e5);
  Color capacity_borderColor = Color(0xff0b86e5);

  String outText='';


  double lambda,flambda,meo,fmeo;
  int nServers,kCapacity,fnServers,fKCapacity,MpresentPeople,fMpresentPeople;

  double waitingTime;
  double balkTime;
  String waitingText;
  int numberOfCustomers;

  List<String> xAxisArrivalsList= [];

  List<int> botContainerNOFDataList =[];
  List<int> botContainerArrivalsDataList =[];
  List<String> xAxisDeparturesList=[];

  String labelText='Continue...';




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    lambdaController.dispose();
    meoController.dispose();
    nServersController.dispose();
    capacityController.dispose();
    timeController.dispose();
    alreadyPresentPeopleController.dispose();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    meoController.addListener(() {

      print('meo Now: ${meoController.text}');

      setState(() {

      });

    });

    alreadyPresentPeopleController.addListener(() {

      print('present people Now: ${alreadyPresentPeopleController.text}');

      setState(() {

      });

    });

    timeController.addListener(() {

      print('time Now: ${timeController.text}');

      setState(() {

      });

    });


    capacityController.addListener(() {

      print('capacity(k-1) Now: ${capacityController.text}');

      setState(() {

      });

    });

    nServersController.addListener(() {

      print('nServers Now: ${nServersController.text}');

      setState(() {

      });

    });

    lambdaController.addListener(() {

      print('lambda Now: ${lambdaController.text}');

      setState(() {

      });

    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Queues\' Project',style: TextStyle(color: Colors.black,letterSpacing: 2,fontWeight: FontWeight.bold,fontFamily: 'Blackjack',fontSize: 30),),
      ),




      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: FloatingActionButton.extended(
          onPressed: () {

            alreadyPresentPeopleController.clear();
            timeController.clear();
            capacityController.clear();
            nServersController.clear();
            meoController.clear();
            lambdaController.clear();
            isTextVisible =  false;
            isDrawVisible=false;
            setState(() {

            });

          },
          icon: Icon(Icons.delete),
          label: Text("Reset"),
          splashColor: Colors.red,
        ),
      ),



      body:  Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: ListView(
            children: [

              SizedBox(height: 10.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Deterministic',style: TextStyle(color: Colors.purple,fontSize: 22.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                  Text(' Queue... ',style: TextStyle(color: Colors.redAccent.withOpacity(0.6),fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),

                ],
              ),

              SizedBox(height: 40.0,),

              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: lambdaController,
                        onSubmitted: (_){
                        print('final lambda is: ${lambdaController.text}');
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                        ),
                          focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                            ,borderSide: BorderSide(width: 2,color: lambda_borderColor),
                          ),
                          labelText: ' λ ',
                          labelStyle: TextStyle(fontSize: 30.0),
                          alignLabelWithHint: true,

                        ),
                        cursorRadius: Radius.circular(10.0),
                        cursorColor: Colors.green,
                        enabled: isTextFieldEnabled

                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Flexible(
                    child: TextField(
                        controller: meoController,
                        onSubmitted: (_){
                          print('final meo is: ${meoController.text}');
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                          focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                            ,borderSide: BorderSide(width: 2,color: meo_borderColor),
                          ),
                          labelText: ' μ ',
                          labelStyle: TextStyle(fontSize: 30.0),
                          alignLabelWithHint: true,

                        ),
                        cursorRadius: Radius.circular(10.0),
                        enabled: isTextFieldEnabled,
                      cursorColor: Colors.green,

                    ),
                  ),

                  SizedBox(width: 10.0,),
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: nServersController,
                        onSubmitted: (_){
                          print('final nServers is: ${nServersController.text}');
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                          focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                            ,borderSide: BorderSide(width: 2,color: nServers_borderColor),
                          ),
                          labelText: ' n ',
                          labelStyle: TextStyle(fontSize: 30.0),
                          alignLabelWithHint: true,

                        ),
                        cursorRadius: Radius.circular(10.0),
                        enabled: isTextFieldEnabled,
                      cursorColor: Colors.green,

                    ),
                  ),


                ],
              ),

              SizedBox(height: 15.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Flexible(child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: TextField(
                     keyboardType: TextInputType.numberWithOptions(),
                      controller: capacityController,
                      onSubmitted: (_){
                        print('final capacity is: ${capacityController.text}');
                      },

                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                        focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                          ,borderSide: BorderSide(width: 2,color: capacity_borderColor),
                        ),
                        labelText: ' k-1 ',
                        labelStyle: TextStyle(fontSize: 30.0),
                        alignLabelWithHint: true,

                      ),
                      cursorRadius: Radius.circular(10.0),
                      enabled: isTextFieldEnabled,
                    ),
                  ),
                  ),

                  SizedBox(width: 20.0,),

                  Flexible(
                    child: TextField(
                      controller: alreadyPresentPeopleController,
                      onSubmitted: (_){
                        print('final presentPeople is: ${alreadyPresentPeopleController.text}');
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(

                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                        focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                          ,borderSide: BorderSide(width: 2,color: meo_borderColor),
                        ),
                        labelText: ' M ',
                        labelStyle: TextStyle(fontSize: 30.0),
                        alignLabelWithHint: true,

                      ),
                      cursorRadius: Radius.circular(10.0),
                      enabled: isTextFieldEnabled,
                      cursorColor: Colors.green,

                    ),
                  ),



                ],
              ),

              Visibility(
                visible: isTextVisible,
                child: Flexible(child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  width: MediaQuery.of(context).size.width/3,
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: timeController,
                    onSubmitted: (_){
                      print('final time is: ${timeController.text}');
                    },

                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                      focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                        ,borderSide: BorderSide(width: 2,color: capacity_borderColor),
                      ),
                      labelText: ' t ',
                      labelStyle: TextStyle(fontSize: 30.0),
                      alignLabelWithHint: true,

                    ),
                    cursorRadius: Radius.circular(10.0),
                    enabled: isTextFieldEnabled,
                  ),
                ),

                ),
              ),

              SizedBox(height: 20.0,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                height: 60.0,
                child: RaisedButton(
          textColor: Colors.white,
          padding: EdgeInsets.all(0.0),
          shape: StadiumBorder(),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xff5b86e5),
                    Color(0xff36d1dc),
                  ],
                ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    labelText,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(width: 10.0,),
                  Icon(Icons.reply,color: Colors.white,)
                ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
          ),
          onPressed: handleReplies,
        ),
              ),

              SizedBox(height: 20.0,),



              Visibility(
                  visible: isTextVisible,
                  child: Text(outText,style: TextStyle(fontSize: 18.0,color: Colors.green,fontWeight: FontWeight.w400),textAlign: TextAlign.center,)),

              SizedBox(height: 10,),

              Visibility(
                visible: isDrawVisible,

                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.0),
                    height: 60,
                    child: RaisedButton.icon(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>
                          SimpleLineChart(arrivalList: xAxisArrivalsList,botArrivalTimeDataList: botContainerArrivalsDataList,botNofCDataList: botContainerNOFDataList,departureList: xAxisDeparturesList,)));
                    }, icon: Icon(Icons.skip_next), color: Colors.pink
                        ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0))
                        ,label: Text(' Draw ',style: TextStyle(color: Colors.white,fontSize: 20.0),)),

                ),
              ),

                ]

          ),
      ),


                );
  }

  handleReplies() {



    if(lambdaController.text.isEmpty || meoController.text.isEmpty||nServersController.text.isEmpty ||capacityController.text.isEmpty ){


      Fluttertoast.showToast(timeInSecForIosWeb: 1,
          msg: 'Please fill all fields first...',toastLength: Toast.LENGTH_LONG,
          fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.lightBlue);

    }else {




      if(lambdaController.text.contains('/')){
        int idx;
        double numerator;
        double denomenator;
        idx=lambdaController.text.indexOf('/');
        print('idx is:   $idx');
        numerator = double.parse(lambdaController.text.substring(0,idx));
        print('numerator: $numerator');
        denomenator = double.parse(lambdaController.text.substring(idx+1,lambdaController.text.length));
        print('denomenator: $denomenator');
        lambda = numerator/denomenator;
        if(lambda == null){

          Fluttertoast.showToast(timeInSecForIosWeb: 1,
              msg: 'only division is allowed in the fields\nplease try again...',toastLength: Toast.LENGTH_LONG,
              fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.red);
        }else {
            flambda = lambda;
        }
      }else {
        lambda = double.tryParse(lambdaController.text);
        if(lambda == null){
          Fluttertoast.showToast(timeInSecForIosWeb: 1,
              msg: 'only division is allowed in the fields\nplease try again...',toastLength: Toast.LENGTH_LONG,
              fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.red);
        }else {
          flambda = lambda;
        }
      }

      // meo part

      if(meoController.text.contains('/')){
        int idx;
        double numerator;
        double denomenator;
        idx=meoController.text.indexOf('/');
        numerator = double.parse(meoController.text.substring(0,idx));
        print('numerator: $numerator');
        denomenator = double.parse(meoController.text.substring(idx+1,meoController.text.length));
        print('denomenator: $denomenator');
        meo = numerator/denomenator;
        if(meo == null){
          Fluttertoast.showToast(timeInSecForIosWeb: 1,
              msg: 'only division is allowed in the fields\nplease try again...',toastLength: Toast.LENGTH_LONG,
              fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.red);
        }else {
          fmeo = meo;
        }
      }else {
        meo = double.tryParse(meoController.text);
        if(meo == null){
          Fluttertoast.showToast(timeInSecForIosWeb: 1,
              msg: 'only division is allowed in the fields\nplease try again...',toastLength: Toast.LENGTH_LONG,
              fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.red);
        }else {
          fmeo = meo;
        }
      }

      try{

        nServers = int.parse(nServersController.text);
        fnServers = nServers;
        kCapacity = int.parse(capacityController.text);
        kCapacity = kCapacity +1;
        fKCapacity = kCapacity;
        MpresentPeople = int.parse(alreadyPresentPeopleController.text);
        fMpresentPeople = MpresentPeople;


      }on Exception{

        Fluttertoast.showToast(timeInSecForIosWeb: 1,
            msg: 'Servers and capacity must be integers...',toastLength: Toast.LENGTH_LONG,
            fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.red);

      }

      print('before is: ${lambdaController.text} and lambda is after clicked: $flambda ');
      print('before is: ${meoController.text} and lambda is after clicked: $fmeo ');
      print('before is: ${nServersController.text} and n Servers is after clicked: $nServers');
      print('before is: ${capacityController.text} and capacity is after clicked: $kCapacity ');


      if(flambda != null || fmeo != null || fnServers != null || fKCapacity != null || fMpresentPeople!= null){

        doDeterministic_numberOfCustomers(flambda,fmeo,fnServers,fKCapacity,fMpresentPeople);
        print('entering deterministic');
        isTextVisible = true;
        setState(() {

        });

      }else {

        Fluttertoast.showToast(timeInSecForIosWeb: 1,
            msg: 'Smth went wrong pls try again...',toastLength: Toast.LENGTH_LONG,
            fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.red);

      }

    }
  }

  void doDeterministic_numberOfCustomers(double flambda, double fmeo, int fnServers, int fKCapacity,int fMpresentPeople) {


    if(timeController.text.isEmpty){
      Fluttertoast.showToast(timeInSecForIosWeb: 1,
          msg: 'pls enter the time you want to know the number of people in the system at',toastLength: Toast.LENGTH_LONG,
          fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.blue);
    }else {
      labelText = 'Submit...';
      isDrawVisible=true;
      setState(() {

      });
      double time, ftime;
      try {
        time = double.parse(timeController.text);
      } on Exception {
        Fluttertoast.showToast(timeInSecForIosWeb: 1,
            msg: 'time must be a number',
            toastLength: Toast.LENGTH_LONG,
            fontSize: 16.0,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white70,
            backgroundColor: Colors.red);
      }

      if (time != null)
        ftime = time;

      ////////// coding...........

      balkTime=calculateBalkTime(flambda,fmeo,ftime,fnServers,fKCapacity,fMpresentPeople);
      numberOfCustomers=retrieveNumberOfCustomersAndWaitingTime(flambda, fmeo, ftime, fnServers, fKCapacity, fMpresentPeople);

      calculateWaitingTime(flambda, fmeo, ftime, fnServers, fKCapacity, fMpresentPeople);

      int counter=0;
      int dCounter=0;
      int lambdaCounter=0;

      int meoCounter=0;
      for(int i=0; i<(balkTime.toInt()+(10*((1/meo).toInt())));i+=(1/fmeo).toInt()){

        xAxisDeparturesList.add('Customer $i');

      }
      //(1/flambda).toInt()
      ////////////////////////



      //////////////////////////////

      for (int i=-1;i<(balkTime.toInt()+(10*((1/flambda).toInt())));i+=1){

        xAxisArrivalsList.add('Customer $counter');
        botContainerArrivalsDataList.add(i);
        //botContainerNOFDataList.add(finalNumberOfCustomers(lambdaCounter,flambda,fmeo,fMpresentPeople,balkTime.toInt(),fKCapacity));
        //lambdaCounter+=(1/flambda).toInt();
        botContainerNOFDataList.add(finalNumberOfCustomers(lambdaCounter,flambda,fmeo,fMpresentPeople,balkTime.toInt(),fKCapacity));
        lambdaCounter+=1;
        counter++;
        print('I Value is: $i');
      }

    }


  }





  double calculateBalkTime(double flambda, double fmeo, double ftime, int fnServers, int fKCapacity,int fMpresentPeople) {

    if(flambda > fmeo){

        int ti;
        int tempTi, tempk;

        if(fMpresentPeople != 0) {
          ti = (((fKCapacity * flambda) - (fmeo) - (flambda / fMpresentPeople)) /
              ((flambda * flambda) - (flambda * fmeo))).round();
        }else {

          ti=((fKCapacity/(flambda-fmeo)) - (fmeo/((flambda*flambda)-(fmeo*flambda)))).floor();

        }


        tempTi = ti;
        tempk = fKCapacity;
        while (tempk == fKCapacity) {
          ti = tempTi;
          tempTi = (ti - (1 / flambda)).toInt();
          tempk = (flambda * tempTi).floor() -
              ((fmeo * tempTi) - (fmeo / flambda)).floor();
        }
        return ti.toDouble();


    }else {
      int ti;

      if(fMpresentPeople != 0) {
         ti = (fMpresentPeople / (fmeo - flambda)).floor();
         int tempTi = ti;
         int tempPresentPeople = fMpresentPeople;

         while (tempPresentPeople == fMpresentPeople) {
           ti = tempTi;
           tempTi = (ti - (1 / flambda)).toInt();
           tempPresentPeople =
               (fmeo * tempTi).floor() - (flambda * tempTi).floor();
         }

         return ti.toDouble();
      }else{

        ti=0;
        return ti.toDouble();
      }
    }





  }




  int retrieveNumberOfCustomersAndWaitingTime(double flambda, double fmeo, double ftime, int fnServers, int fKCapacity,int fMpresentPeople){


    int balkTime = calculateBalkTime(flambda, fmeo, ftime, fnServers, fKCapacity, fMpresentPeople).toInt();

      int n = finalNumberOfCustomers(ftime.toInt(), flambda, fmeo, fMpresentPeople, balkTime, fKCapacity);

    return n;


  }



  void calculateWaitingTime(double flambda, double fmeo, double ftime, int fnServers, int fKCapacity,int fMpresentPeople){


    int balkTime = calculateBalkTime(flambda, fmeo, ftime, fnServers, fKCapacity, fMpresentPeople).toInt();

    int n = finalNumberOfCustomers(ftime.toInt(), flambda, fmeo, fMpresentPeople, balkTime, fKCapacity);

    int waitingTime=0;
    int waitingTime2=0;

    //case 1
    if(flambda > fmeo){

      if(((1/fmeo).toInt() % (1/flambda).toInt())!=0){
        if(n==0 || n==1){
          waitingTime=0;
          outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime';

          setState(() {

          });
        }else if(n >1 && n <= (flambda*balkTime).toInt()){
          waitingTime = (((1/fmeo)-(1/flambda))*(n-1)).toInt();
          outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime';

          setState(() {

          });

        }else{
          waitingTime = (((1/fmeo)-(1/flambda))*(flambda*balkTime-2)).toInt();
          waitingTime2= (((1/fmeo)-(1/flambda))*(flambda*balkTime-3)).toInt();

          outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime or $waitingTime2';

          setState(() {

          });

        }
      }else{

        if(n==0 || n==1){
          waitingTime=0;
          outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime';

          setState(() {

          });
        }else if(n >1 && n <= (flambda*balkTime).toInt()){
          waitingTime = (((1/fmeo)-(1/flambda))*(n-1)).toInt();
          outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime';

          setState(() {

          });

        }else{
          waitingTime = (((1/fmeo)-(1/flambda))*(flambda*balkTime-2)).toInt();
          waitingTime2= (((1/fmeo)-(1/flambda))*(flambda*balkTime-3)).toInt();

          outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime';

          setState(() {

          });
        }
      }

    }else {

      if(fMpresentPeople==0) {
        waitingTime = 0;

        outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime';

        setState(() {

        });

      }
      else {

        if(n==0){
          waitingTime = ((fMpresentPeople-1)/(2*fmeo)).toInt();
          outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime';

          setState(() {

          });
        }else if(n < (flambda*balkTime).toInt()){

          waitingTime=((fMpresentPeople-1+n)*(1/fmeo).toInt()-(n*(1/flambda)).toInt());

          outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime';

          setState(() {

          });

        }else {

          waitingTime =0;

          outText = 'The number of Customers in the System is: $n \nand the Waiting time is $waitingTime';

          setState(() {

          });

        }



      }




    }




  }




  int finalNumberOfCustomers(int curTime,double flambda,double fmeo,int fpresentPeople,int balkTime,int fkCapacity){



      if(flambda > fmeo){

        if(curTime < balkTime){

          if(curTime < (1/flambda).toInt()) {
            return 0;
          }else{
            int s = (flambda*curTime).floor() - ((fmeo*curTime - (fmeo/flambda))).floor();

            return s;
          }

        } // end of if time is less than ti

        else {

          if(hasLeft(curTime,flambda,fmeo)){

            if(!hasArrived(curTime,flambda,fmeo)){
              return fkCapacity-2;
            }else{
              return fkCapacity-1;
            }

          }else if(hasArrived(curTime,flambda,fmeo)){

            return fkCapacity-1;

          }else {

            return finalNumberOfCustomers(curTime-1,flambda,fmeo,fpresentPeople,balkTime,fkCapacity);

          }


        }

      }
      else{



        if(flambda == fmeo){

          if(fpresentPeople==0)
            return 1;
          else
            return fpresentPeople;

        }else {

          if(curTime < balkTime){

              return fpresentPeople + (flambda * curTime).floor() -
                  (fmeo * curTime).floor();


          }else{

            if((curTime % (1/flambda)) < (1/fmeo)){
              return 1;
            }else{
              return 0;
            }

          }

        }

      }






  }

  bool hasLeft(int curTime,double flambda,double fmeo){

    return (curTime % (1/fmeo)) == (1/flambda);

  }

  bool hasArrived(int curTime,double flambda,double fmeo){

    return curTime %(1/flambda) ==0;

  }







  }





