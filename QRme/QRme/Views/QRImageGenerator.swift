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
    
    let gradient = LinearGradient(gradient: Gradient(colors:
        [Color("ColorDarkAccent"), Color("ColorLightAccent")]), startPoint:
        .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        
        VStack {
            Image(uiImage: self.generateQRCode(from: str)!)
                .resizable()
                .scaledToFit()
            HStack {
                Button( action: {
                    self.str = QR().form_string()
                    print(self.str)
                }) {
                    Text("Generate")
                    .padding()
                }
                .background(RoundedRectangle(cornerRadius: 15).opacity(0.2))
                Spacer()
                
                Button( action: {
                    self.str = QR().form_string()
                    guard let image = self.generateQRCode(from: self.str) else { return }
                    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
                }) {
                    Text("Save")
                    .padding()
                }
                .background(RoundedRectangle(cornerRadius: 15).opacity(0.2))
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
                let size = CGSize(width: outputImage.extent.width * 8.0,
                                  height: outputImage.extent.height * 8.0)
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
