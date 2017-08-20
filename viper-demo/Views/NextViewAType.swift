//
//  NextViewAType.swift
//  viper-demo
//
//  Created by Paolo Longato on 20/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import Foundation

protocol NextViewAType {
    // Passing events
    var onLoad: (()->Void)? { get set }
    var onCloseButtonPressed: (() -> Void)? { get set }
    // Variables, interface
    var imageData: Data? { get set }
    var caption: String? { get set }
}
