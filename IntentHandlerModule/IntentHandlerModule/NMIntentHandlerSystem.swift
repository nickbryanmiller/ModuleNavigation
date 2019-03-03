//
//  NMIntentHandlerSystem.swift
//  IntentHandlerModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation
import IntentModule
import NavigationModule

public class NMIntentHandlerSystem: NMIntentHandlerSystemProtocol {
	
	// MARK: - Lifecycle
	
	public init(navigationHelperBuilder: NavigationHelperBuilderProtocol) {
		self.navigationHelperBuilder = navigationHelperBuilder
		registerAllIntentHandlers()
	}
	
	// MARK: - Public
	
	public func handle(
		_ intent: NMIntent,
		presentingViewController: UIViewController?)
	{
		guard
			let handler = intentHandlers.first(where: { $0.canHandle(intent) }),
			let presentingViewController = presentingViewController
			else { fatalError("no capable handler") }
		
		handler.handle(
			intent,
			intentHandler: self,
			navigationHelperBuilder: navigationHelperBuilder,
			presentingViewController: presentingViewController)
	}
	
	// MARK: - Private
	
	private var intentHandlers = [NMIntentHandler]()
	private let navigationHelperBuilder: NavigationHelperBuilderProtocol
	
	private func registerAllIntentHandlers() {
		register(NMIntentHandlerGoToAnimalPage())
		register(NMIntentHandlerGoToProfilePage())
	}
	
	private func register(_ intentHandler: NMIntentHandler) {
		intentHandlers.append(intentHandler)
	}
}
