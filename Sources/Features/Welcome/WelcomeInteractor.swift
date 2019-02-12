//
//  WelcomeInteractor.swift
//  Wallet
//
//  Created by Олег Лейзер on 11/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import Foundation

protocol WelcomeBusinessLogic: class {
    func createWallet(request: Welcome.Wallet.Request)
}

class WelcomeInteractor: WelcomeBusinessLogic {
    var walletManager: WalletManagerProtocol!
    init(walletManager: WalletManagerProtocol = Walletmanager(mnemonicService: MnemonicService())) {
        self.walletManager = walletManager
    }
    
    func createWallet(request: Welcome.Wallet.Request) {
        do {
            try walletManager.createWallet(passphase: request.passcode)

        } catch {
            
        }
        print(request.passcode)
        print("interactor")
        
    }
    
    func createWallet() {
        print("create")

    }

}
