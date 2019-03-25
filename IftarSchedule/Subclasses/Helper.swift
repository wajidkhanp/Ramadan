//
//  Helper.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Foundation
import UIKit
import Adhan

class Helper {
    static var app: Helper = {
        return Helper()
    }()
    
    func dateFormatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        let now = date
        let dateString = formatter.string(from:now)
        return dateString
    }

    func datetoString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from: date)
        return newDate
    }
    
    func daysLeftforRamadan(ramadanDate: String) -> String {
        
        var daysLeftMessage: String = ""
        let futureDate = ramadanDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formatedStartDate = dateFormatter.date(from: futureDate)
        let currentDate = Date()
        let differenceOfDate = Calendar.current.dateComponents([.day], from: currentDate , to: formatedStartDate!).day!

        if (differenceOfDate <= 0){
             daysLeftMessage = " Ramadan is here. Best time to supplicate is now"
        } else {
             daysLeftMessage = " Ramadan will start in \(differenceOfDate) days "
        }
       return daysLeftMessage
    }
    
    func prayerTimes() -> SalatTimings {
        
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let date = cal.dateComponents([.year, .month, .day], from: Date())
        let coordinates = Coordinates(latitude: 33.448376, longitude: -112.074036)
        var params = CalculationMethod.karachi.params
        var salathTimes: SalatTimings = SalatTimings(fazar: "", sunrise: "", zohar: "", asar: "", magrib: "", isha: "")
        params.madhab = .hanafi
        if let prayers = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params) {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            formatter.timeZone = TimeZone(identifier: "America/Phoenix")!
            salathTimes = SalatTimings(fazar: formatter.string(from: prayers.fajr), sunrise: formatter.string(from: prayers.sunrise), zohar: formatter.string(from: prayers.dhuhr), asar: formatter.string(from: prayers.asr), magrib: formatter.string(from: prayers.maghrib), isha: formatter.string(from: prayers.isha))
        }
        
        return salathTimes
        
    }

}
