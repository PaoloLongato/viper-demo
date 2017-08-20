//
//  DataManagerA.swift
//  viper-demo
//
//  Created by Paolo Longato on 19/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import Foundation

enum ImageType {
    case png
    case jpeg
}

extension ImageName {
    var urlString: String {
        get {
            switch self {
            case .cuteBear:
                return "https://s-media-cache-ak0.pinimg.com/736x/b6/fb/eb/b6fbebfcb41410e5f2de0bd9d88e741f--cute-bears-baby-bears.jpg"
            case .uglyBear:
                return "https://rashnak.smugmug.com/Northwest-Passage-2015/Day-7/i-QkhvCHH/0/L/P1040897%20%282%29-L.jpg"
            }
        }
    }
    
    var imageType: ImageType {
        get {
            return .jpeg
        }
    }
}

struct Image {
    let data: Data
    let type: ImageType
}

enum ImageName {
    case cuteBear
    case uglyBear
}

struct ImagesDataManager {
    func download(image: ImageName, completion: @escaping (Image?, Error?) -> Void) {
        let session = URLSession(configuration: .default)
        let url = URL(string: image.urlString)!
        let task = session.downloadTask(with: url, completionHandler: { (file_url, response, error) in
            if error == nil {
                do {
                    let data = try Data(contentsOf: file_url!)
                    let image = Image(data: data, type: image.imageType)
                    completion(image, nil)
                } catch {
                    let fileReadError = NSError(domain: "Some domain", code: -1, userInfo: nil)
                    completion(nil, fileReadError)
                }
            } else {
                completion(nil, error)
            }
        })
        task.resume()
    } 
}
