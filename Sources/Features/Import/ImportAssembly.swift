//
//  ImportAssembly.swift
//  Wallet
//
//  Created by Олег Лейзер on 10/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

enum ImportState {
    case jsonKey
    case privateKey
    case mnemonic
}
class ImportAssembly: Assemblability {
    private var initialState: ImportViewController.State = .initial(import: .jsonKey)

    func set(initialState: ImportViewController.State) -> ImportAssembly {
        self.initialState = initialState
        return self
    }
    func assembly() -> UIViewController {
        let viewController = StoryboardScene.Import.importViewController.instantiate()
        viewController.state = initialState
        return viewController
    }
}
