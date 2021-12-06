//
//  Income.swift
//  Bill Tracker
//
//  Created by Wade Belden on 10/3/21.
//

import Foundation

struct Income: Codable {
    let name: String
    let amount: Float
    let payDate: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case amount
        case payDate
    }
}
