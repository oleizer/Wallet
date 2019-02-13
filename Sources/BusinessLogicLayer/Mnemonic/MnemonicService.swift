//
//  MnemonicService.swift
//  Wallet
//
//  Created by Олег Лейзер on 11/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import Foundation
import CryptoSwift

protocol MnemonicServiceProtocol {
    func create(strenght: MnemonicService.Strenght, language: WordList) -> [String]
    func create(entropy: Data, language: WordList) -> [String]

}
enum WordList {
    case english
    case russian
    var words: [String] {
        switch self {
        case .english:
            return englishWords
        case .russian:
            return englishWords
        }
    }
}
class MnemonicService: MnemonicServiceProtocol {
    enum Strenght: Int {
        case normal = 128
        case hight = 256
    }
    func create(strenght: MnemonicService.Strenght, language: WordList) -> [String] {
        let byteCount = strenght.rawValue / 8
        var bytes = Data(count: byteCount)
        _  = bytes.withUnsafeMutableBytes { SecRandomCopyBytes(kSecRandomDefault, byteCount, $0) }
        
        print(bytes)
        
        return create(entropy: bytes, language: language)
    }
    func create(entropy: Data, language: WordList) -> [String] {
        print(entropy)
        let entropybits = String(entropy.flatMap { ("00000000" + String($0, radix: 2)).suffix(8) })
        let hashBits = String(entropy.sha256().flatMap { ("00000000" + String($0, radix: 2)).suffix(8) })
        let checkSum = String(hashBits.prefix((entropy.count * 8) / 32))
        let words = language.words

        let concatenatedBits = entropybits + checkSum
        
        var mnemonic: [String] = []
        for index in 0..<(concatenatedBits.count / 11) {
            let startIndex = concatenatedBits.index(concatenatedBits.startIndex, offsetBy: index * 11)
            let endIndex = concatenatedBits.index(startIndex, offsetBy: 11)
            let wordIndex = Int(strtoul(String(concatenatedBits[startIndex..<endIndex]), nil, 2))

            mnemonic.append(String(words[wordIndex]))
        }
        return mnemonic
    }

}
