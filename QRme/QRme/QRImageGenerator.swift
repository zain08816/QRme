//
//  QRImageGenerator.swift
//  QRme
//
//  Created by Zain Ali on 1/6/20.
//  Copyright © 2020 Zain Ali. All rights reserved.
//

import SwiftUI
import Combine


struct QRImageGenerator: View {
    @State private var str = ""
    
    var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .portrait
        }
    }
    
    var body: some View {
        VStack {
            Image(uiImage: self.generateQRCode(from: str)!)
                .resizable()
                .scaledToFit()
            
            Button( action: {
                self.str = QR().form_string()
                print(self.str)
            }) {
                Text("Generate")
            }
//            Text(QR().form_string())
        }
        
    }
    
    func generateQRCode(from string: String) -> UIImage? {

        let data = string.data(using: String.Encoding.ascii)
        var uiImage: UIImage?
        if let filter = CIFilter(name: "CIQRCodeGenerator",
                                 parameters: ["inputMessage": data as Any,
                                              "inputCorrectionLevel": "L"]) {

            if let outputImage = filter.outputImage,
                let cgImage = CIContext().createCGImage(outputImage,
                                                        from: outputImage.extent) {
                let size = CGSize(width: outputImage.extent.width * 5.0,
                                  height: outputImage.extent.height * 5.0)
                UIGraphicsBeginImageContext(size)
                if let context = UIGraphicsGetCurrentContext() {
                    context.interpolationQuality = .none
                    context.draw(cgImage,
                                 in: CGRect(origin: .zero,
                                            size: size))
                    uiImage = UIGraphicsGetImageFromCurrentImageContext()
                }
                UIGraphicsEndImageContext()
            }
        }
        return uiImage
    }
    
}



struct QRImageGenerator_Previews: PreviewProvider {
    static var previews: some View {
        QRImageGenerator()
    }
}
