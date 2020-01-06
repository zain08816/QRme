//
//  DataInput.swift
//  QRme
//
//  Created by Zain Ali on 1/5/20.
//  Copyright © 2020 Zain Ali. All rights reserved.
//

import Foundation
import SwiftUI


struct DataInput: View {

    @State private var name = Array<String>.init(repeating: "", count: 6)
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            List{
                Group {
                    Text("Input Your Contact Information").font(.largeTitle).padding(.all)
                }
                TextField("First Name", text: $name[0]).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Last Name", text: $name[1]).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Phone", text: $name[2]).keyboardType(.phonePad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("email", text: $name[3]).keyboardType(.emailAddress).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("website", text: $name[4]).keyboardType(.URL).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Address", text: $name[5]).textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }
             
            
            
            
//            Button(action: {
//                print("dismissed form")
//                self.presentationMode.wrappedValue.dismiss()
//            }) {
//                Text("Dismiss")
//            }.padding(.bottom, 50)
//            Text("This is a modal")
}

struct DataInput_Previews: PreviewProvider {
    static var previews: some View {
        DataInput()
    }
}
