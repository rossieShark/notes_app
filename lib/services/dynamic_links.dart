// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

// class ShareService {
//   Future<Uri> buildLink() async {
//     final dynamicLinkParams = DynamicLinkParameters(
//       link: Uri.parse("http://todoapp122.page.link"),
//       uriPrefix: "http://todoapp122.page.link",
//       androidParameters:
//           const AndroidParameters(packageName: "com.example.to_do_app"),
//       iosParameters: const IOSParameters(bundleId: "page.todoapp122.app"),
//     );

//     try {
//       final dynamicLink =
//           await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

//       if (dynamicLink != null) {
//         return dynamicLink;
//       } else {
//         // Handle the case where dynamicLink is null (e.g., log an error, return a default link, etc.)
//         return Uri.parse("http://defaultlink.com");
//       }
//     } catch (e) {
//       // Handle any exceptions that may occur during dynamic link generation
//       print("Error generating dynamic link: $e");
//       return Uri.parse("http://defaultlink.com");
//     }
//   }

//   Future<Uri> buildShortLink() async {
//     final dynamicLinkParams = DynamicLinkParameters(
//       link: Uri.parse("http://todoapp122.page.link"),
//       uriPrefix: "http://todoapp122.page.link",
//       androidParameters:
//           const AndroidParameters(packageName: "com.example.to_do_app"),
//       iosParameters: const IOSParameters(bundleId: "page.todoapp122.app"),
//     );
//     final dynamicLink =
//         await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
//     final Uri shortUrl = dynamicLink.shortUrl;
//     return shortUrl;
//   }
// }
