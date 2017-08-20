//
//  ModuleB.swift
//  viper-demo
//
//  Created by Paolo Longato on 20/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import Foundation

class ModuleB {
    private(set) var view: NextViewAType
    let interactor = InteractorB(imageName: .cuteBear)
    init(view: NextViewAType) {
        self.view = view
        self.view.onLoad = { [weak self] in 
            self?.interactor.fetchImageAndCaption() { (arg0, error) in
                guard let arg0 = arg0 else { return }
                let (image, string) = arg0
                self?.view.caption = string
                self?.view.imageData = image.data
            } 
        }
    }
}
