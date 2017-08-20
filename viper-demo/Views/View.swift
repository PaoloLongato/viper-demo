//
//  ViewController.swift
//  viper-demo
//
//  Created by Paolo Longato on 19/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import UIKit

class View: UIViewController, ViewType {
    
    // Callbacks to pass information to the owner
    var onNextButtonPressed: (() -> Void)?
    // UIKit specific navigation
    var segueObserver: ((Any?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do some layput and style related operations
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        onNextButtonPressed?()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segueObserver?(sender)
    }
}
