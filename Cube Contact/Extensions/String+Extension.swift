//
//  String.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/12/22.
//

import Foundation
import UIKit

var imageCache4 = NSCache<NSString, UIImage>()

extension String {
    
    var toImage: UIImage {
        if let cacheImage = imageCache4.object(forKey: self as NSString) {
            return cacheImage
        }
        if let imageURL = URL(string: self) {
            if let data = try? Data(contentsOf: imageURL) {
                let image = UIImage(data: data)
                if let imageData = image {
                    imageCache4.setObject(imageData, forKey: self as NSString)
                    return imageData
                }
                return UIImage()
            }
        }
        return UIImage()
    }
}
