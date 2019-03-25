//
//  CityListModle.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/17/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Foundation

class CityListModle {
    var cityName: String?
    var masjidCount: UInt?
    
    init(cityName: String?, masjidCount: UInt?){
        self.cityName = cityName
        self.masjidCount = masjidCount
    }
}
