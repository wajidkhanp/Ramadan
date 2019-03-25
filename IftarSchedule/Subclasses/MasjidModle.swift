//
//  MasjidModle.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/17/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Foundation

struct MasjidModle {
    var name: String?
    var address: String?
    var contact: String?
    var weblink: String?
    
    init(name: String?, address: String?, contact: String?, weblink: String){
        self.name = name
        self.address = address
        self.contact = contact
        self.weblink = weblink
    }
}

struct DashboardCellContent {
    let dashbordCellLable: String?
    let dashbordCellImage: String?
    
}

struct IslamicDates {
    var date: String?
    var event: String?
    var islamicDay: String?
    
    init(date: String?, event: String?, islamicDay: String?){
        self.date = date
        self.event = event
        self.islamicDay = islamicDay
    }
}

struct RamadanShedule {
    var ashra: String?
    var ashrName: String?
    var dates: String?
    
    init(ashra: String?, ashrName: String?, dates: String?){
        self.ashra = ashra
        self.ashrName = ashrName
        self.dates = dates
    }
}

struct AshraDetails {
    var day: String?
    var sehar: String?
    var iftar: String?
    
    init(day: String?, sehar: String?, iftar: String?){
        self.day = day
        self.sehar = sehar
        self.iftar = iftar
    }
}

struct ZakatInput  {
    static var details: ZakatInput = ZakatInput()
    var gold: Double = 0.0
    var silver: Double = 0.0
    var cashinhand: Double = 0.0
    var cashinbank: Double = 0.0
    var cashinbusiness: Double = 0.0
    var rentalincome: Double = 0.0
    var propertvalue: Double = 0.0
    var stockvalue: Double = 0.0
    var debtstofamily: Double = 0.0
    var debtstoothers: Double = 0.0
    var creditcardpayments: Double = 0.0
    var homepayment: Double = 0.0
    var carpayment: Double = 0.0
    var businesspayment: Double = 0.0
}


struct SalatTimings  {
     var fazar: String?
     var sunrise: String?
     var zohar: String?
     var asar: String?
     var magrib: String?
     var isha: String?
   
    init(fazar: String?, sunrise: String?, zohar: String?, asar: String?, magrib: String?, isha: String?){
        self.fazar = fazar
        self.sunrise = sunrise
        self.zohar = zohar
        self.asar = asar
        self.magrib = magrib
        self.isha = isha
    }
}
