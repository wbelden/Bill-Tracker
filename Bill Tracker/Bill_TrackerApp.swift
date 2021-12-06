//
//  Bill_TrackerApp.swift
//  Bill Tracker
//
//  Created by Wade Belden on 9/6/21.
//

import SwiftUI

@main
struct Bill_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(bills: Bills(), incomes: Incomes(), banks: Banks())
        }
    }
}
