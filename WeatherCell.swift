//
//  WeatherCell.swift
//  NewWeatherApp
//
//  Created by Richard Price on 27/10/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var dayLbl: UILabel!
    
    @IBOutlet weak var weatherType: UILabel!
    
    @IBOutlet weak var highTemp: UILabel!
    
    @IBOutlet weak var lowTemp: UILabel!
    
    
    
    func configureCell(forcast: Forcast) {
        
        lowTemp.text = "\(forcast.lowTemp)"
        highTemp.text = "\(forcast.highTemp)"
        weatherType.text = forcast.weatherType
        dayLbl.text = forcast.date
        weatherIcon.image = UIImage(named: forcast.weatherType)
 
    }
  
}
