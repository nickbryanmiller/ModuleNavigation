//
//  NMIntentHandlerGoToProfilePage.swift
//  IntentHandlerModule
//
//  Created by Nicholas Miller on 2/28/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation
import IntentModule
import ProfileModule

internal class NMIntentHandlerGoToProfilePage: NMIntentHandler {
	
	func canHandle(_ intent: NMIntent) -> Bool {
		return intent is NMIntentGoToProfilePage
	}
	
	func handle(
		_ intent: NMIntent,
		intentHandler: NMIntentHandlerSystem,
		presentingViewController: UIViewController)
	{
		guard intent is NMIntentGoToProfilePage else { return }
		
		let vc = ProfileViewController(intentHandler: intentHandler)
		intentHandler.navigate(from: presentingViewController, to: vc)
	}
	
}
