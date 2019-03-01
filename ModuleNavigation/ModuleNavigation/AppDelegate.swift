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
import NavigationModule

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		
		let window = UIWindow(frame: UIScreen.main.bounds)
		let tabBarController = UITabBarController(nibName: nil, bundle: nil)
		
		let intentHandler = NMIntentHandlerSystem(
			navigationHelperForViewControllers: { [weak self] (oldVC, newVC) -> NavigationHelperProtocol in
				// check tab switch
				if let newTab = self?.shouldSwitchTabs(oldVC: oldVC, newVC: newVC, tabBarController: tabBarController) {
					return NavigationHelper(tabBarController: tabBarController, desiredIndex: newTab)
				}
				
				guard let navVC = oldVC.navigationController else { fatalError() }
				return NavigationHelper(navigationController: navVC, newViewController: newVC)
				
			})
		
		let rootVC1 = ExploreViewController(intentHandler: intentHandler)
		rootVC1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
		
		let rootVC2 = ProfileViewController(intentHandler: intentHandler)
		rootVC2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
		
		let controllers = [rootVC1, rootVC2]
		tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
		
		window.rootViewController = tabBarController
		window.makeKeyAndVisible()
		self.window = window
		
		return true
	}
	
	func shouldSwitchTabs(
		oldVC: UIViewController,
		newVC: UIViewController,
		tabBarController: UITabBarController) -> Int?
	{
		guard
			let navController = tabBarController.selectedViewController as? UINavigationController,
			let currentRootVC = navController.viewControllers.first,
			let rootViewControllers = tabBarController.viewControllers
			else { return nil }
		
		for (offset, rootVC) in rootViewControllers.enumerated() {
			if
				let rootNavVC = rootVC as? UINavigationController,
				let rootVC = rootNavVC.viewControllers.first,
				!areSiblings(rootVC, currentRootVC) && areSiblings(newVC, rootVC)
			{
				return offset
			}
		}
		
		return nil
	}
	
	func areSiblings(_ class1: AnyObject, _ class2: AnyObject) -> Bool {
		return object_getClassName(class1) == object_getClassName(class2)
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

