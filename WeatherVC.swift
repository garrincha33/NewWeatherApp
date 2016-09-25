//
//  WeatherVC.swift
//  NewWeatherApp
//
//  Created by Richard Price on 25/09/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import UIKit


class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dateLable: UILabel!
    
    @IBOutlet weak var tempLable: UILabel!
    
    @IBOutlet weak var cityLable: UILabel!
    
    @IBOutlet weak var weatherImg: UIImageView!
    
    @IBOutlet weak var currentWeather: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print(CURRENT_WEATHER_API)
 
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
 
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return 6
    }

}

