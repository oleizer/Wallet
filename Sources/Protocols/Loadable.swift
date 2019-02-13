//
//  Loadable.swift
//  Wallet
//
//  Created by Олег Лейзер on 01/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

protocol Loadable {
    func startLoading()
    func stopLoading()
}

extension Loadable where Self: UIViewController {
    func startLoading() {
        print("Strt loading")
        DispatchQueue.main.async {
            print("Inicator")
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }

    func stopLoading() {
        print("Stop loading")

        DispatchQueue.main.async {
            print("Inicator")
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
