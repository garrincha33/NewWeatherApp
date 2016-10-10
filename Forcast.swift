//
//  Forcast.swift
//  NewWeatherApp
//
//  Created by Richard Price on 06/10/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import Foundation
import Alamofire

class Forcast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date : String {
        
        if _date == nil {
            
            _date = "nothing to return"
            
        }
        
        return _date
        
    }
    
    var weatherType: String {
        
        if _weatherType == nil {
            
            _weatherType = "nothing to return"
            
        }
        
        return _weatherType
 
    }
    
    var highTemp: String {
        
        if _highTemp == nil {
            
            _highTemp = "nothing to return"
            
        }
        
        return _highTemp
        
    }
    
    var lowTemp: String {
        
        if _lowTemp == nil {
            
            _lowTemp = "nothing to return"
            
        }
        
        return _lowTemp
        
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                
                let kelvinToCelcius = Double(round(min - 273.15))
                
                self._lowTemp = "\(kelvinToCelcius)"
                
            }
            
            if let max = temp["max"] as? Double {
                
                let kelvinToCelcius = Double(round(max - 273.15))
                
                self._highTemp = "\(kelvinToCelcius)"
                
            }
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                
                self._weatherType = main
                
            }
            
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.daysOfTheWeek()
            
        }
        
    }
    
}

extension Date {
    
    func daysOfTheWeek() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
}
