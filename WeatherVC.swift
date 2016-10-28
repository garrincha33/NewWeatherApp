//
//  WeatherVC.swift
//  NewWeatherApp
//
//  Created by Richard Price on 25/09/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation


class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate  {
    
    var getWeather : CurrentWeather!
    var forcast: Forcast!
    var forcasts = [Forcast]()
    
    @IBOutlet weak var dateLable: UILabel!
    
    @IBOutlet weak var tempLable: UILabel!
    
    @IBOutlet weak var cityLable: UILabel!
    
    @IBOutlet weak var weatherImg: UIImageView!
    
    @IBOutlet weak var _currentWeather: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
     
        tableView.delegate = self
        tableView.dataSource = self
        
        getWeather =  CurrentWeather()
 
        getWeather.downloadWeatherDetails {
            
            self.downloadForcastData {
                
                self.updateUI()
                
                self.tableView.reloadData()
                
            }

        }

    }
    
    func downloadForcastData(completed: @escaping DownloadComplete) {
        
        //downloading forcast weather data here
        
        let forcastURL = URL(string: FORCAST_URL)
        Alamofire.request(forcastURL!).responseJSON { response in
        
        let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        
                        let forcast = Forcast(weatherDict: obj)
                        self.forcasts.append(forcast)
                        
                        print(obj.debugDescription)
                        
                    }
                    
                    self.forcasts.remove(at: 0)
                    
                }
  
            }
            
            completed()            
        }

    }
    
    func updateUI() {
        
        dateLable.text = getWeather.date
        tempLable.text = "\(getWeather.currentTemp)"
        _currentWeather.text = "\(getWeather.weatherType)"
        cityLable.text = getWeather.cityName
        weatherImg.image = UIImage(named: getWeather.weatherType)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
 
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherCell {
            
            let forcast = forcasts[indexPath.row]
            cell.configureCell(forcast: forcast)
            return cell
 
        } else {
            
            return WeatherCell()
            
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return forcasts.count
    }

}

