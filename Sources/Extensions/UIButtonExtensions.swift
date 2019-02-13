//
//  UIButtonExtensions.swift
//  Wallet
//
//  Created by Олег Лейзер on 12/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

extension UIButton {
    open func setBackgroundColor(_ color: UIColor, forUIControlState state: UIControl.State) {
        setBackgroundImage(UIImage.image(with: color), for: state)
    }
}
