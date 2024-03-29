import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/Global/webview_url_consts.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_settings.cubit.dart';

class InAppWebViewPage extends StatefulWidget {
  final String url;
  final bool changeTresto;
  final bool allowRedirect;
  const InAppWebViewPage(
      {super.key,
      required this.url,
      required this.changeTresto,
      required this.allowRedirect});

  @override
  State<InAppWebViewPage> createState() => _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  InAppWebViewController? webViewController;
  @override
  Widget build(BuildContext context) {
    // CookieManager cookieManager = CookieManager.instance();

    final GlobalKey webViewKey = GlobalKey();
    /* cookieManager.setCookie(
        url: WebUri(widget.url),
        name: 'tresto_session',
        value: BlocProvider.of<DashBoardCubit>(context).state.token,
        isSecure: true); */
    InAppWebViewSettings settings = InAppWebViewSettings(
        useShouldOverrideUrlLoading: true,
        useHybridComposition: true,
        horizontalScrollBarEnabled: false,
        supportZoom: false);

    //-----------------------------------------------------------------------------------------------
    const myStorage = FlutterSecureStorage();
    CookieManager cookieManager = CookieManager.instance();
    //------------------------------------------------------------------------------------------------

    /* myStorage.delete(key: 'tresto_session');
    cookieManager.deleteAllCookies(); */
    return InAppWebView(
      key: webViewKey,
      initialSettings: settings,
      initialUrlRequest: URLRequest(url: WebUri(widget.url)),
      initialUserScripts: UnmodifiableListView([
        UserScript(
            source: widget.changeTresto ? JsInjection.rmNavBarNoFlicker : '',
            injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START),
      ]),
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        return widget.allowRedirect
            ? NavigationActionPolicy.ALLOW
            : NavigationActionPolicy.CANCEL;
      },
      onWebViewCreated: (controller) async {
        // String trestoCookie = await myStorage.read(key: 'tresto_session') ?? '';

        /* cookieManager.setCookie(
            url: WebUri(WebViewUrls.home),
            name: 'tresto_session',
            value: trestoCookie); */

        webViewController = controller;
      },
      onLoadStart: (controller, url) {
        controller.evaluateJavascript(
            source: changeBackgroundColor(AppColor.hexColorIndexTrestoList[
                context.read<AppSettingsCubit>().state.colorIndex]));
      },
      onProgressChanged: (controller, progress) {
        controller.evaluateJavascript(
            source: changeBackgroundColor(AppColor.hexColorIndexTrestoList[
                context.read<AppSettingsCubit>().state.colorIndex]));

        /*  widget.changeTresto ? controller.evaluateJavascript(source: '''
                document.querySelectorAll("div > a#menu-item-0")[0].click();
                window.location.href = '${widget.url.substring(baseUrl.length, widget.url.length)}'
                
                ''') : ''; */
      },
      onLoadStop: (controller, url) {
        if (!widget.changeTresto) {
          controller.evaluateJavascript(source: JsInjection.rmBtn);
        } else {
          /* controller.evaluateJavascript(
              source: JsInjection.removeConfigLongButton); */
        }
        !widget.changeTresto
            ? controller.evaluateJavascript(
                source: JsInjection.addEventListenerAndRedirect)
            : '';
      },
    );
  }
}
