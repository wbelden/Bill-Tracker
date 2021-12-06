//
//  ContentView.swift
//  Bill Tracker
//
//  Created by Wade Belden on 9/6/21.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 120, height: 35)
            .background(Color.blue)
            .foregroundColor(.white)
            .border(.black)
            .clipShape(Capsule())
    }
}

//func estimateBalance(isBill: Bool, balance: Float, itemAmount: Float) -> Float {
//    var estimatedBalance = balance
//    if isBill {
//        estimatedBalance -= itemAmount
//    } else {
//        estimatedBalance += itemAmount
//    }
//    return estimatedBalance
//}

func getBankName(banks: [Bank], bank: Bank) -> String {
    if banks.isEmpty {
        return "No Banks Created"
    }
    return "\(bank.name)"
}

func getBankBalance(banks: [Bank], bank: Bank) -> String {
    if banks.isEmpty {
        return "-"
    }
    return "\(bank.balance)"
}



struct ContentView: View {
    let days = getDays()
    @ObservedObject var bills: Bills
    @ObservedObject var incomes: Incomes
    @ObservedObject var banks: Banks
    @State var updatedBalance: Float = 0.00
    @State var showingNewBill = false
    @State var showingNewIncome = false
    @State var showingNewBank = false
    @State var showingViewBanks = false
    @State var showingViewBills = false
    @State var showingViewIncomes = false
    
    
    func removeRows(at offsets: IndexSet) {
        banks.banks.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    Text("Bill Tracker")
                        .font(.title)
                        .padding()
                    ForEach(banks.banks, id: \.name) { bank in
                        HStack {
                            
                            Text(getBankName(banks: banks.banks, bank: bank))
                            Spacer()
                            Text("$\(getBankBalance(banks: banks.banks, bank: bank))")
                            
                        }.font(.title3)
                        
                    }
                    .padding(.trailing, 30)
                    .padding(.leading, 30)
                }
                
                    //Edit Banks Button
//                HStack {
//                    Spacer()
//                    Button ("Edit Banks") {
//                        showingViewBanks.toggle()
//                    }
//                    .sheet(isPresented: $showingViewBanks){
//                        ViewBanks(banks: banks)
//                    }
//                    .padding(.leading, 0)
//                    Spacer()
//                }
//                .padding(.bottom)
                
                
                List {
                    ForEach(days){ day in
                        NavigationLink(destination: ViewDay(day: day, bills: bills, incomes: incomes)) {
                            Text("\(day.dayOfWeek)\n\(day.dateMonth)/\(day.dateDay)")
                                .font(.title3)
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 12, leading: 25, bottom: 12, trailing: 30))
                }
                .listStyle(PlainListStyle())
                
                HStack{
                        Button ("New Bill") {
                            showingNewBill.toggle()
                        }
                        .buttonStyle(BlueButton())
                        .sheet(isPresented: $showingNewBill){
                            NewBill(bills: bills)
                        }
                        Button("New Income") {
                            showingNewIncome.toggle()
                        }
                        .buttonStyle(BlueButton())
                        .sheet(isPresented: $showingNewIncome){
                            NewIncome(incomes: incomes)
                        }
                        
                    
                        Button ("New Bank") {
                            showingNewBank.toggle()
                        }
                        .buttonStyle(BlueButton())
                        .sheet(isPresented: $showingNewBank){
                            NewBank(banks: banks)
                    }
                }
                .padding(10)
                HStack{
                    Button ("View Bills") {
                        showingViewBills.toggle()
                    }
                    .buttonStyle(BlueButton())
                    .sheet(isPresented: $showingViewBills){
                        ViewBills(bills: bills)
                    }
                    Button("View Incomes") {
                        showingViewIncomes.toggle()
                    }
                    .buttonStyle(BlueButton())
                    .sheet(isPresented: $showingViewIncomes){
                        ViewIncomes(incomes: incomes)
                    }
                        
                    Button ("View Banks") {
                        showingViewBanks.toggle()
                    }
                    .buttonStyle(BlueButton())
                    .sheet(isPresented: $showingViewBanks){
                        ViewBanks(banks: banks)
                    }
                }
                .padding(.bottom, 10)
            }
        
        .navigationBarTitle("Bill Tracker", displayMode: .inline)
        .navigationBarHidden(true)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bills: Bills(), incomes: Incomes(), banks: Banks())
    }
}
