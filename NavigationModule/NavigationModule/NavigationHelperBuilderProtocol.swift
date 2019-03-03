//
//  NavigationHelperBuilderProtocol.swift
//  NavigationModule
//
//  Created by Nicholas Miller on 3/2/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation

public protocol NavigationHelperBuilderProtocol {
	
	func build(
		presentingViewController: UINavigationController,
		destinationViewController: UIViewController) -> NavigationHelperProtocol
	
}
