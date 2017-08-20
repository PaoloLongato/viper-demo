//
//  ViewType.swift
//  viper-demo
//
//  Created by Paolo Longato on 20/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import Foundation

protocol ViewType {
    var onNextButtonPressed: (() -> Void)? { get set }
}
