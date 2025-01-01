import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_children_hospital/contactUs.dart';

class NiceHospital extends StatefulWidget {
  const NiceHospital({super.key});

  @override
  State<NiceHospital> createState() => _NiceHospitalState();
}

class _NiceHospitalState extends State<NiceHospital> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  late InAppWebViewController _webViewController;
  void _loadUrlWithInjection(String url) {
    _webViewController
        .loadUrl(urlRequest: URLRequest(url: WebUri(url)))
        .then((_) {
      // Wait for page to load before injecting
      Future.delayed(const Duration(milliseconds: 500), _injectJavaScript);
    });
  }

  void _injectJavaScript() {
    String jsScript = """
    let navbar = document.getElementById('ftco-navbar');
    navbar.style.display = "none";
    let footer = document.querySelector("footer");
    footer.style.display = "none";
    let img = document.querySelector('.img-fluid');
    // img.style.direction = 'ltr';
    // img.style.paddingTop = '60px';
    // img.style.paddingLeft = '80px';
    // img.style.width = '90%';
    """;
    _webViewController.evaluateJavascript(source: jsScript);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange.shade50,
        title: Text(
          "NICE CHILDREN HOSPITAL",
          style: GoogleFonts.aboreto(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            ListTile(
              leading: Icon(Icons.home_filled),
              title: Text("HOME"),
              onTap: () {
                _loadUrlWithInjection(
                    "https://nicechildrenhospital.com/index.php");

                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.adobe_outlined),
              title: Text("ABOUT"),
              onTap: () {
                _loadUrlWithInjection(
                    "https://nicechildrenhospital.com/about.php");

                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.group),
              title: Text("OUR TEAM"),
              onTap: () {
                _loadUrlWithInjection(
                    "https://nicechildrenhospital.com/team.php");
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.horizontal_split_sharp),
              title: Text("SERVICES"),
              onTap: () {
                _loadUrlWithInjection(
                    "https://nicechildrenhospital.com/services.php");
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.table_bar_rounded),
              title: Text("ACHIEVEMENT"),
              onTap: () {
                _loadUrlWithInjection(
                    "https://nicechildrenhospital.com/achi.php");

                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.paragliding),
              title: Text("PRAISE"),
              onTap: () {
                _loadUrlWithInjection(
                    "https://nicechildrenhospital.com/testi.php");

                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.dew_point),
              title: Text("WHAT WE DO"),
              onTap: () {
                _loadUrlWithInjection(
                    "https://nicechildrenhospital.com/department.php");

                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text("CONTACT"),
              onTap: () {
                Future.delayed(const Duration(milliseconds: 500), () {
                  _injectJavaScript();
                });
                // _webViewController.loadUrl(
                //     urlRequest: URLRequest(
                //         url: WebUri(
                //             "https://nicechildrenhospital.com/contact.php")));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactPage(),
                    ));
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: InAppWebView(
              onLoadStop: (controller, url) {
                // Re-inject JavaScript after each page load
                _injectJavaScript();
              },
              onProgressChanged: (controller, progress) {
                // You could also inject when progress reaches 100
                if (progress == 100) {
                  _injectJavaScript();
                }
              },
              initialUrlRequest:
                  URLRequest(url: WebUri("https://nicechildrenhospital.com")),
              initialSettings: InAppWebViewSettings(
                  allowsLinkPreview: true,
                  javaScriptEnabled: true,
                  verticalScrollBarEnabled: false),
              onWebViewCreated: (controller) {
                _webViewController = controller;
                Future.delayed(Duration(milliseconds: 500), () {
                  _injectJavaScript();
                });
              },
            ),
          ),
          // Positioned(
          //   top: 104,
          //   left: 5,
          //   child: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     child: IconButton(
          //       icon: Icon(
          //         color: Colors.orangeAccent,
          //         Icons.menu_rounded,
          //         size: 25,
          //       ),
          //       onPressed: () {
          //         _key.currentState?.openDrawer(); // Open the drawer
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
