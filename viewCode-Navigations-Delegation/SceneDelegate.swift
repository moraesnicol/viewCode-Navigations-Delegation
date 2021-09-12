//
//  SceneDelegate.swift
//  viewCode-Navigations-Delegation
//
//  Created by Gabriel on 09/09/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let controller = ViewController()
        let safeWindow = UIWindow(windowScene: windowScene)
        safeWindow.frame = UIScreen.main.bounds
        safeWindow.rootViewController = UINavigationController(rootViewController: controller)
        safeWindow.makeKeyAndVisible()
        window = safeWindow
    }
    
    
    
}

