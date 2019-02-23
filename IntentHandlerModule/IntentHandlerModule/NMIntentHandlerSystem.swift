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
	
	public func handle(_ intent: NMIntent) {
		guard let handleMethod = capableHandlerMethod(intent) else {
			print("no capable handler")
			return
		}
		handleMethod(intent)
	}
	
	private func capableHandlerMethod(_ intent: NMIntent) -> ((NMIntent) -> Void)? {
		if let handle = capableHandlerMethodInAnimalModule(intent) { return handle }
		return nil
	}
	
	private func capableHandlerMethodInAnimalModule(_ intent: NMIntent) -> ((NMIntent) -> Void)? {
		if NMIntentHandlerGoToAnimalPage.canHandle(intent) { return NMIntentHandlerGoToAnimalPage.handle }
		return nil
	}
}
