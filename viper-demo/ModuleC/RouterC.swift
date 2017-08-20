//
//  File.swift
//  viper-demo
//
//  Created by Paolo Longato on 20/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import UIKit

class RouterC {
    func dismiss(view: NextViewAType) {
        guard let vc = view as? UIViewController else { return }
        vc.dismiss(animated: true, completion: nil)
    }
}
