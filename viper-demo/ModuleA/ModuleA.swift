//
//  InitialRouter.swift
//  viper-demo
//
//  Created by Paolo Longato on 19/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import UIKit

enum ModuleAConfig {
    case popOver
    case stack
}

class ModuleA {
    var view: ViewType
    let router = ModuleARouter()
    init(configuration: ModuleAConfig, view: ViewType) {
        self.view = view
        switch configuration {
        case .stack:
            self.view.onNextButtonPressed = { [weak self] in 
                self?.router.goToA(from: (self?.view)!) 
            }
        case .popOver:
            self.view.onNextButtonPressed = { [weak self] in 
                self?.router.goToB(from: (self?.view)!) 
            }
        }
    }
}
