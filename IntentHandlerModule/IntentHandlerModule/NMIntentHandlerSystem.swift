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
	
	public init(navigationHelperForViewControllers: @escaping GetNavigationHelperMethod) {
		self.navigationHelperForViewControllers = navigationHelperForViewControllers
		registerAllIntentHandlers()
	}
	
	// MARK: - Public
	
	public let navigationHelperForViewControllers: GetNavigationHelperMethod
	public typealias GetNavigationHelperMethod
		= ((_ oldViewController: UIViewController, _ newViewController: UIViewController) -> NavigationHelperProtocol)
	
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
			presentingViewController: presentingViewController)
	}
	
	public func navigate(
		from oldViewController: UIViewController,
		to newViewController: UIViewController)
	{
		let navigationHelper = navigationHelperForViewControllers(oldViewController, newViewController)
		navigationHelper.navigate()
	}
	
	// MARK: - Private
	
	private var intentHandlers = [NMIntentHandler]()
	
	private func registerAllIntentHandlers() {
		register(NMIntentHandlerGoToAnimalPage())
		register(NMIntentHandlerGoToProfilePage())
	}
	
	private func register(_ intentHandler: NMIntentHandler) {
		intentHandlers.append(intentHandler)
	}
}
