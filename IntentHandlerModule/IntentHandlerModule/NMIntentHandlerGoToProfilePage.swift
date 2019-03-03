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
import NavigationModule

internal class NMIntentHandlerGoToProfilePage: NMIntentHandler {
	
	func canHandle(_ intent: NMIntent) -> Bool {
		return intent is NMIntentGoToProfilePage
	}
	
	func handle(
		_ intent: NMIntent,
		intentHandler: NMIntentHandlerSystemProtocol,
		navigationHelperBuilder: NavigationHelperBuilderProtocol,
		presentingViewController: UIViewController)
	{
		guard intent is NMIntentGoToProfilePage else { return }
		
		let vc = ProfileViewController(intentHandler: intentHandler)
		let navigationHelper = navigationHelperBuilder.build(
			presentingViewController: presentingViewController,
			destinationViewController: vc)
		navigationHelper.navigate()
	}
	
}
