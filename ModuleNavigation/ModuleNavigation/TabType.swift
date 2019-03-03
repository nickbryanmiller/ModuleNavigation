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
