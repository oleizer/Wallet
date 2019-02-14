//
//  StringExtensions.swift
//  Wallet
//
//  Created by Олег Лейзер on 13/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import Foundation
extension String {
    func toData() -> Data {
        return decomposedStringWithCompatibilityMapping.data(using: .utf8) ?? Data()
    }
}
