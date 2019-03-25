//
//  PrayerTimeViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/23/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import Adhan
import CoreLocation

class PrayerTimeViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var latitude = 0.0
    var longitude = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    
        guard let locationValue: CLLocationCoordinate2D = manager.location?.coordinate else{
            return
        }
        
        print("My Location = \(locationValue.latitude) and \(locationValue.longitude)")
        
        latitude = Double(locationValue.latitude)
        longitude = Double(locationValue.longitude)
        
        let locationWithLatadLong = CLLocation(latitude: latitude, longitude: longitude)
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(locationWithLatadLong) { (placemarks, err) in
            if let placemark = placemarks?[0] {
                print("Inside")
                print(placemark.timeZone as Any)
                print(placemark.country as Any)
            }
        }
        
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let date = cal.dateComponents([.year, .month, .day], from: Date())
        let coordinates = Coordinates(latitude: latitude, longitude: longitude)
        var params = CalculationMethod.karachi.params
        params.madhab = .hanafi
        if let prayers = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params) {
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.timeZone = TimeZone(identifier: "America/Phoenix")!
            
            print("fajr \(formatter.string(from: prayers.fajr))")
            print("sunrise \(formatter.string(from: prayers.sunrise))")
            print("dhuhr \(formatter.string(from: prayers.dhuhr))")
            print("asr \(formatter.string(from: prayers.asr))")
            print("maghrib \(formatter.string(from: prayers.maghrib))")
            print("isha \(formatter.string(from: prayers.isha))")
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
