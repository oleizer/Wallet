//
//  UITableViewExtensionsTests.swift
//  Wallet
//
//  Created by Олег Лейзер on 06/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import Quick
import Nimble
@testable import Wallet

class UITableViewExtensionsTests: QuickSpec {
    override func spec() {
        describe("UITableView extensions") {
            context("crll registration", closure: {
                let tableView = UITableView()

                it("should return reusableCell", closure: {
                    tableView.register(UITableViewCell.self)
                    let cell = tableView.dequeueReusableCell(UITableViewCell.self)
                    expect(cell).toNot(beNil())
                })
            })
            context("reload", closure: {
                let tableView = UITableView()

                it("should reload with animation", closure: {
                    waitUntil { done in
                        tableView.reload {
                            done()
                        }
                    }
                })
            })
            context("Footer", closure: {
                let tableView = UITableView()

                it("should table view footer view is nil") {
                    tableView.tableFooterView = UIView()
                    expect(tableView.tableFooterView).toNot(beNil())
                    tableView.removeTableFooterView()
                    expect(tableView.tableFooterView).to(beNil())
                }
                it("should table view footer view is nil") {
                    let view = UIView()
                    view.backgroundColor = .red
                    tableView.tableFooterView = view
                    expect(tableView.tableFooterView).toNot(beNil())
                    tableView.clearTableFooterView()
                    expect(tableView.tableFooterView).toNot(beNil())
                    expect(tableView.tableFooterView?.frame) == view.frame
                }
            })
        }

    }
}
