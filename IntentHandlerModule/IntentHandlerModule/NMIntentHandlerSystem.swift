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
	
	private var intentHandlers = [NMIntentHandler]()
	
	public init() {
		registerAllIntentHandlers()
	}
	
	public func handle(
		_ intent: NMIntent,
		presentingViewController: UIViewController?)
	{
		guard let handler = capableHandlerMethod(intent) else { fatalError("no capable handler") }
		handler.handle(
			intent,
			intentHandler: self,
			presentingViewController: presentingViewController)
	}
	
	private func registerAllIntentHandlers() {
		register(NMIntentHandlerGoToAnimalPage())
	}
	
	private func register(_ intentHandler: NMIntentHandler) {
		intentHandlers.append(intentHandler)
	}
	
	private func capableHandlerMethod(_ intent: NMIntent) -> NMIntentHandler? {
		for handler in intentHandlers {
			if handler.canHandle(intent) { return handler }
		}
		return nil
	}
}
