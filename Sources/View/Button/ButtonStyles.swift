//
//  ButtonStyles.swift
//  Wallet
//
//  Created by Олег Лейзер on 12/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

enum Corner {
    case square
    case pill
    case rounded
    
    func size(in frame: CGRect) -> CGFloat {
        switch self {
        case .square: return 0
        case .pill: return min(frame.height, frame.width) / 2
        case .rounded: return 12
        }
    }
}


protocol ButtonStyle {

    static var backgroundColor: UIColor { get }
    static var selectedBackgroundColor: UIColor? { get }
    static var highlightedBackgroundColor: UIColor? { get }
    static var disabledBackgroundColor: UIColor? { get }
    
    
    static var titleColor: UIColor { get }
    static var highlightedTitleColor: UIColor? { get }
    static var selectedTitleColor: UIColor? { get }
    static var disabledTitleColor: UIColor? { get }
    
    static var borderColor: UIColor? { get }
    static var selectedBorderColor: UIColor? { get }
    static var highlightedBorderColor: UIColor? { get }
    static var disabledBorderColor: UIColor? { get }
    
    static var font: UIFont { get }
    
    static var corner: Corner { get }
}

enum BlueClearButtonStyle: ButtonStyle {
    
    static var backgroundColor: UIColor = .clear
    static var selectedBackgroundColor: UIColor? = ColorName.secondaryLight.color
    static var highlightedBackgroundColor: UIColor? = ColorName.secondaryLight.color
    static var disabledBackgroundColor: UIColor? = nil
    
    static var titleColor: UIColor = ColorName.secondary.color
    static var highlightedTitleColor: UIColor? = .white
    static var selectedTitleColor: UIColor? = .white
    static var disabledTitleColor: UIColor? = ColorName.grayMedium.color
    
    
    static var borderColor: UIColor? = ColorName.secondary.color
    static var selectedBorderColor: UIColor? = nil
    static var highlightedBorderColor: UIColor? = nil
    static var disabledBorderColor: UIColor? = ColorName.grayMedium.color
    
    static var font: UIFont = .defaultFont()
    
    static var corner: Corner = .pill
}

enum BlueButtonStyle: ButtonStyle {
    
    static var backgroundColor: UIColor = ColorName.secondary.color
    static var selectedBackgroundColor: UIColor? = ColorName.secondaryLight.color
    static var highlightedBackgroundColor: UIColor? = ColorName.secondaryLight.color
    static var disabledBackgroundColor: UIColor? = ColorName.grayMedium.color
    
    static var titleColor: UIColor = .white
    static var highlightedTitleColor: UIColor? = nil
    static var selectedTitleColor: UIColor? = nil
    static var disabledTitleColor: UIColor? = nil
    
    
    static var borderColor: UIColor? = nil
    static var selectedBorderColor: UIColor? = nil
    static var highlightedBorderColor: UIColor? = nil
    static var disabledBorderColor: UIColor? = nil
    
    static var font: UIFont = .defaultFont()
    
    static var corner: Corner = .pill
}
