//
//  NSAttributedStringExtensions.swift
//  Wallet
//
//  Created by Олег Лейзер on 12/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    convenience init(button string: String, style: TitleStyle, state: UIControl.State = .normal, selected: Bool = false, alignment: NSTextAlignment = .center, lineBreakMode: NSLineBreakMode? = nil) {
        let stateColor: UIColor?
        if state == .disabled {
            stateColor = style.disabledTitleColor ?? style.titleColor
        }
        else if state == .highlighted && selected {
            stateColor = style.highlightedTitleColor ?? style.titleColor
        }
        else if state == .highlighted {
            stateColor = style.highlightedTitleColor ?? style.titleColor
        }
        else if state == .selected {
            stateColor = style.selectedTitleColor ?? style.titleColor
        }
        else {
            stateColor = style.titleColor
        }
        
        let color = stateColor ?? style.titleColor ?? .black
        self.init(string, color: color, font: style.font, alignment: alignment, lineBreakMode: lineBreakMode)
    }
    
    convenience init(_ string: String, color: UIColor = .black, font: UIFont = UIFont.systemFont(ofSize: 18), alignment: NSTextAlignment = .left, lineBreakMode: NSLineBreakMode? = nil) {
        let paragraphStyle = NSMutableParagraphStyle()
        if lineBreakMode != .byTruncatingTail {
            paragraphStyle.lineSpacing = 6
        }
        paragraphStyle.alignment = alignment
        if let lineBreakMode = lineBreakMode {
            paragraphStyle.lineBreakMode = lineBreakMode
        }
        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: font,
            .paragraphStyle: paragraphStyle]
        self.init(string: string, attributes: attrs)
    }
}
