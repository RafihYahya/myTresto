import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tresto_v002a/Globals/webview_url_consts.dart';
import 'package:tresto_v002a/LOGIC/Blocs/test_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/test_state.dart';
import 'package:tresto_v002a/LOGIC/Cubits/dashboard_cubit.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  HeadlessInAppWebView? headlessWebView;

  @override
  void initState() {
    super.initState();
    headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(WebViewUrls.home)),
      onLoadStop: (controller, url) {
        controller.evaluateJavascript(
            source: changeRestoInWebViewHandler(1, WebViewUrls.home));
        controller.evaluateJavascript(source: JsInjection.rmNavBar);
      },
    );
    headlessWebView?.run();
  }

  @override
  void dispose() {
    super.dispose();
    headlessWebView?.dispose();
  }
  List<String> permutateListDirty(List<String> list) {
    List<String> tempList = [];
    for(final e in list){
      tempList.add(e);
    }
    tempList.add(list.first);
    return tempList.sublist(1);

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestBloc(TestState(desc: 'desc', index: 0,testList: ['restoA','restoB','restoC'])),
      child: BlocBuilder<TestBloc, TestState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                MaterialButton(onPressed: () {
                  BlocProvider.of<TestBloc>(context).add(TestEvent.printAdd);
                }),
                Text(state.index.toString()),
                Text(state.testList.toString()),
                Text(permutateListDirty(state.testList).toString()),
                Text(permutateListDirty(permutateListDirty(state.testList)).toString()),
                Text(permutateListDirty(permutateListDirty(permutateListDirty(state.testList))).toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
