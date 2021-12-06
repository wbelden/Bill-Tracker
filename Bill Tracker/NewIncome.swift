//
//  NewIncome.swift
//  Bill Tracker
//
//  Created by Wade Belden on 11/28/21.
//

import SwiftUI

func createIncome(incomes: Incomes, name: String, payDate: Date, amount: Float) {
    let dateID = getDateID(date: payDate)
    incomes.incomes.append(Income(name: name, amount: amount, payDate: dateID))
    incomes.writeIncomesToJSON(incomes: incomes)
}

struct NewIncome: View {
    let numberFormatter = numFormatter()
    
    @ObservedObject var incomes: Incomes
    
    @State var name: String = ""
    @State var amount: Float = 0.00
    @State var payDate: Date = Date()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Swipe Down to Cancel")
                .font(.caption)
                .padding()
            Text("New Income")
                .font(.title)
            Spacer()
            Form {
                Section {
                    TextField("Income Name", text: $name)
                }
                Section {
                    DatePicker("Pay Date", selection: $payDate, displayedComponents: .date)
                }
                Section {
                    TextField("Amount", value: $amount, formatter: numberFormatter)
                }
            }
            .padding(.bottom)
            Button("Create Income") {
                createIncome(incomes: incomes, name: name, payDate: payDate, amount: amount)
                presentationMode.wrappedValue.dismiss()
            }.buttonStyle(BlueButton())
            Spacer()
        }
    }
}

struct NewIncome_Previews: PreviewProvider {
    static var previews: some View {
        NewIncome(incomes: Incomes())
    }
}
