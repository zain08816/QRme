//
//  SwiftUIView.swift
//  QRme
//
//  Created by Zain Ali on 1/13/20.
//  Copyright © 2020 Zain Ali. All rights reserved.
//

import SwiftUI

struct DataUtility: View {
    
    
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var website = ""
    @State private var address = ""
//    @State private var name = Array<String>.init(repeating: "", count: 6)
    
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Your Info")) {
                    TextField("First Name",
                              text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Last Name",
                              text: $lastname).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Phone",
                              text: $phone).keyboardType(.phonePad).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email",
                              text: $email).keyboardType(.emailAddress).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Website",
                              text: $website).keyboardType(.URL).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Address",
                              text: $address).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Section {
                    Button(action: {
                        
                        let defaults = UserDefaults.standard
                        defaults.set(self.firstname, forKey: "first_name")
                        defaults.set(self.lastname, forKey: "last_name")
                        defaults.set(self.phone, forKey: "phone")
                        defaults.set(self.email, forKey: "email")
                        defaults.set(self.website, forKey: "website")
                        defaults.set(self.address, forKey: "address")
                        defaults.synchronize()
                        
                        print(self.firstname)
                        print(self.lastname)
                        print(self.phone)
                        print(self.email)
                        print(self.website)
                        print(self.address)
                        print("Saved Data")
                    }) {
                        Text("Save")
                    }
                }
                
                
                
                
                
            }.navigationBarTitle(Text("Information Form"))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DataUtility()
    }
}
