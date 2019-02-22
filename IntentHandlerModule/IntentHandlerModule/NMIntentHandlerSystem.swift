//
//  NMIntentHandlerSystem.swift
//  IntentHandlerModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation
import IntentModule

public class NMIntentHandlerSystem: NMIntentHandlerSystemProtocol {
	
	public init() {}
	
	// I like the idea od making this static method references or something that isnt
	// instantiating them all because they do not need to be instatiated
	private var intentHandlers: [NMIntentHandler] = [
		NMIntentHandlerGoToAnimalPage()
	]
	
	public func handle(_ intent: NMIntent) {
		guard let handler = capableHandler(intent) else {
			print("no capable handler")
			return
		}
		handler.handle(intent)
	}
	
	private func capableHandler(_ intent: NMIntent) -> NMIntentHandler? {
		for handler in intentHandlers {
			if handler.canHandle(intent) { return handler }
		}
		return nil
	}
}
