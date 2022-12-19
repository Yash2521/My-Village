import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:practice/main.dart';
import 'package:practice/splash.dart';
import 'package:practice/theme.dart';
import 'package:practice/theme_model.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {

  ThemeSharedPreferences themeSharedPreferences = ThemeSharedPreferences();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context,ThemeModel themeNotifier,child){
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                // DayNightSwitcherIcon(isDarkModeEnabled: , onStateChanged:),
                Text(themeNotifier.isDark ? "Dark Mode" : "Light Mode"),
                DayNightSwitcher(
                    isDarkModeEnabled: themeNotifier.isDark ? true : false,
                    onStateChanged: (value) {
                      themeNotifier.isDark ? themeNotifier.isDark = false : themeNotifier.isDark = true;
                      print(value);
                      themeSharedPreferences.setTheme(value);
                      setState(() {
                      });
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Splash()), (route) => false);
                    })
              ],
            ),
          ),
        ),
      );
    }
    );
  }
}


















// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(left: 16, top: 25, right: 16),
//         child: ListView(
//           children: [
//             Text(
//               "Settings",
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.person,
//                   color: Color(0xff3957ed),
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Text(
//                   "Account",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Divider(
//               height: 15,
//               thickness: 2,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             buildAccountOptionRow(context, "Content settings"),
//             buildAccountOptionRow(context, "Social"),
//             buildAccountOptionRow(context, "Language"),
//             buildAccountOptionRow(context, "Privacy and security"),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.volume_up_outlined,
//                   color: Color(0xff3957ed),
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Text(
//                   "Notifications",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Divider(
//               height: 15,
//               thickness: 2,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             buildNotificationOptionRow("New for you", true),
//             buildNotificationOptionRow("Account activity", true),
//             buildNotificationOptionRow("Opportunity", false),
//             SizedBox(
//               height: 50,
//             ),
//             // Center(
//             //   child: ElevatedButton(
//             //     style: ButtonStyle(
//             //       backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff3957ed)),
//             //     ),
//             //     onPressed: () {},
//             //     child: Text("SIGN OUT",
//             //         style: TextStyle(
//             //             fontSize: 16, letterSpacing: 2.2, color: Colors.white)),
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Row buildNotificationOptionRow(String title, bool isActive) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[600]),
//         ),
//         Transform.scale(
//             scale: 0.7,
//             child: CupertinoSwitch(
//               value: isActive,
//               onChanged: (bool val) {},
//             ))
//       ],
//     );
//   }
//
//   GestureDetector buildAccountOptionRow(BuildContext context, String title) {
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text(title),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("Option 1"),
//                     Text("Option 2"),
//                     Text("Option 3"),
//                   ],
//                 ),
//                 actions: [
//                   FlatButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text("Close")),
//                 ],
//               );
//             });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[600],
//               ),
//             ),
//             Icon(
//               Icons.arrow_forward_ios,
//               color: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }