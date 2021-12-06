//
//  Bill.swift
//  Bill Tracker
//
//  Created by Wade Belden on 10/2/21.
//

import Foundation


struct Bill: Codable {
    var name: String
    var amount: Float
    var dueDate: Int
    var company: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case amount
        case dueDate
        case company
    }
}
