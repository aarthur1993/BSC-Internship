//
//  AppDelegate.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 31.03.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(
        _ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            let window = UIWindow(frame: UIScreen.main.bounds)
            self.window = window
            self.window?.rootViewController = UINavigationController(rootViewController: NoteViewController())
            self.window?.makeKeyAndVisible()
        return true
    }
}
