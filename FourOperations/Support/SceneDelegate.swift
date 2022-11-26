//
//  SceneDelegate.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 10/29/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let darkModeOn = UserDefaultKey.defaults.bool(forKey: UserDefaultKey.changeModeOn)

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = FOTabBarVC()
        
        if darkModeOn {
            window?.overrideUserInterfaceStyle = .dark

        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

