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
     Функция для получения детальной версии приложения
     - returns: Строку типа **String**
     - note: пример: 1.0.0 1001
     */
    public func detailedVersionNumber() -> String? {
        let mainBundle = Bundle.main
        guard  let version = mainBundle.infoDictionary?["CFBundleShortVersionString"], let build = mainBundle.infoDictionary?["CFBundleVersion"]  else {
            return nil
        }
        let result = "\(version) (\(build))"
        return result
    }
    var version: String? {
        guard var version = infoDictionary?["CFBundleShortVersionString"] as? String else {
            return nil
        }
        #if DEBUG
        version.append(" (DEV)")
        #endif
        return version
    }
    /**
     Функция для получения версии приложения
     - returns: Строку типа **String** если включен дебаг то версия будет с препиской (DEV)
     - note: пример: 1.0.0 (DEV)
     */
    public func shortVersionString() -> String? {
        guard var version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return nil
        }
        #if DEBUG
        version.append(" (DEV)")
        #endif
        return version
    }
    /**
     Функция для получения версии приложения
     - returns: Строку типа **String** если включен дебаг то версия будет с препиской (DEV)
     - note: пример: 1.0.0 (DEV)
     */
    public func bundleVersion() -> String? {
        guard let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            return nil
        }
        return version
    }

}
