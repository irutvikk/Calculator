import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    home: Mainclass(),
  ));
}

class Mainclass extends StatefulWidget {
  @override
  State<Mainclass> createState() => _MainclassState();
}

class _MainclassState extends State<Mainclass> {
  String history="";
  String ans="";
  String firstvalue="";
  String secondvalue="";
  int count=0;
  String temp="";

  void getvalue(String s) {
    setState(() {
      ans=ans+s;
    });
  }
  void operator(String s) {
    setState(() {
     // firstvalue=ans;
      temp = firstvalue;
      firstvalue = ans;
      ans="";
      if(count==1) {
        firstvalue= "${double.parse(temp) + double.parse(firstvalue)}";
      }
      if(count==2) {
        firstvalue= "${double.parse(temp) - double.parse(firstvalue)}";
      }
      if(count==3) {
        firstvalue= "${double.parse(temp) * double.parse(firstvalue)}";
      }
      if(count==4) {
        firstvalue= "${double.parse(temp) / double.parse(firstvalue)}";
      }
      if(s=="+"){
        history="$history+";
        count=1;

      }
      else if(s=="-"){
        history="$history-";
        count=2;

      }else if(s=="x") {
        history="$history*";
        count=3;

      }else if(s=="÷"){
        history="$history÷";
        count=4;

      }
       else if(s=="%"){
        history="$history%";
        count=5;
       }
    });
  }

  void answer() {
    setState(() {
      secondvalue=ans;
      ans="";
      if (count==1){
        ans= "${double.parse(firstvalue) + double.parse(secondvalue)}";
        history=ans;
             }else if (count==2){
        ans= "${double.parse(firstvalue) - double.parse(secondvalue)}";
        history=ans;
      }else if (count==3){
        ans= "${double.parse(firstvalue) * double.parse(secondvalue)}";
        history=ans;
      }else if (count==4){
        ans= "${double.parse(firstvalue) / double.parse(secondvalue)}";
        history=ans;
      }else if (count==5){
        ans= "${double.parse(firstvalue) * double.parse(secondvalue) / 100}";
        history=ans;
      }
      count=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator",),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    alignment: Alignment.bottomRight,
                    child: Text(history,style: TextStyle(fontSize: 65,fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                    alignment: Alignment.bottomRight,
                    child: Text(ans,style: TextStyle(fontSize: 50),),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left:10,top:0,right:10,bottom:10),
                      height: 1,
                      width: double.infinity,
                      color: Color(0x44626262),),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ans="";
                          firstvalue="";
                          secondvalue="";
                          temp="";
                          count=0;
                          history="";
                        });
                      },
                      child: Text("AC",style: TextStyle(fontWeight: FontWeight.w500),),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),backgroundColor: Color(0xFFFF0000)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if(ans.isNotEmpty){
                            ans=ans.substring(0,ans.length-1);
                            history=history.substring(0,history.length-1);
                          }
                          else{
                            ans="";
                          }
                        });
                      },
                      child: Icon(Icons.backspace_outlined),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),backgroundColor: Color(0xFFFF0000)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        operator("%");
                      },
                      child: Text("%"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),backgroundColor: Color(0xFFFF0000)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        operator("÷");
                      },
                      child: Text("÷"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),backgroundColor: Color(0xFFFF0000)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"7"}";
                        getvalue("7");
                      },
                      child: Text("7"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"8"}";
                        getvalue("8");
                      },
                      child: Text("8"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"9"}";
                        getvalue("9");
                      },
                      child: Text("9"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        operator("x");
                      },
                      child: Text("x"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),backgroundColor: Color(0xFFFF0000)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"4"}";
                        getvalue("4");
                      },
                      child: Text("4"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"5"}";
                        getvalue("5");
                      },
                      child: Text("5"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"6"}";
                        getvalue("6");
                      },
                      child: Text("6"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        operator("-");
                      },
                      child: Text("-"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),backgroundColor: Color(0xFFFF0000)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"1"}";
                        getvalue("1");
                      },
                      child: Text("1"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"2"}";
                        getvalue("2");
                      },
                      child: Text("2"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"3"}";
                        getvalue("3");
                      },
                      child: Text("3"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        operator("+");
                      },
                      child: Text("+"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),backgroundColor: Color(0xFFFF0000)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 2,
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        history="${history+"0"}";
                        getvalue("0");
                      },
                      child: Text("0"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                          if(ans==""){
                            ans="";
                          }
                          else if(ans.contains("\."))
                            {
                              ans=ans;
                            }
                          else{
                            history="${history+"\."}";
                            getvalue("\.");
                          }
                      },
                      child: Text("."),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.all(1),
                    child: ElevatedButton(
                      onPressed: () {
                        answer();
                      },
                      child: Text("="),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 30),
                          minimumSize: Size(90, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),
                              ),
                          ),
                          backgroundColor: Color(0xFFFF0000)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      );
  }
}
