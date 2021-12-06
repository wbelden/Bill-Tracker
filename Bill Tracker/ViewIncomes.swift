//
//  ViewIncomes.swift
//  Bill Tracker
//
//  Created by Wade Belden on 11/30/21.
//

import SwiftUI

struct ViewIncomes: View {
    @ObservedObject var incomes: Incomes
    
    func removeRows(at offsets: IndexSet) {
        incomes.incomes.remove(atOffsets: offsets)
        incomes.writeIncomesToJSON(incomes: incomes)
    }
                               
    var body: some View {
        VStack {
            Text("Swipe Down to Cancel")
                .font(.caption)
                .padding()
            NavigationView {
                VStack {
                    List {
                        HStack{
                            Text("Income Name")
                            Spacer()
                            Text("Pay Date")
                            Spacer()
                            Text("Balance")
                        }
                        ForEach(incomes.incomes, id:\.name) { income in
                            HStack {
                                Text(income.name)
                                Spacer()
                                Text(getDateString(dateID: income.payDate))
                                Spacer()
                                Text(String(income.amount))
                            }
                        }
                        .onDelete(perform: removeRows)
                        }
                    .listStyle(PlainListStyle())
                    .toolbar{EditButton()}
                    }
                
                .navigationBarTitle("Edit Incomes", displayMode: .inline)
                }
        }
    }
}

struct ViewIncomes_Previews: PreviewProvider {
    static var previews: some View {
        ViewIncomes(incomes: Incomes())
    }
}
