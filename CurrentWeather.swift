//
//  CurrentWeather.swift
//  NewWeatherApp
//
//  Created by Richard Price on 25/09/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        
        if _cityName == nil {
            
            _cityName = "Nothing To Return"
            
        }
        
        return _cityName
        
    }
    
    var date: String {
        
        if _date == nil {
            
            _date = "nothing to return"
            
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today \(currentDate)"
        return _date
        
    }
    
    var weatherType: String {
        
        if _weatherType == nil {
            
            _weatherType = "nothing to return"
            
        }
        
        return _weatherType
        
    }
    
    var currentTemp: Double {
        
        if _currentTemp == nil {
            
            _currentTemp = 0.0
            
        }
        
        return _currentTemp
        
    }

}
