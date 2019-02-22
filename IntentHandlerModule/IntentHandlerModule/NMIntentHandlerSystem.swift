//
//  NMIntentHandlerSystem.swift
//  IntentHandlerModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import IntentModule

public class NMIntentHandlerSystem: NMIntentHandlerSystemProtocol {
	
	public init() {}
	
	private var intentHandlers: [NMIntentHandler] = [
	]
	
	public func handle(intent: NMIntent) {
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
