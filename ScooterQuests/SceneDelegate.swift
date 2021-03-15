//
//  SceneDelegate.swift
//  ScooterQuests
//
//  Created by Olka on 08.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
      
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = TabBarController() // Your initial view controller.
        window.makeKeyAndVisible()
        self.window = window
    }
}

