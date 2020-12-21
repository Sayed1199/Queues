import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

class StochasticScreen extends StatefulWidget {
  @override
  _StochasticScreenState createState() => _StochasticScreenState();
}

class _StochasticScreenState extends State<StochasticScreen> {


  final TextEditingController stochasticLambdaController = TextEditingController();
  final TextEditingController stochasticMeoController = TextEditingController();
  final TextEditingController stochasticNServersController = TextEditingController();
  final TextEditingController stochasticCapacityController = TextEditingController();

  bool isResultsTextVisible= false;
  String resultText ='';

  Color lambda_borderColor = Color(0xff0b86e5);
  Color meo_borderColor = Color(0xff0b86e5);
  Color nServers_borderColor = Color(0xff0b86e5);
  Color capacity_borderColor = Color(0xff0b86e5);

  double flambda,fmeo;
  int fc,fk;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    stochasticLambdaController.addListener(() {

      print('stochastic lambda Cotroller: ${stochasticLambdaController.text}');
      setState(() {

      });

    });

    stochasticMeoController.addListener(() {

      print('stochastic Meo Cotroller: ${stochasticMeoController.text}');
      setState(() {

      });

    });

    stochasticNServersController.addListener(() {

      print('stochastic NServer Cotroller: ${stochasticNServersController.text}');
      setState(() {

      });

    });


    stochasticCapacityController.addListener(() {

      print('stochastic Capacity Cotroller: ${stochasticCapacityController.text}');
      setState(() {

      });

    });



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    stochasticLambdaController.dispose();
    stochasticMeoController.dispose();
    stochasticCapacityController.dispose();
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

            stochasticCapacityController.clear();
            stochasticNServersController.clear();
            stochasticMeoController.clear();
            stochasticLambdaController.clear();
            resultText='';
            isResultsTextVisible=false;
            setState(() {

            });

          },
          icon: Icon(Icons.delete),
          label: Text("Clear"),
          splashColor: Colors.red,
        ),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: ListView(

          children: [

            SizedBox(height: 10.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Stochastic',style: TextStyle(color: Colors.pink,fontSize: 22.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                Text(' Queue... ',style: TextStyle(color: Colors.purple.withOpacity(0.6),fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),

              ],
            ),

            SizedBox(height: 40.0,),

            Row(
              children: [

                Flexible(
                  child: TextField(
                      controller: stochasticLambdaController,
                      onSubmitted: (_){
                        print('final lambda is: ${stochasticLambdaController.text}');
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        hintText: 'mean Arrival Rate',
                        hintStyle: TextStyle(color: Colors.grey,),
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

                  ),
                ),
                SizedBox(width: 10.0,),

                Flexible(
                  child: TextField(
                    controller: stochasticMeoController,
                    onSubmitted: (_){
                      print('final meo is: ${stochasticMeoController.text}');
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      hintText: 'mean Service rate',
                      hintStyle: TextStyle(color: Colors.grey,),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                      focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                        ,borderSide: BorderSide(width: 2,color: meo_borderColor),
                      ),
                      labelText: ' μ ',
                      labelStyle: TextStyle(fontSize: 30.0),
                      alignLabelWithHint: true,

                    ),
                    cursorRadius: Radius.circular(10.0),
                    cursorColor: Colors.green,

                  ),
                ),

              ],
            ),
            SizedBox(height: 10.0,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 70.0),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: stochasticNServersController,
                  onSubmitted: (_){
                    print('final nServers is: ${stochasticNServersController.text}');
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Number Of Servers',
                    hintStyle: TextStyle(color: Colors.grey,),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                    focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                      ,borderSide: BorderSide(width: 2,color: nServers_borderColor),
                    ),
                    labelText: ' C ',
                    labelStyle: TextStyle(fontSize: 30.0),
                    alignLabelWithHint: true,

                  ),
                  cursorRadius: Radius.circular(10.0),
                  cursorColor: Colors.green,

                ),
              ),


            SizedBox(height: 10.0,),

        Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: stochasticCapacityController,
                  onSubmitted: (_){
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Capacity with inf for infinity',
                    hintStyle: TextStyle(color: Colors.grey,),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                    focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)
                      ,borderSide: BorderSide(width: 2,color: nServers_borderColor),
                    ),
                    labelText: ' K ',
                    labelStyle: TextStyle(fontSize: 30.0),
                    alignLabelWithHint: true,

                  ),
                  cursorRadius: Radius.circular(10.0),
                  cursorColor: Colors.green,

                ),
              ),


            SizedBox(height: 40.0,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 42.0),
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
                        'Submit...',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(width: 10.0,),
                      Icon(Icons.reply,color: Colors.white,)
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
                ),
                onPressed: handleSubmit,
              ),
            ),

            SizedBox(height: 30.0,),
            
            Visibility(
              visible: isResultsTextVisible,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(resultText,textAlign: TextAlign.center,style: TextStyle(color: Colors.green,fontSize: 18.0),),
              ),
            )


          ],

        ),
      ),


    );
  }

  void handleSubmit(){

    double lambda,meo;
    int nServers,kCapacity;

    if(stochasticLambdaController.text.isEmpty || stochasticLambdaController.text.length==0 ||
        stochasticMeoController.text.isEmpty || stochasticMeoController.text.length==0 ||
        stochasticNServersController.text.isEmpty || stochasticNServersController.text.length==0 ||
        stochasticCapacityController.text.isEmpty || stochasticCapacityController.text.length==0 ){

      Fluttertoast.showToast(msg: 'Pls fill all the fields first....',fontSize: 18,textColor: Colors.lightBlue);

    }else{

      if(stochasticLambdaController.text.contains('/')){
        int idx;
        double numerator;
        double denomenator;
        idx=stochasticLambdaController.text.indexOf('/');
        print('idx is:   $idx');
        numerator = double.parse(stochasticLambdaController.text.substring(0,idx));
        print('numerator: $numerator');
        denomenator = double.parse(stochasticLambdaController.text.substring(idx+1,stochasticLambdaController.text.length));
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
        lambda = double.tryParse(stochasticLambdaController.text);
        if(lambda == null){
          Fluttertoast.showToast(timeInSecForIosWeb: 1,
              msg: 'only division and numbers are allowed in the fields\nplease try again...',toastLength: Toast.LENGTH_LONG,
              fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.red);
        }else {
          flambda = lambda;
        }
      }

      ////////////// meo part....

      if(stochasticMeoController.text.contains('/')){
        int idx;
        double numerator;
        double denomenator;
        idx=stochasticMeoController.text.indexOf('/');
        numerator = double.parse(stochasticMeoController.text.substring(0,idx));
        print('numerator: $numerator');
        denomenator = double.parse(stochasticMeoController.text.substring(idx+1,stochasticMeoController.text.length));
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
        meo = double.tryParse(stochasticMeoController.text);
        if(meo == null){
          Fluttertoast.showToast(timeInSecForIosWeb: 1,
              msg: 'only division and numbers are allowed in the fields\nplease try again...',toastLength: Toast.LENGTH_LONG,
              fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.red);
        }else {
          fmeo = meo;
        }
      }

      ///////////////////////////// nServers and Capacity Checking...

      try{

        nServers = int.parse(stochasticNServersController.text);
        fc = nServers;

        if(stochasticCapacityController.text=='inf'){
          kCapacity=-1;
        }else{
          kCapacity = int.parse(stochasticCapacityController.text);
        }

          fk = kCapacity;

      }on Exception{

        Fluttertoast.showToast(timeInSecForIosWeb: 1,
            msg: 'Servers and capacity must be integer numbers...',toastLength: Toast.LENGTH_LONG,
            fontSize: 16.0,gravity: ToastGravity.BOTTOM,textColor: Colors.white70,backgroundColor: Colors.red);

      }
    }

    if(flambda!= null && fmeo != null){

      if(fc==1 && fk==-1){
        case1Stochastic();
      }else if(fc==1 && fk!=-1){
        case2Stochastic();
      }else if(fc!=1 && fk==-1){
        case3Stochastic();
      }else if(fc!=1 && fk!=-1){
        case4Stochastic();
      }

    }

  }

  void case1Stochastic() {

    // M/M/1

    double l,lq,w,wq;

    l= (flambda/(fmeo-flambda));
    lq=(pow(flambda, 2) /(fmeo*(fmeo-flambda)));
    w=(1/(fmeo-flambda));
    wq=(flambda/(fmeo*(fmeo-flambda)));


    resultText=  'The System is of Type M/M/1\n\nNumber in the System is: $l\n\nnumber in the Queue is: $lq\n\n waiting time in the System is: $w\n\nwaiting time in the queue is: $wq';

    isResultsTextVisible=true;

    setState(() {

    });

  }


/////////////////////////////

  void case2Stochastic() {

    // M/M/1/K

    double l,lq,w,wq,ro,pk;

    ro=(flambda/fmeo);


    if(ro != 1){
      l= ro*((1-(fk+1)*pow(ro, fk)+fk*(pow(ro, fk+1)))/((1-ro)*(1-pow(ro, fk+1))));
      pk=pow(ro,fk)*((1-ro)/(1-pow(ro, fk+1)));

    }else{
      l=fk/2;
      pk=1/(fk+1);
    }

    w=(l/(flambda*(1-pk)));

    wq= w-(1/fmeo) ;

    lq=wq*flambda*(1-pk);




    resultText=  'The System is of Type M/M/1/K\n\nNumber Of People in the System is: $l\n\nnumber of people in the Queue is: $lq\n\n waiting time in the System is: $w\n\nwaiting time in the queue is: $wq';

    isResultsTextVisible=true;

    setState(() {

    });



  }

  void case3Stochastic() {

    // M/M/C


    double l,lq,w,wq,ro,r,p0;

    r=(flambda/fmeo);
    ro=r/fc;

    if(r/fc <1){

      double totalA=0;

      for(int n=0;n<=fc-1;n++){
        totalA+=((pow(r, n))/(findFactorial(n)));
      }

      double out = totalA + ((fc*pow(r, fc))/(findFactorial(fc)*(fc-r)));

      p0=1/out;

    }else{

      double totalA=0;

      for(int n=0;n<=fc-1;n++){
        totalA+=((1/findFactorial(n))*(pow((flambda/fmeo), n)));
      }

      double out = totalA+((1/findFactorial(fc))*(pow((flambda/fmeo), fc))*((fc*fmeo)/(fc*fmeo-flambda)));

      p0=1/out;


    }

    //lq= (((pow(r, fc+1))/fc)/findFactorial(fc)*pow((1-r/fc),2))*p0 ;
    lq= p0*((pow((flambda/fmeo), fc)*flambda*fmeo)/((findFactorial(fc-1))*pow(fc*fmeo-flambda, 2)));
    wq=lq/flambda;
    w=wq+(1/fmeo);
    l=lq+(flambda/fmeo);


    print('factorial of 4 is: ${findFactorial(4)}');


    resultText=  'The System is of Type M/M/C\n\nNumber Of People in the System is: $l\n\nnumber of people in the Queue is: $lq\n\n waiting time in the System is: $w\n\nwaiting time in the queue is: $wq';

    isResultsTextVisible=true;

    setState(() {

    });




  }

  void case4Stochastic() {

    // M/M/C/K

    double l,lq,w,wq,ro,r,p0,pk;

    r=(flambda/fmeo);
    ro=r/fc;


    if(ro != 1){

      double totalA=0;

      for(int n=0;n<=fc-1;n++){
        totalA+=(pow(r, n)/findFactorial(n));
      }

      double out = totalA + ((pow(r, fc))/findFactorial(fc)*((1-pow(ro, fk-fc+1))/(1-ro)));

      p0=1/out;

    }else{

      double totalA=0;

      for(int n=0;n<=fc-1;n++){
        totalA+=(pow(r, n)/findFactorial(n));
      }

      double out = totalA + (((pow(r, fc))/findFactorial(fc))*(fk-fc+1));

      p0=1/out;


    }
    double totalSum=0;
    for(int n=0;n<=fc-1;n++){
      totalSum+=(fc-n)*(pow(r, n)/findFactorial(n));
    }

   pk=p0*(pow(flambda, fk)/((pow(fc, fk-fc))*findFactorial(fc)*pow(fmeo, fk)));


    lq= ((ro*pow(r, fc)*p0)/(findFactorial(fc)*pow(1-ro, 2)))*(1-(pow(ro, fk-fc+1))-((1-ro)*(fk-fc+1)*pow(ro, fk-fc))) ;
    l=lq+(fc-(p0*totalSum));
    w=l/(flambda*(1-pk));
    wq=lq/(flambda*(1-pk));



    print('factorial of 4 is: ${findFactorial(4)}');


    resultText=  'The System is of Type M/M/C/K\n\nNumber Of People in the System is: $l\n\nnumber of people in the Queue is: $lq\n\n waiting time in the System is: $w\n\nwaiting time in the queue is: $wq';

    isResultsTextVisible=true;

    setState(() {

    });



  }

  findFactorial(int no) {
    if(no==0)
      return 1;
    if (no == 1) {
      return 1;
    }
    return no * findFactorial(no - 1);
  }

}
