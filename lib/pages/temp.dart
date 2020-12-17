import 'package:flutter/material.dart';

void main() => runApp(page3_Welcomepage());
final double _minimumPadding = 5.0;
class page3_Welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),


      body: Container(
        margin: EdgeInsets.all(_minimumPadding),
        child: ListView(
          children: <Widget>[


            Expanded(
              // flex: 1,
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35.0,
                ),
              ),
            ),

            Expanded(
              // flex: 1,
              child: Text(
                'Enter shop name',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35.0,
                ),
              ),
            ),

            Expanded(
              child: TextField(
                //style: textStyle,
                decoration: InputDecoration(
                    labelText: 'Shop name',
                    hintText: 'My shop',
                    //labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

            Expanded(
              // flex: 1,
              child: Text(
                'No. of products',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35.0,
                ),
              ),
            ),

            Expanded(
              child: TextField(
                controller: myController,
                keyboardType: TextInputType.number,
                // obscureText: true,
                //style: textStyle,
                decoration: InputDecoration(
                    labelText: 'No. of products',
                    hintText: 'Ex. 7',
                    //labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

            for(int i = 0;i < 4 ;i++)
              Expanded(
                child: TextField(
                  //style: textStyle,
                  decoration: InputDecoration(
                      labelText: 'Shop name',
                      hintText: 'My shop',
                      //labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
          ],
        ),
      )




      // floatingActionButton: FloatingActionButton(
      //   // When the user presses the button, show an alert dialog containing
      //   // the text that the user has entered into the text field.
      //   onPressed: () {
      //     return showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           // Retrieve the text the that user has entered by using the
      //           // TextEditingController.
      //           content: Text(myController.text),
      //         );
      //       },
      //     );
      //   },
      //   tooltip: 'Show me the value!',
      //   child: Icon(Icons.text_fields),
      // ),
    );
  }
}