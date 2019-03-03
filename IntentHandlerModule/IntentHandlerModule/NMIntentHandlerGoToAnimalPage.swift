//
//  NMIntentHandlerGoToAnimalPage.swift
//  IntentHandlerModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation
import IntentModule
import AnimalModule
import NavigationModule

internal class NMIntentHandlerGoToAnimalPage: NMIntentHandler {
	
	func canHandle(_ intent: NMIntent) -> Bool {
		return intent is NMIntentGoToAnimalPage
	}
	
	func handle(
		_ intent: NMIntent,
		intentHandler: NMIntentHandlerSystemProtocol,
		navigationHelperBuilder: NavigationHelperBuilderProtocol,
		presentingViewController: UIViewController)
	{
		guard intent is NMIntentGoToAnimalPage else { return }
		
		let animalVC = AnimalViewController(intentHandler: intentHandler)
		
		let navigationHelper = navigationHelperBuilder.build(
			presentingViewController: presentingViewController,
			destinationViewController: animalVC)
		navigationHelper.navigate()
	}
	
}
