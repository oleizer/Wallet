//
//  StyledButton.swift
//  Wallet
//
//  Created by Олег Лейзер on 12/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

class StyledButton<T: ButtonStyle>: UIButton {
    var didOverrideTitle = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        updateStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateStyle()
    }

    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        updateStyle()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = T.corner.size(in: frame)
    }
    
    
    override var isEnabled: Bool{
        didSet { updateStyle() }
    }
    override var isSelected: Bool {
        didSet { updateStyle() }
    }
    override var isHighlighted: Bool {
        didSet { updateStyle() }
    }
    private func updateStyle() {
        let layerBorder: UIColor?
        if !isEnabled {
            backgroundColor = T.disabledBackgroundColor ?? T.backgroundColor
            layerBorder = T.disabledBorderColor
        } else if isHighlighted {
            backgroundColor = T.highlightedBackgroundColor ?? T.backgroundColor
            layerBorder = T.highlightedBorderColor ?? T.borderColor
        } else if isSelected {
            backgroundColor = T.selectedBackgroundColor ?? T.backgroundColor
            layerBorder = T.selectedBorderColor ?? T.borderColor
        } else {
            backgroundColor = T.backgroundColor
            layerBorder = T.borderColor
        }
        
        
        if let layerBorder = layerBorder {
            layer.borderColor = layerBorder.cgColor
            layer.borderWidth = 1.0
        } else {
            layer.borderColor = nil
            layer.borderWidth = 0
        }
        
        if !didOverrideTitle {
            titleLabel?.font = T.font
            if let defaultTitle = self.title(for: .normal) {
                let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
                for state in states {
                    let title = self.title(for: state) ?? defaultTitle
                    //let attr = NSAttributedString(button: title, style: nil, state: state, selected: isSelected, lineBreakMode: nil)
                    //super.setAttributedTitle(NSAttributedString(button: title, style: T, state: state, selected: isSelected, alignment: .center, lineBreakMode: nil), for: state)
                    super.setAttributedTitle(NSAttributedString(title, color: T.titleColor, font: T.font, alignment: .center, lineBreakMode: nil), for: state)
                }
            }
        }
    }
}

extension NSAttributedString {
    convenience init<T: ButtonStyle>(button string: String, style: T?, state: UIControl.State = .normal, selected: Bool = false, alignment: NSTextAlignment = .center, lineBreakMode: NSLineBreakMode? = nil) {
        let stateColor: UIColor?
        if state == .disabled {
            stateColor = T.disabledTitleColor
        }
        else if state == .highlighted {
            stateColor = T.highlightedTitleColor
        }
        else if state == .selected {
            stateColor = T.selectedTitleColor
        }
        else {
            stateColor = T.titleColor
        }
        
        let color = stateColor ?? T.titleColor ?? .black
        self.init(string, color: color, font: T.font, alignment: alignment, lineBreakMode: lineBreakMode)
    }
}
