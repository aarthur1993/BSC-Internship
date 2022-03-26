//
//  AppDelegate.swift
//  CleanSwiftForЧайники

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        rootChangeVC()

        return true
    }
}
    
extension AppDelegate {
    public func rootChangeVC()  {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.window?.rootViewController = UINavigationController(rootViewController: NoteViewController())
        self.window?.makeKeyAndVisible()
    }
}







