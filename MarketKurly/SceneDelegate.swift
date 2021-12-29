//
//  SceneDelegate.swift
//  MarketKurly
//
//  Created by yc on 2021/12/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        
        let rootNavigationController = UINavigationController(rootViewController: TabBarController())
        rootNavigationController.navigationBar.tintColor = .white
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(named: "kurlyColor")
        rootNavigationController.navigationBar.standardAppearance = navigationBarAppearance
        rootNavigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
}

