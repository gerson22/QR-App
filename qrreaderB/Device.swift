//
//  Device.swift
//  qrreaderB
//
//  Created by Gerson Isaias on 16/03/21.
//

import Foundation


struct Device: Codable {
    var device: String
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case device = "type"
        case token
    }
}
