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
	
	enum TabType: Int {
		case explore = 0
		case profile
		
		init?(from viewController: UIViewController) {
			if viewController is ExploreViewController { self = .explore }
			else if viewController is ProfileViewController { self = .profile }
			else { return nil }
		}
	}

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		
		let window = UIWindow(frame: UIScreen.main.bounds)
		let tabBarController = UITabBarController(nibName: nil, bundle: nil)
		
		let intentHandler = NMIntentHandlerSystem(
			navigationHelperForViewControllers: { (oldVC, newVC) -> NavigationHelperProtocol in
				// check tab switch
				if
					let desiredTab = TabType(from: newVC),
					desiredTab.rawValue != tabBarController.selectedIndex
				{
					return NavigationHelper(
						tabBarController: tabBarController,
						desiredIndex: desiredTab.rawValue)
				}
				
				// return push
				guard let navVC = oldVC.navigationController else { fatalError() }
				return NavigationHelper(navigationController: navVC, newViewController: newVC)
				
			})
		
		let rootVC1 = ExploreViewController(intentHandler: intentHandler)
		rootVC1.tabBarItem = UITabBarItem(
			title: rootVC1.title,
			image: nil,
			tag: TabType.explore.rawValue)
		
		let rootVC2 = ProfileViewController(intentHandler: intentHandler)
		rootVC2.tabBarItem = UITabBarItem(
			title: rootVC2.title,
			image: nil,
			tag: TabType.profile.rawValue)
		
		let controllers = [rootVC1, rootVC2]
		tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
		
		window.rootViewController = tabBarController
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

