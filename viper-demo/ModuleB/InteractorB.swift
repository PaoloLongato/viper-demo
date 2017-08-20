//
//  InteractorB.swift
//  viper-demo
//
//  Created by Paolo Longato on 19/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import Foundation

// Pull logic
class InteractorB {
    let captionsDataManager = CaptionsDataManager()
    let imagesDataManager = ImagesDataManager()
    let imageName: ImageName
    private var str: String?
    private var image: Image?
    private var thingsFetched: Int = 0
    func fetchImageAndCaption(completion: @escaping ((Image, String)?, Error?) -> Void) {
        captionsDataManager.downloadCaption(for: self.imageName) { (string, error) in
            if error != nil {
                self.thingsFetched = 0
                completion(nil, error)
            } else if string != nil {
                self.thingsFetched += 1
                self.str = string!
                if self.thingsFetched == 2 {
                    completion((self.image!, self.str!), nil) 
                }
            }
        }
        
        imagesDataManager.download(image: self.imageName) { (image, error) in
            if error != nil {
                self.thingsFetched = 0
                completion(nil, error)
            } else if image != nil {
                self.thingsFetched += 1
                self.image = image!
                if self.thingsFetched == 2 {
                    completion((self.image!, self.str!), nil) 
                }
            }
        }
    } 
    
    init(imageName: ImageName) {
        self.imageName = imageName
    }
}
