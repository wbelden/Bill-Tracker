//
//  Bank.swift
//  Bill Tracker
//
//  Created by Wade Belden on 10/3/21.
//

import Foundation

struct Bank: Codable{
    let name: String
    let balance: Float
    
    enum CodingKeys: String, CodingKey {
        case name
        case balance
    }

}


