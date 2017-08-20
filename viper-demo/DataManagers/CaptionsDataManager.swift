//
//  DataManagerB.swift
//  viper-demo
//
//  Created by Paolo Longato on 19/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import Foundation

struct CaptionsDataManager {
    func downloadCaption(for image: ImageName, completion: (String?, Error?) -> Void) {
        switch image {
        case .cuteBear:
            completion("Cute bear.", nil)
        case .uglyBear:
            completion("Ugly bear.", nil)
        }
    }
}
