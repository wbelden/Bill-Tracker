//
//  DaysOfWeek.swift
//  Bill Tracker
//
//  Created by Wade Belden on 10/3/21.
//

import Foundation
    
struct DayOfWeek: Codable, Identifiable {
    let id: Int
    let dateYear: Int
    let dateMonth: Int
    let dateDay: Int
    let dayOfWeek: String
    
    init(id: Int, dateYear: Int, dateMonth: Int, dateDay: Int, dayOfWeek: String) {
        self.id = id
        self.dateYear = dateYear
        self.dateMonth = dateMonth
        self.dateDay = dateDay
        self.dayOfWeek = dayOfWeek
    }
}
