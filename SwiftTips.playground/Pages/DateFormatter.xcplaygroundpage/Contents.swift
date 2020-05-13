//: [Previous](@previous)

// DateFormatter

import Foundation
import UIKit

enum DateFormatterMethod: String, CaseIterable {
    
//    case YYYY = "YYYY"
//    case YYY = "YYY"
//    case YY = "YY"
//    case Y = "Y"
//    case yyyy = "yyyy"
//    case yyy = "yyy"
//    case yy = "yy"
//    case y = "y"
//
//    case MMMM = "MMMM"
//    case MMM = "MMM"
//    case MM = "MM"
//    case M = "M"
//
//
//    case DDDD = "DDDD"
//    case DDD = "DDD"
//    case DD = "DD"
//    case D = "D"
//    case dddd = "dddd"
//    case ddd = "ddd"
//    case dd = "dd"
//    case d = "d"
//
//    case EEEEE = "EEEEE"
//    case EEEE = "EEEE"
//    case EEE = "EEE"
//    case EE = "EE"
//    case E = "E"
//
//    case HHHH = "HHHH"
//    case HHH = "HHH"
//    case HH = "HH"
//    case H = "H"
//    case hhhh = "hhhh"
//    case hhh = "hhh"
//    case hh = "hh"
//    case h = "h"
//
//    case mmmm = "mmmm"
//    case mmm = "mmm"
//    case mm = "mm"
//    case m = "m"
//
//    case SSSS = "SSSS"
//    case SSS = "SSS"
//    case SS = "SS"
//    case S = "S"
//    case ssss = "ssss"
//    case sss = "sss"
//    case ss = "ss"
//    case s = "s"
    
    case YMD_default = "yyyy年M月d日" // date_d1
    case YMD_default_en = "d MMM yyyy" // date_d1 en
    case YMD = "yyyy-MM-dd"         // date_d2
    case YM = "yyyy年M月"       // date_d3
    case YM_en = "MMM yyyy"       // date_d3_en

    case date_short = "M月d日"      // date_s
    case date_short_en = "d MMM" // date_s_en

    case week_default = "EEEE"     // week_d

    case week_short = "EEEEE"          // week_s
    case week_short_en = "EEE"          // week_s
    
    case time_default = "aa hh:mm:ss"     // time_d 12/24小时制
    case time_default_en = "hh:mm:ss aa"     // time_d 12/24小时制

    case time_short = "aa hh:mm"     // time_s 12/24小时制
    case time_short_en = "hh:mm aa"     // time_s 12/24小时制

    case datetime_default = "yyyy年M月d日 aa hh:mm"     // datetime_d 12/24小时制
    case datetime_default_en = "d MMM yyyy hh:mm aa"     // datetime_d 12/24小时制

    case datetime_short = "M月d日 aahh:mm"           // datetime_s 12/24小时制
    case datetime_short_en = "d MMM hh:mm aa"           // datetime_s 12/24小时制

    case MDWs = "M月d日(EEEEE)"        // dateweek_s
    case MDWs_en = "EEE, d MMM"        // dateweek_s

    case MDWd = "yyyy年M月d日(EEEEE)"        // dateweek_d
    case MDWd_en = "EEE, d MMM yyyy"        // dateweek_d

    case datetime_with_week = "yyyy年M月d日(EEEEE) aa hh:mm" // dataweektime_d
    case datetime_with_week_en = "EEE, d MMM yyyy hh:mm aa" // dataweektime_d

    case datetime_short_with_week = "M月d日(EEEEE) aa hh:mm" // dataweektime_s
    case datetime_short_with_week_en = "EEE, d MMM hh:mm aa" // dataweektime_s

}

let dateFormatter:DateFormatter = DateFormatter()
let endateFormatter:DateFormatter = DateFormatter()

let date = Date()
print("\(date)")

for caseName in DateFormatterMethod.allCases {

    dateFormatter.dateFormat = caseName.rawValue
    
    endateFormatter.dateFormat = caseName.rawValue

    let caseString = String(describing: caseName)
    
//    if caseString.hasSuffix("_en") {
//        dateFormatter.locale = NSLocale.init(localeIdentifier: "en_US") as Locale
//
//    }else{
//        dateFormatter.locale = NSLocale.init(localeIdentifier: "cn_hant") as Locale
//    }
   
        
    endateFormatter.locale = NSLocale.init(localeIdentifier: "en_US") as Locale
    let enString = endateFormatter.string(from: date)
    print("")
    dateFormatter.locale = NSLocale.init(localeIdentifier: "zh_hant") as Locale
    let dateString = dateFormatter.string(from: date)
    print("")

    print("""
    ---- \(caseName) : \(caseName.rawValue)----
    \(enString)
    \(dateString)
    """)
}
//: [Next](@next)
