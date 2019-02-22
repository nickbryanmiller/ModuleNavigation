//
//  ViewController.swift
//  ModuleNavigation
//
//  Created by Nicholas Miller on 2/21/19.
//  Copyright © 2019 nickbryanmiller. All rights reserved.
//

import UIKit

public class ExploreViewController: UIViewController {
	
	public init() {
		super.init(nibName: nil, bundle: nil)
		title = "Explore"
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override public func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
	}


}

