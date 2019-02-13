//
//  UIImageExtensions.swift
//  Wallet
//
//  Created by Олег Лейзер on 12/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit
extension UIImage {
    static func image(with color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
