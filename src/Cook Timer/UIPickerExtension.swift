//
//  UIPickerExtension.swift
//  Cook Timer
//
//  Created by Karolina Beata Natalia Guzewska on 02.01.2018.
//  Copyright © 2018 Karolina Beata Natalia Guzewska. All rights reserved.
//

import Foundation
import UIKit

extension UIPickerView {
    // https://github.com/luismachado/Swift/blob/master/PickerLabels.swift
    func setPickerLabels(labels: [Int:String], containedView: UIView) { // [component number:label]
        
        let fontSize:CGFloat = 20
        let labelWidth:CGFloat = containedView.bounds.width / CGFloat(self.numberOfComponents)
        let x:CGFloat = self.frame.origin.x + 45
        let y:CGFloat = (self.frame.size.height / 2) - (fontSize / 2)
        
        for i in 0...self.numberOfComponents {
            
            if let l = labels[i] {
                let label = UILabel()
                label.text = l
                
                label.frame = CGRect(x: x + labelWidth * CGFloat(i), y: y, width: labelWidth, height: fontSize)
                label.font = UIFont.boldSystemFont(ofSize: fontSize)
                label.backgroundColor = .clear
                label.textAlignment = NSTextAlignment.center
                
                self.addSubview(label)
            }
        }
    }
}
