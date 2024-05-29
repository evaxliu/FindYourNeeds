import UIKit
import Flutter
import GoogleMaps // Import Google Maps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Provide your Google Maps API Key here
    GMSServices.provideAPIKey("AIzaSyDVPQItkoHr5F5vQ4icFViJCKWvOZjTdgg")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
