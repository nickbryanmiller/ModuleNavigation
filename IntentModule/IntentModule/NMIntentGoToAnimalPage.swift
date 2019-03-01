//
//  NMIntentGoToAnimalPage.swift
//  IntentModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation

public class NMIntentGoToAnimalPage: NMIntent {
	public let name: String
	public let age: Int
	
	public init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
}
