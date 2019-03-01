//
//  NMIntentGoToAnimalPage.swift
//  IntentModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import Foundation
import UIKit

// could also be a struct maybe but then i dont think could be passed as an NMIntent
public class NMIntentGoToAnimalPage: NMIntent {
	public let name: String
	public let age: Int
	
	public init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
}
