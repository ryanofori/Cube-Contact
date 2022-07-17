//
//  View+Extension.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/14/22.
//

import Foundation
import UIKit
extension UIView {
    
    func activityStartAnimating() {
        let backgroundView = UIView()
//        backgroundView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
//                    backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        //            backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        //            activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        //            self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        //            self.isUserInteractionEnabled = true
    }
    
    var activityIndicator: UIActivityIndicatorView {
        get {
            let activityIndicator = UIActivityIndicatorView()
          activityIndicator.hidesWhenStopped = true
          activityIndicator.center = CGPoint(x:self.frame.width/2,
                                         y: self.frame.height/2)
          activityIndicator.stopAnimating()
          self.addSubview(activityIndicator)
          return activityIndicator
        }
      }

}
