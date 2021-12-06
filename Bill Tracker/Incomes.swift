//
//  Incomes.swift
//  Bill Tracker
//
//  Created by Wade Belden on 10/17/21.
//

import Foundation
class Incomes: ObservableObject {
    @Published var incomes: [Income] = {
        do {
            let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("incomes.json")

            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let items = try decoder.decode([Income].self, from: data)
            return items
        } catch {
            print(error.localizedDescription)
            return []
        }
    }()
    
    func writeIncomesToJSON(incomes: Incomes) {
        do {
            let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("incomes.json")

            let encoder = JSONEncoder()
            try encoder.encode(incomes.incomes).write(to: fileURL)
        } catch {
            print(error.localizedDescription)
        }
    }
}
