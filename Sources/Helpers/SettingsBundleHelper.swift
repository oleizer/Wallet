//
//  SettingsBundleHelper.swift
//  Wallet
//
//  Created by Олег Лейзер on 04/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import Foundation

enum SettingsBundleHelper {
    enum SettingBundleKeys {
        static let BuildVersionKey = "WalletPreferanceBuild"
        static let AppVersionKey = "WalletPreferanceVersion"
        static let AppResetKey = "WalletRestartKey"

        static let AppServerKey = "WalletServerKey"

    }
    static func checkReset() {
        if UserDefaults.standard.bool(forKey: SettingBundleKeys.AppResetKey) {
            UserDefaults.standard.set(false, forKey: SettingBundleKeys.AppResetKey)
            _ = Bundle.main.bundleIdentifier
            guard let domain = Bundle.main.bundleIdentifier else { return }
            UserDefaults.standard.removePersistentDomain(forName: domain)
        }

    }
    static func updatePreferanceVersionInfo() {
        if let version = Bundle.main.shortVersionString, let build = Bundle.main.bundleVersion {
            UserDefaults.standard.set(version, forKey: SettingBundleKeys.AppVersionKey)
            UserDefaults.standard.set(build, forKey: SettingBundleKeys.BuildVersionKey)
            UserDefaults.standard.set(build, forKey: SettingBundleKeys.BuildVersionKey)
            UserDefaults.standard.set(1, forKey: SettingBundleKeys.AppServerKey)

        }
    }
}
