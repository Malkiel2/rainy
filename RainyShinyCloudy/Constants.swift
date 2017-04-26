//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Malkiel Shaul on 25.4.2017.
//  Copyright © 2017 Malkiel Shaul. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "691c62d6d0210b03c3c14a6bf24887c6"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"
