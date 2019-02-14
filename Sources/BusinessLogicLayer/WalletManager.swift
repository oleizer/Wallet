//
//  WalletManager.swift
//  Wallet
//
//  Created by Олег Лейзер on 11/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import Foundation


protocol WalletManagerProtocol {
    func createWallet(passphase: String) throws
    func importWallet(with mnemonic: [String], passphrase: String) throws
}

class Walletmanager: WalletManagerProtocol {
    let mnemonicService: MnemonicServiceProtocol
    init(mnemonicService: MnemonicServiceProtocol) {
        self.mnemonicService = mnemonicService
    }
    func createWallet(passphase: String) throws {
        let mnemonic = mnemonicService.create(strenght: .normal, language: .english)
        try importWallet(with: mnemonic, passphrase: passphase)
    }
    func importWallet(with mnemonic: [String], passphrase: String) throws {
        let seed = try mnemonicService.createSeed(with: mnemonic, passphrase: passphrase)
        print(seed)
    }
    
}
