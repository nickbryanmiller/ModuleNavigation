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

	func handle(_ intent: NMIntent) {
		guard let intent = intent as? NMIntentGoToAnimalPage else { return }
		
		// would definitely make a way to not have to create a new system intent handler
		let animalVC = AnimalViewController(intentHandler: NMIntentHandlerSystem())
		// do any other additional set up with the objects in the intent and the new vc
		intent.caller.navigationController?.pushViewController(animalVC, animated: true)
	}

}
