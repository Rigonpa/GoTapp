//
//  SceneDelegate.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let episodeViewController = EpisodeViewController()
        let castViewController = CastViewController()
        let favoriteEpisodeViewController = FavoriteEpisodeViewController()
        let houseViewController = HouseViewController()
        let settingsViewController = SettingsViewController()
        
        let navigationEpisodeViewController = UINavigationController(rootViewController: episodeViewController)
        let navigationCastViewController = UINavigationController(rootViewController: castViewController)
        let navigationFavoriteEpisodeViewController = UINavigationController(rootViewController: favoriteEpisodeViewController)
        let navigationHouseViewController = UINavigationController(rootViewController: houseViewController)
        let navigationSettingsViewController = UINavigationController(rootViewController: settingsViewController)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationEpisodeViewController, navigationCastViewController, navigationFavoriteEpisodeViewController, navigationHouseViewController, navigationSettingsViewController]
        
        navigationEpisodeViewController.tabBarItem = UITabBarItem(title: "Seasons", image: UIImage(systemName: "film.fill"), tag: 0)
        navigationCastViewController.tabBarItem = UITabBarItem(title: "Cast", image: UIImage(systemName: "person.3.fill"), tag: 1)
        navigationFavoriteEpisodeViewController.tabBarItem = UITabBarItem(title: "Fav", image: UIImage(systemName: "heart.fill"), tag: 2)
        navigationHouseViewController.tabBarItem = UITabBarItem(title: "Houses", image: UIImage(systemName: "shield.lefthalf.fill"), tag: 3)
        navigationSettingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        tabBarController.tabBar.barStyle = .black
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.tintColor = UIColor(red: 235/255, green: 172/255, blue: 38/255, alpha: 1.0)
        
        UINavigationBar.appearance().overrideUserInterfaceStyle = .dark
        UINavigationBar.appearance().tintColor = UIColor(red: 235/255, green: 172/255, blue: 38/255, alpha: 1.0)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

