//
//  String.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/12/22.
//

import Foundation
import UIKit
extension String {
    
    var toImage: UIImage {
        if let imageURL = URL(string: self) {
            if let data = try? Data(contentsOf: imageURL) {
                return UIImage(data: data) ?? UIImage()
            }
        }
        return UIImage()
    }
}
