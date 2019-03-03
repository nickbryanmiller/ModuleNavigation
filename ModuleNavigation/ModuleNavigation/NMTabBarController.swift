//
//  NMTabBarController.swift
//  NavigationModule
//
//  Created by Nicholas Miller on 3/2/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation
import UIKit
import ExploreModule
import ProfileModule
import IntentModule

public enum TabType: Int {
	case explore = 0
	case profile
	
	init?(from viewController: UIViewController) {
		if viewController is ExploreViewController { self = .explore }
		else if viewController is ProfileViewController { self = .profile }
		else { return nil }
	}
}

public class NMTabBarController: UITabBarController {
	
	let intentHandler: NMIntentHandlerSystemProtocol
	
	public init(intentHandler: NMIntentHandlerSystemProtocol) {
		self.intentHandler = intentHandler
		super.init(nibName: nil, bundle: nil)
		
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
		viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
