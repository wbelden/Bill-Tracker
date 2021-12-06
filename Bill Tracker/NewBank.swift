//
//  NewBank.swift
//  Bill Tracker
//
//  Created by Wade Belden on 11/28/21.
//

import SwiftUI

func createBank(banks: Banks, name: String, balance: Float) {
    banks.banks.append(Bank(name: name, balance: balance))
    banks.writeBanksToJSON(banks: banks)
}

struct NewBank: View {
    let numberFormatter = numFormatter()
    
    @ObservedObject var banks: Banks
    
    @State var name: String = ""
    @State var balance: Float = 0.00
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Swipe Down to Cancel")
                .font(.caption)
                .padding()
            Text("New Bank")
                .font(.title)
            Spacer()
            Form {
                Section {
                    TextField("Bank Name", text: $name)
                }
                Section {
                    TextField("Balance", value: $balance, formatter: numberFormatter)
                }
            }
            .padding(.bottom)
            Button("Create Bank") {
                createBank(banks: banks, name: name, balance: balance)
                presentationMode.wrappedValue.dismiss()
            }.buttonStyle(BlueButton())
            Spacer()
        }
    }
}

struct NewBank_Previews: PreviewProvider {
    static var previews: some View {
        NewBank(banks: Banks())
    }
}
