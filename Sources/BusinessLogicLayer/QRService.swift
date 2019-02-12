//
//  QRService.swift
//  Wallet
//
//  Created by Олег Лейзер on 09/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

protocol QRServiceProtocol {
    func createQR(fromString string: String, size: CGSize) throws -> UIImage
}

enum QRServiceError: Error {
    case error
}

class QRService: QRServiceProtocol {

    func createQR(fromString string: String, size: CGSize) throws -> UIImage {
        guard
            let data = string.data(using: String.Encoding.utf8),
            let filter = CIFilter(name: "CIQRCodeGenerator"),
            let colorFilter = CIFilter(name: "CIFalseColor")
        else { throw QRServiceError.error}

        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("L", forKey: "inputCorrectionLevel")

        colorFilter.setValue(filter.outputImage, forKey: "inputImage")

        guard let qrCodeImage = colorFilter.outputImage else {
            throw QRServiceError.error
        }
        let scaleX = size.width / qrCodeImage.extent.size.width
        let scaleY = size.height / qrCodeImage.extent.size.height
        let transform = CGAffineTransform(scaleX: scaleX, y: scaleY)

        guard let output = filter.outputImage?.transformed(by: transform) else {
            throw QRServiceError.error
        }

        let context = CIContext(options: nil)
        guard let cgImage = context.createCGImage(output, from: output.extent) else {
            throw QRServiceError.error
        }
        return UIImage(cgImage: cgImage)
    }
}
