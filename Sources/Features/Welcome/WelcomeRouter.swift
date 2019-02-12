//
//  WelcomeRouter.swift
//  Wallet
//
//  Created by Олег Лейзер on 11/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

typealias PinPostProcess = ((String, PinResult?) -> Void)
typealias PinResult = (RResult<Any>) -> Void
typealias PinNextScene = ((UIViewController) -> Void)

protocol WelcomeRouting {
    func presentPin(from viewController: UIViewController, postProcess: PinPostProcess?)
}


class WelcomeRouter: WelcomeRouting {
    func presentPin(from viewController: UIViewController, postProcess: PinPostProcess?) {
        let pinViewController = StoryboardScene.Pin.pinViewController.instantiate()
        pinViewController.present(from: viewController, postProcess: postProcess) { [unowned self] vc in
            print("hz")

        }
    }
}
