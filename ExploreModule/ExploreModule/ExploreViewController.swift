//
//  ViewController.swift
//  ModuleNavigation
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import UIKit
import IntentModule

public class ExploreViewController: UIViewController {
	
	let intentHandler: NMIntentHandlerSystemProtocol
	
	public init(intentHandler: NMIntentHandlerSystemProtocol) {
		self.intentHandler = intentHandler
		super.init(nibName: nil, bundle: nil)
		title = "Explore"
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override public func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
		
		let buttonAnimal = UIButton(frame: CGRect(x: 50, y: 100, width: 300, height: 100))
		buttonAnimal.setTitle("to animal module", for: .normal)
		buttonAnimal.setTitleColor(.white, for: .normal)
		buttonAnimal.backgroundColor = .black
		buttonAnimal.addTarget(self, action: #selector(didTapButtonAnimal), for: .touchUpInside)
		view.addSubview(buttonAnimal)
		
		let buttonProfile = UIButton(frame: CGRect(x: 50, y: 300, width: 300, height: 100))
		buttonProfile.setTitle("to profile module", for: .normal)
		buttonProfile.setTitleColor(.white, for: .normal)
		buttonProfile.backgroundColor = .black
		buttonProfile.addTarget(self, action: #selector(didTapButtonProfile), for: .touchUpInside)
		view.addSubview(buttonProfile)
	}
	
	@objc private func didTapButtonAnimal() {
		let intent = NMIntentGoToAnimalPage(name: "Test", age: 12)
		intentHandler.handle(intent, presentingViewController: self)
	}
	
	@objc private func didTapButtonProfile() {
		let intent = NMIntentGoToProfilePage(name: "Test", age: 12)
		intentHandler.handle(intent, presentingViewController: self)
	}

}

