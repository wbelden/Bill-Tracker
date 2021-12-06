//
//  Banks.swift
//  Bill Tracker
//
//  Created by Wade Belden on 10/17/21.
//

import Foundation

class Banks: ObservableObject {
    @Published var banks: [Bank] = {
        do {
            let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("banks.json")

            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let items = try decoder.decode([Bank].self, from: data)
            return items
        } catch {
            print(error.localizedDescription)
            return []
        }
    }()
    
    func writeBanksToJSON(banks: Banks) {
        do {
            let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("banks.json")

            let encoder = JSONEncoder()
            try encoder.encode(banks.banks).write(to: fileURL)
        } catch {
            print(error.localizedDescription)
        }
    }
}
