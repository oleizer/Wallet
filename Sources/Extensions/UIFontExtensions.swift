//
//  UIFontExtensions.swift
//  Wallet
//
//  Created by Олег Лейзер on 13/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

extension UIFont {
    
    public class func loadFonts() {}
    
    public class func defaultFont(_ size: CGFloat = 14) -> UIFont { return FontFamily.SFProText.regular.font(size: size) }
    
    public class func printAvailableFonts() {
        for familyName in UIFont.familyNames
        {
            print("Family Name: \(familyName)")
            for fontName in UIFont.fontNames(forFamilyName: familyName)
            {
                print("--Font Name: \(fontName)")
            }
        }
    }
}
