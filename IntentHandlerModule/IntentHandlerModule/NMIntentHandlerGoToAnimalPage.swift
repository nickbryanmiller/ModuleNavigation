//
//  NMIntentHandlerGoToAnimalPage.swift
//  IntentHandlerModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation
import IntentModule
import AnimalModule // I can do this because this class sits above and can depend on whatever

internal class NMIntentHandlerGoToAnimalPage: NMIntentHandler {
	
	func canHandle(_ intent: NMIntent) -> Bool {
		return intent is NMIntentGoToAnimalPage
	}
	
	func handle(
		_ intent: NMIntent,
		intentHandler: NMIntentHandlerSystemProtocol,
		presentingViewController: UIViewController?)
	{
		guard intent is NMIntentGoToAnimalPage else { return }
		
		let animalVC = AnimalViewController(intentHandler: intentHandler)
		// do any other additional set up with the objects in the intent and the new vc
		presentingViewController?.navigationController?.pushViewController(animalVC, animated: true)
	}
	
}
