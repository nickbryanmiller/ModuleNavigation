//
//  NavigationHelperBuilder.swift
//  ModuleNavigation
//
//  Created by Nicholas Miller on 3/2/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation
import NavigationModule

final public class NavigationHelperBuilder: NavigationHelperBuilderProtocol {
	
	private weak var tabBarController: UITabBarController? = nil
	
	public init(tabBarController: UITabBarController) {
		self.tabBarController = tabBarController
	}
	
	public func build(
		presentingViewController: UIViewController,
		destinationViewController: UIViewController) -> NavigationHelperProtocol
	{
		// check tab switch
		if
			let tabBarController = tabBarController,
			let desiredTab = TabType(from: destinationViewController),
			desiredTab.rawValue != tabBarController.selectedIndex
		{
			return NavigationHelper(
				tabBarController: tabBarController,
				desiredIndex: desiredTab.rawValue)
		}
		
		// return push
		if let navController = presentingViewController as? UINavigationController {
			return NavigationHelper(
				navigationController: navController,
				newViewController: destinationViewController)
		} else if let navController = presentingViewController.navigationController {
			return NavigationHelper(
				navigationController: navController,
				newViewController: destinationViewController)
		} else {
			fatalError("no navigation controller to perform push")
		}
	}
}
