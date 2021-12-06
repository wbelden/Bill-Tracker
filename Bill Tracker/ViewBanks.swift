//
//  EditBanks.swift
//  Bill Tracker
//
//  Created by Wade Belden on 11/30/21.
//

import SwiftUI



struct ViewBanks: View {
    @ObservedObject var banks: Banks
    
    func removeRows(at offsets: IndexSet) {
        banks.banks.remove(atOffsets: offsets)
        banks.writeBanksToJSON(banks: banks)
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
                            Text("Bank Name")
                            Spacer()
                            Text("Balance")
                        }
                        ForEach(banks.banks, id:\.name) { bank in
                            HStack {
                                Text(bank.name)
                                Spacer()
                                Text(String(bank.balance))
                            }
                        }
                        .onDelete(perform: removeRows)
                        }
                    .listStyle(PlainListStyle())
                    .toolbar{EditButton()}
                    }
                
                .navigationBarTitle("Edit Banks", displayMode: .inline)
                }
        }
    }
}

struct ViewBanks_Previews: PreviewProvider {
    static var previews: some View {
        ViewBanks(banks: Banks())
    }
}

