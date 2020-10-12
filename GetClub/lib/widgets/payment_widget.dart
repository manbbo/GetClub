import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

enum UniLinksType { string, uri }

class PaymentStreamBuilder extends StatefulWidget {
  @override
  _PaymentStreamBuilderState createState() => _PaymentStreamBuilderState();
}

class _PaymentStreamBuilderState extends State<PaymentStreamBuilder>
    with SingleTickerProviderStateMixin {
  String _initialLink, _latestLink;
  Uri _initialUri, _latestUri;

  StreamSubscription _sub;

  UniLinksType _type = UniLinksType.string;

  final List<String> _cmds = getCmds();
  final TextStyle _cmdStyle = const TextStyle(
      fontFamily: 'Courier', fontSize: 12.0, fontWeight: FontWeight.w700);

  @override
  initState() {
    super.initState();
    initPlatformState();
    _initialLink = "getnet://pagamento/v1/payment";
  }

  @override
  dispose() {
    if (_sub != null) _sub.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    } else {
      await initPlatformStateForUriUniLinks();
    }
  }

  /// An implementation using a [String] link
  Future<void> initPlatformStateForStringUniLinks() async {
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      if (!mounted) return;
      setState(() {
        _latestLink = link ?? 'Unknown';
        _latestUri = null;
        try {
          if (link != null) _latestUri = Uri.parse(link);
        } on FormatException {}
      });
    }, onError: (Object err) {
      if (!mounted) return;
      setState(() {
        _latestLink = 'Failed to get latest link: $err.';
        _latestUri = null;
      });
    });

    // Attach a second listener to the stream
    getLinksStream().listen((String link) {
      print('got link: $link');
    }, onError: (Object err) {
      print('got err: $err');
    });

    // Get the latest link
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _initialLink = await getInitialLink();
      print('initial link: $_initialLink');
      if (_initialLink != null) _initialUri = Uri.parse(_initialLink);
    } on PlatformException {
      _initialLink = 'Failed to get initial link.';
      _initialUri = null;
    } on FormatException {
      _initialLink = 'Failed to parse the initial link as Uri.';
      _initialUri = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _latestLink = _initialLink;
      _latestUri = _initialUri;
    });
  }

  /// An implementation using the [Uri] convenience helpers
  Future<void> initPlatformStateForUriUniLinks() async {
    // Attach a listener to the Uri links stream
    _sub = getUriLinksStream().listen((Uri uri) {
      if (!mounted) return;
      setState(() {
        _latestUri = uri;
        _latestLink = uri?.toString() ?? 'Unknown';
      });
    }, onError: (Object err) {
      if (!mounted) return;
      setState(() {
        _latestUri = null;
        _latestLink = 'Failed to get latest link: $err.';
      });
    });

    // Attach a second listener to the stream
    getUriLinksStream().listen((Uri uri) {
      print('got uri: ${uri?.path} ${uri?.queryParametersAll}');
    }, onError: (Object err) {
      print('got err: $err');
    });

    // Get the latest Uri
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _initialUri = await getInitialUri();
      print('initial uri: ${_initialUri?.path}'
          ' ${_initialUri?.queryParametersAll}');
      _initialLink = _initialUri?.toString();
    } on PlatformException {
      _initialUri = null;
      _initialLink = 'Failed to get initial uri.';
    } on FormatException {
      _initialUri = null;
      _initialLink = 'Bad parse the initial link as Uri.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _latestUri = _initialUri;
      _latestLink = _initialLink;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: initPlatformStateForUriUniLinks(),
        builder: (context, snapshot) {
          return new Scaffold(
              body: new SingleChildScrollView(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: new Column(
                children: [
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    alignment: Alignment.topCenter,
                    child: new Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text("Pague o Empreendedor"),
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Container(
                          width: 220,
                          height: 85,
                          child: new Column(
                            children: [
                              new Container(
                                width: 220,
                                child: Text(
                                  "Personal Home",
                                  style: TextStyle(fontSize: 27),
                                ),
                              ),
                              new Container(
                                child: Row(
                                  children: [
                                    new Container(
                                      width: 19,
                                      height: 19,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/images/home/star.png")),
                                    ),
                                    Text(" (4,5) Manutenção e Limpeza")
                                  ],
                                ),
                              ),
                              new Container(
                                height: 15,
                              ),
                              new Row(
                                children: [
                                  Text(
                                    "CNPJ:",
                                    style: TextStyle(color: Color(0xffDADADA)),
                                  ),
                                  Text(" 000.000.000/0001-00"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        new Container(
                          width: 97,
                          height: 97,
                          child: Image(
                            image: AssetImage("assets/images/home/avatar2.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 10,
                  ),
                  new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Container(
                          alignment: Alignment.center,
                          width: 226,
                          height: 43,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffA8131D)),
                              color: Color(0xffFDF3F3)),
                          child: new TextField(
                            controller:
                                new TextEditingController(text: "R\$150,00"),
                            //expands: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Digite o valor acordado",
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        new Container(
                          width: 20,
                        ),
                        new Container(
                          width: 60,
                          height: 40,
                          child: new IconButton(
                              icon: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffA8131D),
                            //border: Border.all(color: Color(0xffA8131D)),
                            //color: Color(0xffFDF3F3)
                          ),
                        )
                      ],
                    ),
                    width: 306,
                    height: 78,
                  ),
                  new Container(
                    height: 57,
                  ),
                  new Container(
                    alignment: Alignment.center,
                    width: 226,
                    height: 226,
                    child: new Container(
                      width: 124,
                      height: 124,
                      child: Image(
                        image: AssetImage('assets/images/qrcode.png'),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                  ),
                  Text(
                      "Aproxime seu celular ou compartilhe\nPara realizar a transação"),
                  new Container(
                    height: 13,
                  ),
                  new Container(
                    width: 60,
                    height: 40,
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(Icons.share_outlined),
                      iconSize: 27,
                      color: Color(0xffA8131D),
                      onPressed: () {},
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffA8131D))),
                  )
                ],
              ),
            ),
          ));
        });
  }
}

List<String> getCmds() {
  String cmd;
  String cmdSuffix = '';

  if (Platform.isIOS) {
    cmd = '/usr/bin/xcrun simctl openurl booted';
  } else if (Platform.isAndroid) {
    cmd = '\$ANDROID_HOME/platform-tools/adb shell \'am start'
        ' -a android.intent.action.VIEW'
        ' -c android.intent.category.BROWSABLE -d';
    cmdSuffix = "'";
  } else {
    return null;
  }

  // https://orchid-forgery.glitch.me/mobile/redirect/
  return [
    '$cmd "unilinks://host/path/subpath"$cmdSuffix',
    '$cmd "unilinks://example.com/path/portion/?uid=123&token=abc"$cmdSuffix',
    '$cmd "unilinks://example.com/?arr%5b%5d=123&arr%5b%5d=abc'
        '&addr=1%20Nowhere%20Rd&addr=Rand%20City%F0%9F%98%82"$cmdSuffix',
  ];
}

List<Widget> intersperse(Iterable<Widget> list, Widget item) {
  final initialValue = <Widget>[];
  return list.fold(initialValue, (all, el) {
    if (all.length != 0) all.add(item);
    all.add(el);
    return all;
  });
}
