//
//  BarcodeGenerator.swift
//
//  Created by Adrian Bolinger on 4/8/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

class QRCodeGenerator {
  
  class func fromString(_ string: String) -> UIImage? {
    let data = string.data(using: .ascii)
    let filter = CIFilter(name: "CIQRCodeGenerator")
    
    guard let qrCode = filter else { return nil }
    qrCode.setValue(data, forKey: "inputMessage")
    qrCode.setValue("H", forKey: "inputCorrectionLevel")
    
    guard let outputImage = qrCode.outputImage else { return nil }
    return UIImage(ciImage: outputImage)
  }
}
