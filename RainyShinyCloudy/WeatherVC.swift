//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by Malkiel Shaul on 24.4.2017.
//  Copyright © 2017 Malkiel Shaul. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather.downloadWeatherDetails {
            self.updateMainUI()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80.0 //Choose your custom row height
    }
    
    func updateMainUI() {
        
        dateLabel.text = currentWeather.date
        currentTempLabel.text = String(currentWeather.currentTemp)
        locationLabel.text = currentWeather.cityName
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: "Rain")
        
    }


}

