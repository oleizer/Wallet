//
//  WelcomeAssembly.swift
//  Wallet
//
//  Created by Олег Лейзер on 11/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

class WelcomeAssembly: Assemblability {
//    private var initialState: ImportViewController.State = .initial(import: .jsonKey)
//
//    func set(initialState: ImportViewController.State) -> ImportAssembly {
//        self.initialState = initialState
//        return self
//    }
    func assembly() -> UIViewController {
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
//        let viewController = StoryboardScene.Welcome.welcomeViewController.instantiate()
        let viewController = WelcomeViewController(interactor: interactor, router: router)

        return viewController
    }
}
