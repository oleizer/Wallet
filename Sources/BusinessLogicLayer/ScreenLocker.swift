//
//  ScreenLocker.swift
//  Wallet
//
//  Created by Олег Лейзер on 09/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import Foundation
import UIKit

protocol ScreenLockable {
    func lock(_ animated: Bool)
    func unlock(_ animated: Bool)
}

class ScreenLocker: ScreenLockable {
    private let blurViewtag = 160686

    private lazy var lockerView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .red

        return bluredSnapshot() ?? UIView()
    }()

    func lock(_ animated: Bool) {

        if AppDelegate.shared.window?.viewWithTag(blurViewtag)?.isDescendant(of: AppDelegate.currentWindow) != nil {
            return
        }

        AppDelegate.currentWindow.addSubview(lockerView)
        if animated {
            lockerView.alpha = 0
            UIView.animate(withDuration: 0.3) {
                self.lockerView.alpha = 1.0
            }
        }
    }

    func unlock(_ animated: Bool) {

        if lockerView.isDescendant(of: AppDelegate.currentWindow) {
            if animated {
                UIView.animate(withDuration: 0.3, animations: {
                    self.lockerView.alpha = 0
                }) { _ in
                    self.lockerView.removeFromSuperview()
                }
            } else {
                lockerView.removeFromSuperview()
            }
        }
    }

    private func bluredSnapshot() -> UIView? {
        let snapshot = AppDelegate.shared.window?.snapshotView(afterScreenUpdates: true)
        snapshot?.addSubview(blurView(frame: (snapshot?.frame)!))
        snapshot?.tag = blurViewtag
        return snapshot
    }

    private func blurView(frame: CGRect) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.frame = frame
        return view
    }
}
