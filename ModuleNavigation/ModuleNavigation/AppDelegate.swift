//
//  AppDelegate.swift
//  ModuleNavigation
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import UIKit
import IntentHandlerModule
import ExploreModule
import ProfileModule

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		
		let window = UIWindow(frame: UIScreen.main.bounds)
		
		let intentHandler = NMIntentHandlerSystem()
		
		let rootVC1 = ExploreViewController(intentHandler: intentHandler)
		rootVC1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
		
		let rootVC2 = ProfileViewController(intentHandler: intentHandler)
		rootVC2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
		
		let tabController = UITabBarController(nibName: nil, bundle: nil)
		let controllers = [rootVC1, rootVC2]
		tabController.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
		
//		let rootNavController = UINavigationController(rootViewController: tabController)
//		window.rootViewController = rootNavController
		window.rootViewController = tabController
		window.makeKeyAndVisible()
		self.window = window
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

