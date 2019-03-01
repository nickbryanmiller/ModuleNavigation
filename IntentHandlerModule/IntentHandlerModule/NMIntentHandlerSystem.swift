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
	
	// MARK: - Lifecycle
	
	public init() {
		registerAllIntentHandlers()
	}
	
	// MARK: - Public
	
	public func handle(
		_ intent: NMIntent,
		presentingViewController: UIViewController?)
	{
		guard
			let handler = intentHandlers.first(where: { $0.canHandle(intent) })
			else { fatalError("no capable handler") }
		
		handler.handle(
			intent,
			intentHandler: self,
			presentingViewController: presentingViewController)
	}
	
	// MARK: - Private
	
	private var intentHandlers = [NMIntentHandler]()
	
	private func registerAllIntentHandlers() {
		register(NMIntentHandlerGoToAnimalPage())
	}
	
	private func register(_ intentHandler: NMIntentHandler) {
		intentHandlers.append(intentHandler)
	}
}
