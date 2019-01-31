//
//  UITableViewCellExtensionTests.swift
//  Wallet
//
//  Created by Олег Лейзер on 06/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import Quick
import Nimble
@testable import Wallet

class UITableViewCellExtensionTests: QuickSpec {
    override func spec() {
        describe("UITableViewCell esxrension tests") {
            context("for Cell", closure: {
                it("should return UITableViewCell identifier") {
                    expect(UITableViewCell.identifier).to(equal("UITableViewCell"))
                }
            })
            context("for Footer", closure: {
                it("should return UITableViewHeaderFooterView identifier") {
                    expect(UITableViewHeaderFooterView.identifier).to(equal("UITableViewHeaderFooterView"))
                }
            })

        }
    }
}
