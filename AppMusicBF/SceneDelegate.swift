//
//  SceneDelegate.swift
//  AppMusicBF
//
//  Created by Caio on 06/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.windowScene = windowScene
//        let VC = RootViewController()
//        self.window?.rootViewController = VC
//        self.window?.makeKeyAndVisible()
//    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        
        tabBarController.tabBar.backgroundColor = UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1)
        tabBarController.tabBar.tintColor = .white

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.windowScene = windowScene
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        

        let rootViewController = RootViewController()
        rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let libraryViewController = LibraryViewController()
        libraryViewController.view.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        libraryViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let viewController = UIViewController()
        rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let firstNavigationController = UINavigationController(rootViewController: rootViewController)
        let secondNavigationController = UINavigationController(rootViewController: libraryViewController)
        let thirdNavigationController = UINavigationController(rootViewController: viewController)
        
        tabBarController.viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.windowScene = windowScene
//        let VC = RootViewController()
//        self.window?.rootViewController = VC
//        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

