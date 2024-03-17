import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  static const String rmNavBarNoFlicker = r'''

const DEL_SELECTOR = 'nav';
const mo = new MutationObserver(onMutation);
onMutation([{addedNodes: [document.documentElement]}]);
observe();
function onMutation(mutations) {
  let stopped;
  for (const {addedNodes} of mutations) {
    for (const n of addedNodes) {
      if (n.tagName) {
        if (n.matches(DEL_SELECTOR)) {
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
              window.location.reload();
              document.querySelector("button").addEventListener('click',() => {
             document.querySelector("#user-email").value = '$email';
             document.querySelector("#user-password").value = '$password';
              });
              document.querySelector("button").click();

          ''';
}

//     window.flutter_inappwebview.callHandler('test', ['$email','$password']);
Future<void> headlessView(int maxL, String restoName) async {
  /* CookieManager cookieManager = CookieManager.instance();
  cookieManager.setCookie(
      url: WebUri(WebViewUrls.home),
      name: 'tresto_session',
      value: token,
      isSecure: true); */
  final headlessWebView = HeadlessInAppWebView(
    initialUrlRequest: URLRequest(url: WebUri(WebViewUrls.home)),
    onLoadStop: (controller, url) {
      controller.evaluateJavascript(
          source: changeRestoInWebViewHandler(maxL, restoName));
      controller.evaluateJavascript(source: JsInjection.rmNavBar);
    },
  );
  await headlessWebView.run();
  //await headlessWebView.dispose();
}

Future<void> headlessViewForLogin(String email, String password) async {
  /* final myCookie = await cookieManager.getCookie(
          url: WebUri(WebViewUrls.home), name: 'tresto_session'); */
  CookieManager cookieManager = CookieManager.instance();

  final headlessWebView = HeadlessInAppWebView(
    initialUrlRequest: URLRequest(url: WebUri(WebViewUrls.login)),
    onWebViewCreated: (controller) {
      /* controller.addJavaScriptHandler(
          handlerName: 'test',
          callback: ((args) {
            print('miawldskdbhsdnksdmnsdjs');
            print(args.first);
          })); */
    },
    onLoadStop: (controller, url) {
      cookieManager.deleteAllCookies();
      controller.evaluateJavascript(
          source: loginFromHeadlessWebView(email, password));
    },
  );
  await headlessWebView.run();
  //await headlessWebView.dispose();
}
