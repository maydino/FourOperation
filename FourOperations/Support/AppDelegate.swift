//
//  AppDelegate.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 10/29/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = FOColors.textColor
        navigationBarAppearance.barTintColor = FOColors.textColor
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:FOColors.textColor]
        navigationBarAppearance.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        
        let titleTextAttributes = [ NSAttributedString.Key.foregroundColor: FOColors.textColorH, NSAttributedString.Key.font: UIFont(name: FOFont.textFontNormal, size: 25)!]
    
        UINavigationBar.appearance().titleTextAttributes = titleTextAttributes as [NSAttributedString.Key : Any]
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }


}

