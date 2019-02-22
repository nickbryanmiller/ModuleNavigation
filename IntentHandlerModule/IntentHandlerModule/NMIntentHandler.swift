//
//  NMIntentHandler.swift
//  IntentHandlerModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import IntentModule

public protocol NMIntentHandler {
	func canHandle(_ intent: NMIntent) -> Bool
	func handle(_ intent: NMIntent)
}
