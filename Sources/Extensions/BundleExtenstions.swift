//
//  BundleExtenstions.swift
//  Wallet
//
//  Created by Олег Лейзер on 04/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import Foundation

public extension Bundle {
    /**
    Получения детальной версии приложения
     - note: пример: 1.0.0 1001
     */
    var detailedVersionNumber: String? {
        let mainBundle = Bundle.main
        guard  let version = mainBundle.infoDictionary?["CFBundleShortVersionString"], let build = mainBundle.infoDictionary?["CFBundleVersion"]  else {
            return nil
        }
        var result = "\(version) (\(build))"
        #if DEBUG
        result.append(" (DEV)")
        #endif
        return result
    }

    /**
     Получения версии приложения
     - note: пример: 1.0.0
     */

    var shortVersionString: String? {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return nil
        }

        return version
    }
    /**
     Получения версии приложения
     - note: пример: 1001
     */

    var bundleVersion: String? {
        guard let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            return nil
        }
        return version
    }

}
