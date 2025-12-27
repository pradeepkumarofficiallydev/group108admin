import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';


class WebViewScreen extends StatefulWidget {

   WebViewScreen({super.key  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (webViewController != null) {
            bool canGoBack = await webViewController!.canGoBack();
            if (canGoBack) {
              webViewController!.goBack();
              return false; // prevent exiting the screen
            }
          }
          return true; // exit the screen if no back history
        },




        child: InAppWebView(
          initialSettings: InAppWebViewSettings(
            javaScriptEnabled: true,
            javaScriptCanOpenWindowsAutomatically: true,
            domStorageEnabled: true,
            mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
            loadsImagesAutomatically: true,
            blockNetworkImage: false,
            allowsInlineMediaPlayback: true,
            mediaPlaybackRequiresUserGesture: false,
            useWideViewPort: true,
            // allowFileAccessFromFileURLs: true,
            // allowUniversalAccessFromFileURLs: true,


          ),


          onPermissionRequest: (controller, permissionRequest) async {
            return PermissionResponse(
                resources: permissionRequest.resources,
                action: PermissionResponseAction.GRANT
            );
          },



          initialUrlRequest: URLRequest(
            url: WebUri('https://webapp.grandthum.com/group108/guest-visitor-registration'),
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final uri = navigationAction.request.url;
            final url = uri.toString();

            if (url.startsWith("whatsapp://") ||
                url.startsWith("https://wa.me/") ||
                url.startsWith("https://api.whatsapp.com/")) {

              try {


                final bool canLaunchApp = await canLaunchUrl(uri!);
                if (canLaunchApp) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  showWhatsAppNotInstalledDialog(context);
                }
              } catch (e) {
                showWhatsAppNotInstalledDialog(context);
              }
              return NavigationActionPolicy.CANCEL;
            }

            return NavigationActionPolicy.ALLOW;
          },
        ),
      ),
    );
  }

  void showWhatsAppNotInstalledDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange),
            SizedBox(width: 10),
            Text("WhatsApp Not Installed"),
          ],
        ),
        content: const Text(
            "WhatsApp is not installed on this device. Would you like to install it from the Play Store?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Install"),
            onPressed: () {
              Navigator.pop(context);
              redirectToWhatsAppStore();
            },
          ),
        ],
      ),
    );
  }



  void redirectToWhatsAppStore() async {
    final Uri playStoreUrl = Uri.parse(
        "https://play.google.com/store/apps/details?id=com.whatsapp");
    if (await canLaunchUrl(playStoreUrl)) {
      await launchUrl(playStoreUrl, mode: LaunchMode.externalApplication);
    }
  }



  @override
  void deactivate() {
    super.deactivate();

    webViewController!.dispose();


  }




}

