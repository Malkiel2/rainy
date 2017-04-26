//
//  CurrentWeather.swift
//  RainyShinyCloudy
//
//  Created by Malkiel Shaul on 26.4.2017.
//  Copyright © 2017 Malkiel Shaul. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    


    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        //Alamofire download
        let currentWeatherUrl = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=-31&lon=123&appid=691c62d6d0210b03c3c14a6bf24887c6")!
       // let currentWeatherUrl = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherUrl).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {

                        
                        let kelvinToCel = currentTemperature - 273.15
                        self._currentTemp = kelvinToCel
                        print(currentTemperature)
                    }
                }
                
            }
            completed()
        }
        
    }
  

}
