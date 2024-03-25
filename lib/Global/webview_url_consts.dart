import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String baseUrl = 'https://www.tresto.ma';

class WebViewUrls {
  static const String home = '$baseUrl/home';
  static const String login = '$baseUrl/admin/login';
  static const String createResto = '$baseUrl/start?step=2';
  static const String menu = '$baseUrl/v2/menu/products';
  static const String tables = '$baseUrl/v2/tables';
  static const String drivers = '$baseUrl/v2/drivers';
  static const String staff = '$baseUrl/v2/staff';
  static const String clients = '$baseUrl/v2/clients';
  static const String newsletter = '$baseUrl/v2/newsletter';
  static const String analytics = '$baseUrl/analytics/sales';
  static const String marketing = '$baseUrl/analytics/marketing';
  static const String settings = '$baseUrl/v2/settings';
}

class JsInjection {
  static const String rmSideBarBtn =
      '''document.getElementById('sidebar-btn-container').remove()''';
  static const String rmNavBar =
      '''document.querySelectorAll("nav").forEach(e => e.style.display = 'none');''';

  static const String rmNavBarNoFlicker2 = r'''
  const targetNode = document.querySelector("body");

// Define a callback function to be executed when mutations occur
const callback = (mutationsList, observer) => {
  for (const mutation of mutationsList) {
    if (mutation.type === "childList") {
      // Check for added nodes
      for (const addedNode of mutation.addedNodes) {
        if (addedNode.nodeName === "nav") {
          // If a nav element is added, remove it
          addedNode.parentNode.removeChild(addedNode);
        }
      }
    }
  }
};

// Create a MutationObserver instance
const observer = new MutationObserver(callback);

// Configure the observer to observe changes in child nodes
const config = { childList: true };

// Start observing the target node
observer.observe(targetNode, config);''';
  static const String jsAlert = r'''console.log('miaw')''';

  static const String removeNotifButton =
      r'''document.querySelector("div > button.p-3").remove()​''';

  static const String removeConfigLongButton =
      r'''document.querySelector("div.fixed > button").remove()''';

  static const String rmConfLbtnMutObs = r'''
const DEL_SELECTOR0 = 'div.fixed > button';
const mo2 = new MutationObserver(onMutation);
onMutation([{addedNodes: [document.documentElement]}]);
observe();
function onMutation(mutations) {
  let stopped;
  for (const {addedNodes} of mutations) {
    for (const n of addedNodes) {
      if (n.tagName) {
        if (n.matches(DEL_SELECTOR0)) {
          stopped = true;
          mo2.disconnect();
          n.remove();   //n.remove();
         //n.remove();
        } else if (n.firstElementChild && n.querySelector(DEL_SELECTOR0)) {
          stopped = true;
          mo2.disconnect();
          for (const el of n.querySelectorAll(DEL_SELECTOR0)) el.remove();
        }
      }
    }
  }
  if (stopped) observe();
}

function observe() {
  mo2.observe(document, {
    subtree: true,
    childList: true,
  });
}
  ''';

  static const String removeNotifBtnMutObserver = r'''
 const DEL_SELECTOR1 = 'div > button.p-3';
const mo1 = new MutationObserver(onMutation);
onMutation([{addedNodes: [document.documentElement]}]);
observe();
function onMutation(mutations) {
  let stopped;
  for (const {addedNodes} of mutations) {
    for (const n of addedNodes) {
      if (n.tagName) {
        if (n.matches(DEL_SELECTOR1)) {
          stopped = true;
          mo1.disconnect();
          n.remove();   //n.remove();
         //n.remove();
        } else if (n.querySelector(DEL_SELECTOR1)) {
          stopped = true;
          mo1.disconnect();
          for (const el of n.querySelectorAll(DEL_SELECTOR1)) el.remove();
        }
      }
    }
  }
  if (stopped) observe();
}

function observe() {
  mo1.observe(document, {
    subtree: true,
    childList: true,
  });
}

  
  ''';

  static const String rmNavBarNoFlicker = r'''

const DEL_SELECTOR = 'nav,div > button.p-3.rounded-full, div.fixed > button';
const mo = new MutationObserver(onMutation);
onMutation([{addedNodes: [document.documentElement]}]);
observe();
function onMutation(mutations) {
  let stopped;
  for (const {addedNodes} of mutations) {
    for (const n of addedNodes) {
      if (n.tagName) {
        if (n.matches(DEL_SELECTOR)  ) {
          stopped = true;
          mo.disconnect();
          n.remove();   //n.remove();
         //n.remove();
        } else if (n.firstElementChild && n.querySelector(DEL_SELECTOR)) {
          stopped = true;
          mo.disconnect();
          for (const el of n.querySelectorAll(DEL_SELECTOR)) el.remove();
        }
      }
    }
  }
  if (stopped) observe();
}

function observe() {
  mo.observe(document, {
    subtree: true,
    childList: true,
  });
}

 ''';
  static const String rmBtn =
      r'''document.querySelector('button[wire\\:click="nextStep(1)"]').remove()''';

  static const String addEventListenerAndRedirect =
      '''document.querySelector("div > button").addEventListener("click",() => 
                { 
 window.flutter_inappwebview.callHandler('Test');
                })''';
  static const String onClickHandler = r'''
 ''';
  static const String jsUnhideShow = r'''
document.body.style.display = 'none';

// Show the page after 3 seconds
setTimeout(function() {
    document.body.style.display = 'block';

}, 3000); 
''';
}

String changeRestoInWebViewHandler(int maxL, String restoName) {
  return '''
                for(i = 0; i < $maxL ; i++)
                {
                    if(document.querySelectorAll("div > a#menu-item-0 > span")[i].innerHTML == 
                    '${restoName.substring(0, restoName.length - 1)}' )
                    {
                      document.querySelectorAll("div > a#menu-item-0")[i].click()
                    }
                }
      ''';
}

String loginFromHeadlessWebView(String email, String password) {
  return '''
              console.log('praise the miaw miaw');
              document.querySelector("#user-email").value = $email;
              document.querySelector("#user-password").value = $password;
                            console.log(document.querySelector("#user-email").value);
                            console.log(document.querySelector("#user-password").value);

              document.querySelector("button").click();

          ''';
}

//     window.flutter_inappwebview.callHandler('test', ['$email','$password']);
/* cookieManager.setCookie(
      url: WebUri(WebViewUrls.home),
      name: 'tresto_session',
      value: token,
      isSecure: true);  */
Future<void> headlessView(int maxL, String restoName) async {
  var myStorage = const FlutterSecureStorage();
  CookieManager cookieManager = CookieManager.instance();

  final headlessWebView = HeadlessInAppWebView(
    initialUrlRequest: URLRequest(url: WebUri(WebViewUrls.home)),
    onLoadStop: (controller, url) async {
      String temp2 = await myStorage.read(key: 'tresto_session') ?? '';
      await cookieManager.setCookie(
          url: WebUri(WebViewUrls.home), name: 'tresto_session', value: temp2);
      controller.evaluateJavascript(
          source: changeRestoInWebViewHandler(maxL, restoName));
      controller.evaluateJavascript(source: JsInjection.rmNavBar);
    },
  );
  await headlessWebView.run();
  //await headlessWebView.dispose();
}

Future<void> headlessViewForLogin(String email, String password) async {
  const myStorage = FlutterSecureStorage();
  /* final myCookie = await cookieManager.getCookie(
          url: WebUri(WebViewUrls.home), name: 'tresto_session'); */
  CookieManager cookieManager = CookieManager.instance();

  final headlessWebView = HeadlessInAppWebView(
    initialUrlRequest: URLRequest(url: WebUri(WebViewUrls.login)),
    onWebViewCreated: (controller)  async {
       
      /* controller.addJavaScriptHandler(
          handlerName: 'test',
          callback: ((args) {
            print('miawldskdbhsdnksdmnsdjs');
            print(args.first);
          })); */
    },
    onLoadStop: (controller, url) async {
      String temp = await myStorage.read(key: 'tresto_session') ?? '';
      if (temp.isEmpty || temp == '') {
        await controller.evaluateJavascript(source: loginFromHeadlessWebView(email,password));
        await Future.delayed(const Duration(milliseconds: 300));
        var trestoHiddenCookie = await cookieManager.getCookie(
            url: WebUri(WebViewUrls.home), name: 'tresto_session');
        await myStorage.write(
            key: 'tresto_session', value: trestoHiddenCookie?.value);
        print('Old Value');
        print(temp);
        print(trestoHiddenCookie);
        
      } else {
        String temp2 = await myStorage.read(key: 'tresto_session') ?? '';
        await cookieManager.setCookie(
            url: WebUri(WebViewUrls.home),
            name: 'tresto_session',
            value: temp2);
        print('NewValue');
        print(temp2);
      }
    },
  );
  await headlessWebView.run();
  //await headlessWebView.dispose();
}
