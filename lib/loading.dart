import 'package:flutter/material.dart';

void main() {
  runApp(const Load());
}

class Load extends StatelessWidget {
  const Load({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VMS',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyLoadPage(),
    );
  }
}

class MyLoadPage extends StatefulWidget {
  const MyLoadPage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyLoadPage> createState() => _MyLoadPageState();
}

class _MyLoadPageState extends State<MyLoadPage> {

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                height: 60,
                // elevated button created and given style
                // and decoration properties
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green
                  ),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });

                    // we had used future delayed to stop loading after
                    // 3 seconds and show text "submit" on the screen.
                    Future.delayed(const Duration(seconds: 3), (){
                      setState(() {
                        isLoading = false;
                      });
                    }
                    );
                  }, child: isLoading? Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  // as elevated button gets clicked we will see text"Loading..."
                  // on the screen with circular progress indicator white in color.
                  //as loading gets stopped "Submit" will be displayed
                  children: const [
                   // Text('Loading...', style: TextStyle(fontSize: 20),),
                    SizedBox(width: 10,),
                    CircularProgressIndicator(color: Colors.white,),
                  ],
                ) : const Text('Submit'),

                )
            )
          ],
        ),
      ),
    );
  }
}
