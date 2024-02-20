import UIKit
import Flutter
//import flutter_downloader
import FirebaseCore
import flutter_local_notifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      GeneratedPluginRegistrant.register(with: self)
//         FlutterDownloaderPlugin.setPluginRegistrantCallback(registerPlugins)
         FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
             GeneratedPluginRegistrant.register(with: registry)}
           if #available(iOS 10.0, *) {
                   UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
                 }

//    FlutterDownloaderPlugin.setPluginRegistrantCallback(registerPlugins)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

//private func registerPlugins(registry: FlutterPluginRegistry) {
//    if (!registry.hasPlugin("FlutterDownloaderPlugin")) {
//        FlutterDownloaderPlugin.register(with: registry.registrar(forPlugin: "FlutterDownloaderPlugin")!)
//    }
//}
