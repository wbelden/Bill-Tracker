//
//  NewBill.swift
//  Bill Tracker
//
//  Created by Wade Belden on 11/28/21.
//


import SwiftUI

func createBill(bills: Bills, name: String, company: String, dueDate: Date, amount: Float) {
    let dateID = getDateID(date: dueDate)
    bills.bills.append(Bill(name: name, amount: amount, dueDate: dateID, company: company))
    bills.writeBillsToJSON(bills: bills)
}

func numFormatter() -> NumberFormatter { 
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 2
    numberFormatter.numberStyle = .currency
    return numberFormatter
}

struct NewBill: View {
    let numberFormatter = numFormatter()
    
    @ObservedObject var bills: Bills
    
    @State var name: String = ""
    @State var company: String = ""
    @State var dueDate: Date = Date()
    @State var amount: Float = 0.00
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        VStack {
            Text("Swipe Down to Cancel")
                .font(.caption)
                .padding()
            Text("New Bill")
                .font(.title)
            Spacer()
            Form {
                Section {
                    TextField("Bill Name", text: $name)
                }
                Section {
                    TextField("Company", text: $company)
                }
                Section {
                    DatePicker("Date Due", selection: $dueDate, displayedComponents: .date)
                }
                Section {
                    TextField("Amount", value: $amount, formatter: numberFormatter)
                }
            }
            .padding(.bottom)
            Button("Create Bill") {
                createBill(bills: bills, name: name, company: company, dueDate: dueDate, amount: amount)
                presentationMode.wrappedValue.dismiss()
            }.buttonStyle(BlueButton())
            Spacer()
        }
    }
}

struct NewBill_Previews: PreviewProvider {
    static var previews: some View {
        NewBill(bills: Bills())
    }
}
