//
//  ImageLoader.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/14/22.
//

import UIKit
var imageCache = NSCache<NSString, UIImage>()

class ImageLoader: UIImageView {
    
    func loadImage(urlString: String){
        if let cacheImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cacheImage
            return
        }
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, _, errror in
            if let error = errror {
//                print("Couldn't download image: \(error)")
                NSLog("Couldn't download image: \(error)")
                return
            }
            guard let data = data else { return }
            let image = UIImage(data: data)
            if let imageData = image {
                imageCache.setObject(imageData, forKey: urlString as NSString)
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
