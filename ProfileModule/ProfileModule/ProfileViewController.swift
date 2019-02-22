//
//  ProfileViewController.swift
//  ProfileModule
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import UIKit
import IntentModule

public class ProfileViewController: UIViewController {
	
	public init(intentHandler: NMIntentHandlerSystemProtocol) {
		super.init(nibName: nil, bundle: nil)
		title = "Profile"
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override public func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
	}
	
}
