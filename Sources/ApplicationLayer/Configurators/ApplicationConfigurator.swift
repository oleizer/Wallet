//
//  ApplicationConfigurator.swift
//  Wallet
//
//  Created by Олег Лейзер on 04/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import UIKit

class ApplicationConfigurator: ConfiguratorProtocol {
    func configure() {
        print("ApplicationConfigurator")

        #if DEBUG
        NSSetUncaughtExceptionHandler { exception in
            print(exception)
            for sym in exception.callStackSymbols {
                print(sym)
            }
        }
        //        Tracker.shared.overrideAgent = NullAgent()
        #endif
        SettingsBundleHelper.updatePreferanceVersionInfo()

//
//        switch Environment.scheme {
//        case .staging:
//            APIKeys.shared = APIKeys.staging
//        case .develope:
//            APIKeys.shared = APIKeys.developer
//        case .production:
//            APIKeys.shared = APIKeys.production
//        case .appstore:
//            APIKeys.shared = APIKeys.default
//        }
//
        //        let auth = AuthenticationEntity.shared
        //        let model = AuthTokenModel(token: "XHJ9m+pE/WH1eNZhJxB3imMuy0m6vRRjHS4EvZQRReAINKFihzLAN7TdVh1TyqUvUdoAAjtBgWb5qCtxkPUP7TXdXFSbuQeEEY39ourKjkrmYPxivIElZMuc0sUWXhWCZ4sRPKtdu9Da/5+zRU+ddA==?g2C5q/p4OfA4F96AOksugl5n8qul3bbPkHwyaWp1thw=", type: "Bearer", scope: "1")
        //        auth.accessToken = model.token
        //        SettingsAccessor.shared.logUptime()
        //        AuthenticationManager.shared.authenticated(isPasswordBased: true)
        //        AuthToken.storeAuthToken(model, isPasswordBased: true, username: "self.username", password: "self.password")
    }
}
