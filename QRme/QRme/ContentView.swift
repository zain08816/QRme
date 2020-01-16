//
//  ContentView.swift
//  QRme
//
//  Created by Zain Ali on 1/2/20.
//  Copyright © 2020 Zain Ali. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var name: String = ""
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection){
//            DataInput()
//                .tabItem {
//                    VStack {
//                         Image(systemName: "person.crop.square")
//                        Text("Information")
//                    }
//                }
//                .tag(0)
            
            DataUtility()
                .tabItem {
                    VStack {
                        Image(systemName: "airplane")
                        Text("Data Input 2.0")
                    }
                }
                .tag(0)
            QRImageGenerator()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "qrcode")
                        Text("QRCode")
                    }
                }
                .tag(1)

        }.accentColor(.accentColor)
        
        
//        VStack {
//
//            TextField(" Enter your name", text: $name).border(Color.blue)
//            Text("Hello, \(name)!")
//        }
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
                let size = CGSize(width: outputImage.extent.width * 3.0,
                                  height: outputImage.extent.height * 3.0)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
