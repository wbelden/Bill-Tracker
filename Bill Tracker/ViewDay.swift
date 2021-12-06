//
//  ViewBills.swift
//  Bill Tracker
//
//  Created by Wade Belden on 11/28/21.
//

import SwiftUI

func getDateString(dateID: Int) -> String {
    let str = String(dateID)
    let start = str.startIndex
    let startYear = str.index(start, offsetBy: 0)
    let endYear = str.index(start, offsetBy: 4)
    let year = str[startYear..<endYear]
    
    let startMonth = str.index(start, offsetBy: 4)
    let endMonth = str.index(start, offsetBy: 6)
    let month = str[startMonth..<endMonth]
    
    let startDay = str.index(start, offsetBy: 6)
    let endDay = str.index(start, offsetBy: 8)
    let day = str[startDay..<endDay]
    
    return String("\(month)/\(day)/\(year)")
}

func getIncomesList(day: DayOfWeek, incomes: [Income]) -> [Income]{
    var incomesList: [Income] = []
    for income in incomes {
        if income.payDate == day.id {
            incomesList.append(income)
        }
     }
    return incomesList
}

func getBillsList(day: DayOfWeek, bills: [Bill]) -> [Bill]{
    var billsList: [Bill] = []
    for bill in bills {
        if bill.dueDate == day.id {
            billsList.append(bill)
        }
     }
    return billsList
}

struct ViewDay: View {
    let day: DayOfWeek
    @ObservedObject var bills: Bills
    @ObservedObject var incomes: Incomes
    
    
    func removeBills(at offsets: IndexSet) {
        bills.bills.remove(atOffsets: offsets)
        bills.writeBillsToJSON(bills: bills)
    }
    
    func removeIncomes(at offsets: IndexSet) {
        incomes.incomes.remove(atOffsets: offsets)
        incomes.writeIncomesToJSON(incomes: incomes)
    }
    
    var body: some View {
        let billsList: [Bill] = getBillsList(day: day, bills: bills.bills)
        let incomesList: [Income] = getIncomesList(day: day, incomes: incomes.incomes)
        VStack {
            Text("\(day.dayOfWeek)")
                .font(.title)
            Text("\(getDateString(dateID: day.id))")
                
            Spacer()
                VStack {
                    List {
                        Section {
                            Text("Bills Due")
                        ForEach(billsList, id:\.name) { bill in
                            HStack {
                                Spacer()
                                Text(bill.name)
                                Spacer()
                                Text(bill.company)
                                Spacer()
                                Text(getDateString(dateID: bill.dueDate))
                                Spacer()
                                Text(String(bill.amount))
                                Spacer()
                            }
                        }
                        .onDelete(perform: removeBills)
                        }
                        Section {
                            Text("Income")
                        ForEach(incomesList, id: \.name) { income in
                            HStack {
                                Spacer()
                                Text(income.name)
                                Spacer()
                                Text(getDateString(dateID: income.payDate))
                                Spacer()
                                Text(String(income.amount))
                                Spacer()
                            }
                        
                        }
                        .onDelete(perform: removeIncomes)
                        }
                        }
                    }
                }
                Spacer()
            }
}



struct ViewDay_Previews: PreviewProvider {
    static var previews: some View {
        ViewDay(day: Days().days[0], bills: Bills(), incomes: Incomes())
    }
}
