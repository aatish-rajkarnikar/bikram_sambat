//
//  NPDate.swift
//  BikramSambat
//
//  Created by Aatish Rajkarnikar on 11/4/16.
//  Copyright © 2016 iOSHub. All rights reserved.
//

import Foundation

enum Weekday:Int{
    case Sunday = 1
    case Monday = 2
    case Tuesday = 3
    case Wednesday = 4
    case Thrusday = 5
    case Friday = 6
    case Saturday = 7
}

struct NPDate {
    var day:Int
    var month:Int
    var year:Int
    var weekDay:Weekday
    var gregorianDate:Date
}
