//
//  AppDelegate.swift
//  NoteApp
//
//  Created by Ali Jafarov on 23.07.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.backgroundColor = .systemBackground
            let navigationController = UINavigationController(rootViewController: NotesViewController())
            window?.rootViewController = navigationController
        
            return true
        }
        

}

