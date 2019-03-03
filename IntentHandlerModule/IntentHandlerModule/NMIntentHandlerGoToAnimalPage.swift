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
		intentHandler: NMIntentHandlerSystem,
		navigationHelperBuilder: NavigationHelperBuilderProtocol,
		presentingViewController: UIViewController)
	{
		guard
			intent is NMIntentGoToAnimalPage,
			let navigationController = presentingViewController.navigationController
			else { return }
		
		let animalVC = AnimalViewController(intentHandler: intentHandler)
		
		let navigationHelper = navigationHelperBuilder.build(
			presentingViewController: navigationController,
			destinationViewController: animalVC)
		navigationHelper.navigate()
	}
	
}
