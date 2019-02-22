//
//  NMIntentHandler.swift
//  IntentHandlerModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation
import IntentModule

internal protocol NMIntentHandler: NMIntentHandlerSystemProtocol {
	func canHandle(_ intent: NMIntent) -> Bool
}
