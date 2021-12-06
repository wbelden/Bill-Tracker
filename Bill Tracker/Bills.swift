//
//  Bills.swift
//  Bill Tracker
//
//  Created by Wade Belden on 10/3/21.
//

import Foundation

class Bills: ObservableObject {
    @Published var bills: [Bill] = {
        do {
            let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("bills.json")

            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let items = try decoder.decode([Bill].self, from: data)
            return items
        } catch {
            print(error.localizedDescription)
            return []
        }
    }()
    
    func writeBillsToJSON(bills: Bills) {
        do {
            let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("bills.json")

            let encoder = JSONEncoder()
            try encoder.encode(bills.bills).write(to: fileURL)
        } catch {
            print(error.localizedDescription)
        }
    }
}
