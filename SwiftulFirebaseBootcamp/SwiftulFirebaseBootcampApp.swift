//
//  SwiftulFirebaseBootcampApp.swift
//  SwiftulFirebaseBootcamp
//
//  Created by Vinicius on 6/20/25.
//

import SwiftUI
import Firebase

@main
struct SwiftulFirebaseBootcampApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                RootView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    print("firebase configured")

       
    return true
  }
}
