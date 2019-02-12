//
//  NSAttributedStringExtensions.swift
//  Wallet
//
//  Created by Олег Лейзер on 12/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

extension NSAttributedString {
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
