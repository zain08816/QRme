//
//  QRUtility.swift
//  QRme
//
//  Created by Zain Ali on 1/5/20.
//  Copyright © 2020 Zain Ali. All rights reserved.
//

import Foundation

public class QR {
    
    func form_string() -> String {
        
        let defaults = UserDefaults.standard
        
        let first_name = defaults.string(forKey: "first_name")!
        let last_name = defaults.string(forKey: "last_name")!
        let phone = defaults.string(forKey: "phone")!
        let email = defaults.string(forKey: "email")!
        let website = defaults.string(forKey: "website")!
        let address = defaults.string(forKey: "address")!
        
        
        let q =
            "BEGIN:VCARD \n" +
            "VERSION:2.1 \n" +
            "N:\(last_name);\(first_name) \n" +
            "FN:\(first_name) \(last_name) \n" +
            "TEL;CELL;VOICE:\(phone) \n" +
            "EMAIL:\(email) \n" +
            "URL:\(website) \n" +
            "ADR;HOME:\(address) \n" +
            "END:VCARD"
        
        print(q)
        return q
    }
    
    
    
}
