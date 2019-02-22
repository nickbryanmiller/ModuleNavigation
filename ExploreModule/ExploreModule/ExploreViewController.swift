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
		
		let button = UIButton(frame: CGRect(x: 50, y: 100, width: 300, height: 100))
		button.setTitle("to animal module", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = .black
		button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
		view.addSubview(button)
	}
	
	@objc private func didTapButton() {
		let intent = NMIntentGoToAnimalPage(name: "Test", age: 12, caller: self)
		intentHandler.handle(intent)
	}

}

