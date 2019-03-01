//
//  NMIntentHandlerProtocol.swift
//  IntentModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation

public protocol NMIntentHandlerSystemProtocol {
	func handle(
		_ intent: NMIntent,
		presentingViewController: UIViewController?)
}
