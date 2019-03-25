//
//  GlobalData.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Foundation

import UIKit

struct GlobalData {
    
    static let backgroundColor: UIColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let skyBlueColor: UIColor =  UIColor(displayP3Red: 64/255, green: 152/255, blue: 197/255, alpha: 1)
    static let darkBlueColor: UIColor = UIColor(displayP3Red: 0/255, green: 23/255, blue: 90/255, alpha: 1)
    static let greenColor: UIColor =  UIColor(displayP3Red: 93/255, green: 189/255, blue: 132/255, alpha: 1)
    static let creamRedColor: UIColor =  UIColor(displayP3Red: 224/255, green: 106/255, blue: 88/255, alpha: 1)
    //static let navigationMainColor: UIColor = UIColor(displayP3Red: 139/255, green: 0/255, blue: 0/255, alpha: 1)
    // green static let navigationMainColor: UIColor = UIColor(displayP3Red: 46/255, green: 150/255, blue: 105/255, alpha: 1)
    static let navigationMainColor: UIColor = UIColor(displayP3Red: 65/255, green: 29/255, blue: 99/255, alpha: 1)
    static let lightGray: UIColor = UIColor(displayP3Red: 239/255, green: 240/255, blue: 241/255, alpha: 1)
    static let collectionViewCellID: String = "masjid786"
    static let collectionViewHeaderID: String = "masjidheader786"
    static let dashboardCellContents = [ DashboardCellContent(dashbordCellLable: "Ramadan Schedule", dashbordCellImage: "ramadan"),
                                         DashboardCellContent(dashbordCellLable: "Zakat Calculator", dashbordCellImage: "donate"),
                                         DashboardCellContent(dashbordCellLable: "Ramadan Checklist", dashbordCellImage: "checklist"),
                                         DashboardCellContent(dashbordCellLable: "Events & News", dashbordCellImage: "events"),
                                         DashboardCellContent(dashbordCellLable: "Masjids in Arizona", dashbordCellImage: "masjid"),
                                         DashboardCellContent(dashbordCellLable: "Hadith of the Day", dashbordCellImage: "book"),
    ]
    
    static let ramadanScheduleMain = [ RamadanShedule(ashra: "Ramada Ashra-1", ashrName:"Mercy of Allah (Rehmah)",  dates: "May 6th to May 15th"),
                                       RamadanShedule(ashra: "Ramada Ashra-2", ashrName:"Forgiveness of Allah (Maghfirah)", dates: "May 16th to May 25th"),
                                       RamadanShedule(ashra: "Ramada Ashra-3", ashrName: "Safety from the Hell (Nijat)", dates: "May 26th to June 03rd")]
    
    static let zakatFormFileds = [ "Value of total GOLD", "Value of total SILVER", "CASH in Hand", "CASH in Bank Account",
                                   "CASH in Business", "Rental Income", "Property Value", "Stocks Value", "Debts to Family Value", "Debts to Others Value",
                                   "Credit card payments", "Home Payments", "Car payments", "Business payments"
    ]
    
    static let zakatSectioNames = [  "Gold & Silver", "Cash & Property", "Debts & Liabilities"]
    
    static let daily = ["Wake up for Suhoor", "Pray Sunnah prayers", "Pray Taraweeh at the masjid", "Read the Qur’an", "Understand the translation", "Make Dua and Dhikr", "Do Istighfar", "Do Sadaqa", "Help someone in need",   ]
    static let weekly = ["Visit the Elderly/Sick", "Feed the less fortunate", "Participate in Sermons", "Memorize a Surah", "Learn new Duas" ]
    static let monthly = ["Finish the Qur’an", "Give Zakat", "Do Dawah", "Mend Relationships", "Become a better muslim", "Give fitra before Eid Prayer"  ]
}
