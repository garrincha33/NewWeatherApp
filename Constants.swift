//
//  Constants.swift
//  NewWeatherApp
//
//  Created by Richard Price on 25/09/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import Foundation

let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?"
let URL_LATITUDE = "lat="
let URL_LONGITUDE = "&lon="
let API_KEY = "a76e4213bd475968fb90bc25908f1686"
let API_ID = "&appid="
let CURRENT_WEATHER_URL = "\(URL_BASE)\(URL_LATITUDE)51.5126040\(URL_LONGITUDE)-3.1166950\(API_ID)\(API_KEY)"
let FORCAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=51.5126040&lon=-3.1166950&cnt=10&mode=json&appid=a76e4213bd475968fb90bc25908f1686"

typealias DownloadComplete = () -> ()

func kelvinToCelcius(temp: Double) -> Double {
 
    round(temp - 273.15)
   
    return temp
    
}




