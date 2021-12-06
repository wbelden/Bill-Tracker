//
//  Days.swift
//  Bill Tracker
//
//  Created by Wade Belden on 11/17/21.
//

import Foundation

//extension String {
//    func fileName() -> String{
//        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
//    }
//    func fileExtension() -> String{
//        return URL(fileURLWithPath: self).pathExtension
//    }
//}
//
//func readCSV(inputFile: String, separator: String) -> [String]{
//    let fileExtension = inputFile.fileExtension()
//    let fileName = inputFile.fileName()
//    let fileURL = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//    let inputFile = fileURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
//    do{
//        let savedData = try String(contentsOf: inputFile)
//        return savedData.components(separatedBy: separator)
//
//    } catch {
//        return ["Error file couldn't be found"]
//    }
//}

func getCSVData() -> [[String]] {
    var content = ""
    
    if let filepath = Bundle.main.path(forResource: "dates", ofType: "csv") {
        do {
            content = try String(contentsOfFile: filepath)
            print(content)
        } catch {
            print("File could not be loaded")
        }
    } else {
        print("Could not locate file")
    }
    
    var parsedCSV: [[String]] = []
    let lines: [String] = content.components(separatedBy: "\n")
    
    var i = 1
    while i < lines.count {
        let columns = lines[i].components(separatedBy: ",")
        parsedCSV.append(contentsOf: [columns])
    
        i += 1
    }
    return parsedCSV
}

func addDaysToCurrent(daysAway: Int) -> Date {
    let newDate = Calendar.current.date(byAdding: .day, value: daysAway, to: Date())!
    return newDate
}

func getDateID(date: Date) -> Int {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year,.month,.day,.weekday], from: date)
    let year: String = String(components.year!)
    var month: String = String(components.month!)
    if month.count == 1 {
        month = String("0\(month)")
    }
    var day: String = String(components.day!)
    if day.count == 1 {
        day = String("0\(day)")
    }
    let dateID = Int((year + month + day))!
    return dateID
}

func getDaysList() -> [Int]{
    var daysList: [Int]
    let currentDate = Date()
    let calendar = Calendar.current
    let components = calendar.dateComponents([.weekday], from: currentDate)
    let dayOfWeek: Int = components.weekday!
    let currentDateID = getDateID(date: addDaysToCurrent(daysAway: 0))
    
    switch dayOfWeek {
    case 1:
        let day1: Int = currentDateID
        let day2: Int = getDateID(date: addDaysToCurrent(daysAway: 1))
        let day3: Int = getDateID(date: addDaysToCurrent(daysAway: 2))
        let day4: Int = getDateID(date: addDaysToCurrent(daysAway: 3))
        let day5: Int = getDateID(date: addDaysToCurrent(daysAway: 4))
        let day6: Int = getDateID(date: addDaysToCurrent(daysAway: 5))
        let day7: Int = getDateID(date: addDaysToCurrent(daysAway: 6))
        daysList = [day1, day2, day3, day4, day5, day6, day7]
        
    case 2:
        let day1: Int = getDateID(date: addDaysToCurrent(daysAway: -1))
        let day2: Int = currentDateID
        let day3: Int = getDateID(date: addDaysToCurrent(daysAway: 1))
        let day4: Int = getDateID(date: addDaysToCurrent(daysAway: 2))
        let day5: Int = getDateID(date: addDaysToCurrent(daysAway: 3))
        let day6: Int = getDateID(date: addDaysToCurrent(daysAway: 4))
        let day7: Int = getDateID(date: addDaysToCurrent(daysAway: 5))
        daysList = [day1, day2, day3, day4, day5, day6, day7]
        
    case 3:
        let day1: Int = getDateID(date: addDaysToCurrent(daysAway: -2))
        let day2: Int = getDateID(date: addDaysToCurrent(daysAway: -1))
        let day3: Int = currentDateID
        let day4: Int = getDateID(date: addDaysToCurrent(daysAway: 1))
        let day5: Int = getDateID(date: addDaysToCurrent(daysAway: 2))
        let day6: Int = getDateID(date: addDaysToCurrent(daysAway: 3))
        let day7: Int = getDateID(date: addDaysToCurrent(daysAway: 4))
        daysList = [day1, day2, day3, day4, day5, day6, day7]
        
    case 4:
        let day1: Int = getDateID(date: addDaysToCurrent(daysAway: -3))
        let day2: Int = getDateID(date: addDaysToCurrent(daysAway: -2))
        let day3: Int = getDateID(date: addDaysToCurrent(daysAway: -1))
        let day4: Int = currentDateID
        let day5: Int = getDateID(date: addDaysToCurrent(daysAway: 1))
        let day6: Int = getDateID(date: addDaysToCurrent(daysAway: 2))
        let day7: Int = getDateID(date: addDaysToCurrent(daysAway: 3))
        daysList = [day1, day2, day3, day4, day5, day6, day7]
        
    case 5:
        let day1: Int = getDateID(date: addDaysToCurrent(daysAway: -4))
        let day2: Int = getDateID(date: addDaysToCurrent(daysAway: -3))
        let day3: Int = getDateID(date: addDaysToCurrent(daysAway: -2))
        let day4: Int = getDateID(date: addDaysToCurrent(daysAway: -1))
        let day5: Int = currentDateID
        let day6: Int = getDateID(date: addDaysToCurrent(daysAway: 1))
        let day7: Int = getDateID(date: addDaysToCurrent(daysAway: 2))
        daysList = [day1, day2, day3, day4, day5, day6, day7]
        
    case 6:
        let day1: Int = getDateID(date: addDaysToCurrent(daysAway: -5))
        let day2: Int = getDateID(date: addDaysToCurrent(daysAway: -4))
        let day3: Int = getDateID(date: addDaysToCurrent(daysAway: -3))
        let day4: Int = getDateID(date: addDaysToCurrent(daysAway: -2))
        let day5: Int = getDateID(date: addDaysToCurrent(daysAway: -1))
        let day6: Int = currentDateID
        let day7: Int = getDateID(date: addDaysToCurrent(daysAway: 1))
        daysList = [day1, day2, day3, day4, day5, day6, day7]
        
    case 7:
        let day1: Int = getDateID(date: addDaysToCurrent(daysAway: -6))
        let day2: Int = getDateID(date: addDaysToCurrent(daysAway: -5))
        let day3: Int = getDateID(date: addDaysToCurrent(daysAway: -4))
        let day4: Int = getDateID(date: addDaysToCurrent(daysAway: -3))
        let day5: Int = getDateID(date: addDaysToCurrent(daysAway: -2))
        let day6: Int = getDateID(date: addDaysToCurrent(daysAway: -1))
        let day7: Int = currentDateID
        daysList = [day1, day2, day3, day4, day5, day6, day7]
    default:
        daysList = []
    }
    return daysList
}

func getDays() -> [DayOfWeek] {
    var days: [DayOfWeek] = []
    var idArray: [Int] = []
    var yearArray: [Int] = []
    var monthArray: [Int] = []
    var dayArray: [Int] = []
    var dayOfWeekArray: [String] = []
    
    let dateIDList = getDaysList()
    let myData = getCSVData()
    
    var i = 0
    while i < myData.count {
        var j = 0
        if (Int(myData[i][0]) == dateIDList[0]) {
            while j < dateIDList.count {
                idArray.append(Int(myData[i+j][0])!)
                yearArray.append(Int(myData[i+j][1])!)
                monthArray.append(Int(myData[i+j][2])!)
                dayArray.append(Int(myData[i+j][3])!)
                dayOfWeekArray.append(String(myData[i+j][4]).replacingOccurrences(of: "\r", with: ""))
                days.append(DayOfWeek(id: idArray[j], dateYear: yearArray[j], dateMonth: monthArray[j], dateDay: dayArray[j], dayOfWeek: dayOfWeekArray[j]))
                j += 1
            }
            return days
        }
        i += 1
    }
    return days
}
    
//    let lines = readCSV(inputFile: "dates.csv", separator: "\n")
//    for line in lines {
//        linesArray.append(line)
//    }
//    print("beginning getDays()...")
//    var i = 0
//    while i < linesArray.count {
//        if i != 0 {
//            columnsArray = linesArray[i].split(separator: ",")
//            var j = 0
//            while j < columnsArray.count {
//                switch j {
//                case 0:
//                    idArray.append(Int(columnsArray[j]) ?? 00010101)
//                case 1:
//                    yearArray.append(Int(columnsArray[j]) ?? 1)
//                case 2:
//                    monthArray.append(Int(columnsArray[j]) ?? 1)
//                case 3:
//                    dayArray.append(Int(columnsArray[j]) ?? 1)
//                case 4:
//                    dayOfWeekArray.append(String(columnsArray[j]))
//                default:
//                    idArray.append(00010101)
//                    yearArray.append(0001)
//                    monthArray.append(01)
//                    dayArray.append(01)
//                    dayOfWeekArray.append("Sunday")
//                }
//                j += 1
//            }
//            days.append(DayOfWeek(id: idArray[i], dateYear: yearArray[i], dateMonth: monthArray[i], dateDay: dayArray[i], dayOfWeek: dayOfWeekArray[i]))
//        }
//        i += 1
//    }
//    print("idArray[0] contains \(idArray[0])")
//    print("yearArray[0] contains \(yearArray[0])")
//    print("monthArray[0] contains \(monthArray[0])")
//    print("dayArray[0] contains \(dayArray[0])")
//    print("dayOfWeekArray[0] contains \(dayOfWeekArray[0])")
//    print("days[0] contains \(days[0])")
//    print("end getDays()...")
//return days
//}

class Days: ObservableObject {
    let days: [DayOfWeek]
    
    init() {
        days = getDays()
    }
    
    var start: DayOfWeek {
        days[0]
    }
}
