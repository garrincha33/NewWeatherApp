//
//  Location.swift
//  NewWeatherApp
//
//  Created by Richard Price on 28/10/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import Foundation
import CoreLocation


class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!

}
