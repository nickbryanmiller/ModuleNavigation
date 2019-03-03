//
//  NavigationHelper.swift
//  NavigationModule
//
//  Created by Nicholas Miller on 2/28/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation

public enum NavigationType {
	case push
	case tabSwitch
	case deepLink
}

public protocol NavigationHelperProtocol {
	func navigate()
}

final public class NavigationHelper: NavigationHelperProtocol {
	
	private var navigationType: NavigationType
	private weak var navigationController: UINavigationController? = nil
	private weak var newViewController: UIViewController? = nil
	private weak var tabBarController: UITabBarController? = nil
	private var desiredIndex: Int? = nil
	
	public init(
		navigationController: UINavigationController,
		newViewController: UIViewController)
	{
		self.navigationType = .push
		self.navigationController = navigationController
		self.newViewController = newViewController
	}
	
	public init(
		tabBarController: UITabBarController,
		desiredIndex: Int)
	{
		self.navigationType = .tabSwitch
		self.tabBarController = tabBarController
		self.desiredIndex = desiredIndex
	}
	
	public func navigate() {
		switch navigationType {
		case .push: navigateByPush()
		case .tabSwitch: navigateByTabSwitch()
		case .deepLink: break
		}
	}
	
	private func navigateByPush() {
		guard
			let navigationController = navigationController,
			let newViewController = newViewController
			else { return }
		navigationController.pushViewController(newViewController, animated: true)
	}
	
	private func navigateByTabSwitch() {
		guard
			let tabBarController = tabBarController,
			let desiredIndex = desiredIndex
			else { return }
		tabBarController.selectedIndex = desiredIndex
	}
	
}
