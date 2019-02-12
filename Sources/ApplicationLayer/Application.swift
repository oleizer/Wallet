//
//  Application.swift
//  Wallet
//
//  Created by Олег Лейзер on 09/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import Foundation

class Application {

     // MARK: - App delegate services
    lazy var screenLocker: ScreenLockable = {
        return ScreenLocker()
    }()
}
