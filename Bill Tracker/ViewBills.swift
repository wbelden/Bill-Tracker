//
//  EditBills.swift
//  Bill Tracker
//
//  Created by Wade Belden on 11/30/21.
//

import SwiftUI

struct ViewBills: View {
    @ObservedObject var bills: Bills
    
    func removeRows(at offsets: IndexSet) {
        bills.bills.remove(atOffsets: offsets)
        bills.writeBillsToJSON(bills: bills)
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
                            Text("Bill Name")
                            Spacer()
                            
                            Spacer()
                            Text("Balance")
                        }
                        ForEach(bills.bills, id:\.name) { bill in
                            HStack {
                                Text(bill.name)
                                Spacer()
                                Text(bill.company)
                                Spacer()
                                Text(getDateString(dateID: bill.dueDate))
                                Spacer()
                                Text(String(bill.amount))
                            }
                        }
                        .onDelete(perform: removeRows)
                        }
                    .listStyle(PlainListStyle())
                    .toolbar{EditButton()}
                    }
                
                .navigationBarTitle("Edit Bills", displayMode: .inline)
                }
        }
    }
}

struct ViewBills_Previews: PreviewProvider {
    static var previews: some View {
        ViewBills(bills: Bills())
    }
}
