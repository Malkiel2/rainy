//
//  Location.swift
//  RainyShinyCloudy
//
//  Created by Malkiel Shaul on 27.4.2017.
//  Copyright © 2017 Malkiel Shaul. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
    
}
