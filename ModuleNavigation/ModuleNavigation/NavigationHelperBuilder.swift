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
	
	private weak var tabBarController: NMTabBarController? = nil
	
	public init(tabBarController: NMTabBarController) {
		self.tabBarController = tabBarController
	}
	
	public func build(
		presentingViewController: UINavigationController,
		destinationViwController: UIViewController) -> NavigationHelperProtocol
	{
		// check tab switch
		if
			let tabBarController = tabBarController,
			let desiredTab = TabType(from: destinationViwController),
			desiredTab.rawValue != tabBarController.selectedIndex
		{
			return NavigationHelper(
				tabBarController: tabBarController,
				desiredIndex: desiredTab.rawValue)
		}
		
		// return push
		return NavigationHelper(
			navigationController: presentingViewController,
			newViewController: destinationViwController)
	}
}
