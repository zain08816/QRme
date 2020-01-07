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
                    Text("Input Your Information").font(.headline).padding(.all)
                }
                TextField("First Name", text: $name[0]).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Last Name", text: $name[1]).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Phone", text: $name[2]).keyboardType(.phonePad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $name[3]).keyboardType(.emailAddress).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Website", text: $name[4]).keyboardType(.URL).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Address", text: $name[5]).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button( action: {
                
                print(self.name)
                
                let defaults = UserDefaults.standard
                defaults.set(self.name[0], forKey: "first_name")
                defaults.set(self.name[1], forKey: "last_name")
                defaults.set(self.name[2], forKey: "phone")
                defaults.set(self.name[3], forKey: "email")
                defaults.set(self.name[4], forKey: "website")
                defaults.set(self.name[5], forKey: "address")
                defaults.synchronize()
                
                
                print("Saved Data")
            }) {
                HStack {
                    Text("Save").padding()
                }
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
