import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final purpleColor=Color(0xff6688ff);
  final darkTextColor=const Color(0xff1F1A3D);
  final lightTextColor=Color(0xff999999);
  final TextFieldColor=Color(0xffF5F6FA);
  final borderColor=Color(0xffD9D9D9);

  TextEditingController txt = TextEditingController();
  var gettext = "";
  var lst = [];
  
 TextEditingController txt1 = TextEditingController();
  var gettext1 = "";
  updatesubmit(index,gettext1){
    setState(() {
      lst.replaceRange(index, index+1, [gettext1]);});}
  
  
  submit() {
    setState(() {
      lst.add(gettext);
      
    });
    
  }
  

  // removeitem(){
  // setState(() {
  //   lst.remove
  // });
  // }
    onTap(index) {
        setState(() {
          lst.removeAt(index);
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
        appBar:AppBar(
          backgroundColor: purpleColor,
          title: Center(child: Text("ToDo App")),
          
        ),
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,),
            SizedBox(
              width: 400,
              child: TextField(
                
                decoration: InputDecoration(
                  
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.transparent,width: 0),
                ),
                enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.transparent,width: 0),
                 ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                  filled: true,
                  fillColor: TextFieldColor,
                  ),
                  

              controller: txt,
              onChanged: (value) {
                gettext = value;
              },
          ),
            ),
          SizedBox(height: 20,),
              SizedBox(
                // width: double.infinity,
                width: 200,
                height: 50,
                child: TextButton(
                onPressed: () {
                  submit();
                  txt.clear();
                },            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(purpleColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14)),
                textStyle:MaterialStateProperty.all(TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                
                // maximumSize: MaterialStateProperty.all(Size(60, 30))
            ),
                child: Text("Add to List")),
              ),
          SizedBox(
            width: 300,
            
            child: ListView.builder(
              padding: EdgeInsets.all(24),
                
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: lst.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      
                      (Text(lst[index],style: TextStyle(color:Colors.white,
                      fontSize: 22, ),
                      )

                      ),
                      
                      SizedBox(width: 10,),
                      TextButton(onPressed:()  {onTap(index);}, child: Text("Delete"),style: 
                      ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.grey),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14)),
                  textStyle:MaterialStateProperty.all(TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), ),),
                      SizedBox(width: 10,),
                      TextButton(onPressed:() => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: TextField(
              controller: txt1,
              onChanged: (value) {
                gettext1 = value;
              },
            ),
              actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: (){updatesubmit(index, gettext1);Navigator.pop(context, 'OK');},
                child: const Text('OK'),
              ),
            ],
        ),
      ), child: Text("Edit"),style: ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.grey),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14)),
                  textStyle:MaterialStateProperty.all(TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),),),
                    ],
                  );
                },),
          ),
              
        ],
      ),
    ));
  }
}