//: [Previous](@previous)

import Foundation

var jsonString = """
    {
            "setting_id": "2222",
            "name": "08月02日-08月08日",
            "schedule_list": [
                {
                    "weekday": "2",
                    "weekday_text": "(二)",
                    "setdate": "2021-08-03",
                    "is_holiday": 0,
                    "category_item": [
                        {
                            "category_id": "1",
                            "category_text": "早更",
                            "period_item": [
                                {
                                    "type_name": "B",
                                    "period_id": "178",
                                    "period_time": "0:00-5:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        },
                        {
                            "category_id": "2",
                            "category_text": "晚更",
                            "period_item": [
                                {
                                    "type_name": "C",
                                    "period_id": "179",
                                    "period_time": "19:00-03:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        }
                    ]
                },
                {
                    "weekday": "3",
                    "weekday_text": "(三)",
                    "setdate": "2021-08-04",
                    "is_holiday": 0,
                    "category_item": [
                        {
                            "category_id": "1",
                            "category_text": "早更",
                            "period_item": [
                                {
                                    "type_name": "B",
                                    "period_id": "178",
                                    "period_time": "0:00-5:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        },
                        {
                            "category_id": "2",
                            "category_text": "晚更",
                            "period_item": [
                                {
                                    "type_name": "C",
                                    "period_id": "179",
                                    "period_time": "19:00-03:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        }
                    ]
                },
                {
                    "weekday": "4",
                    "weekday_text": "(四)",
                    "setdate": "2021-08-05",
                    "is_holiday": 0,
                    "category_item": [
                        {
                            "category_id": "1",
                            "category_text": "早更",
                            "period_item": [
                                {
                                    "type_name": "B",
                                    "period_id": "178",
                                    "period_time": "0:00-5:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        },
                        {
                            "category_id": "2",
                            "category_text": "晚更",
                            "period_item": [
                                {
                                    "type_name": "C",
                                    "period_id": "179",
                                    "period_time": "19:00-03:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                },
                                {
                                    "type_name": "D",
                                    "period_id": "180",
                                    "period_time": "20:00-03:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        }
                    ]
                },
                {
                    "weekday": "5",
                    "weekday_text": "(五)",
                    "setdate": "2021-08-06",
                    "is_holiday": 0,
                    "category_item": [
                        {
                            "category_id": "1",
                            "category_text": "早更",
                            "period_item": [
                                {
                                    "type_name": "B",
                                    "period_id": "178",
                                    "period_time": "0:00-5:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        },
                        {
                            "category_id": "2",
                            "category_text": "晚更",
                            "period_item": [
                                {
                                    "type_name": "C",
                                    "period_id": "179",
                                    "period_time": "19:00-03:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                },
                                {
                                    "type_name": "D",
                                    "period_id": "180",
                                    "period_time": "20:00-03:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        }
                    ]
                },
                {
                    "weekday": "6",
                    "weekday_text": "(六)",
                    "setdate": "2021-08-07",
                    "is_holiday": 1,
                    "category_item": [
                        {
                            "category_id": "1",
                            "category_text": "早更",
                            "period_item": [
                                {
                                    "type_name": "B",
                                    "period_id": "178",
                                    "period_time": "0:00-5:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        },
                        {
                            "category_id": "2",
                            "category_text": "晚更",
                            "period_item": [
                                {
                                    "type_name": "E",
                                    "period_id": "181",
                                    "period_time": "21:00-01:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                },
                                {
                                    "type_name": "F",
                                    "period_id": "182",
                                    "period_time": "22:00-24:59",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        }
                    ]
                },
                {
                    "weekday": 7,
                    "weekday_text": "(日)",
                    "setdate": "2021-08-08",
                    "is_holiday": 1,
                    "category_item": [
                        {
                            "category_id": "1",
                            "category_text": "早更",
                            "period_item": [
                                {
                                    "type_name": "B",
                                    "period_id": "178",
                                    "period_time": "0:00-5:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        },
                        {
                            "category_id": "2",
                            "category_text": "晚更",
                            "period_item": [
                                {
                                    "type_name": "E",
                                    "period_id": "181",
                                    "period_time": "21:00-01:29",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                },
                                {
                                    "type_name": "F",
                                    "period_id": "182",
                                    "period_time": "22:00-24:59",
                                    "online_num": "1",
                                    "is_full": "0",
                                    "is_select": 0,
                                    "apply_num": 0,
                                    "auth_state": 0
                                }
                            ]
                        }
                    ]
                }
            ]
        }
"""

class KSWorkScheduleShiftDetailModel: Codable {
    
    var settingID: String = ""
    var name: String = ""
    var scheduleModels: [KSWorkScheduleShiftListModel]
    
    
    
    private enum CodingKeys: String, CodingKey {
        case settingID = "setting_id"
        case name = "name"
        case scheduleModels = "schedule_list"

    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.settingID = try container.decode(String.self, forKey: .settingID)
        self.name = try container.decode(String.self, forKey: .name)
        self.scheduleModels = try container.decode([KSWorkScheduleShiftListModel].self, forKey: .scheduleModels)

    }
    
    public func encode(to encoder: Encoder) throws {
        _ = encoder.container(keyedBy: CodingKeys.self)
        
    }
    
    
}

class KSWorkScheduleShiftListModel: Codable {
    
    var weekday: String?
    var weekdayText: String = ""
    var setdate: String = ""
    var isHoliday: Bool = false
    var categoryItem = [KSWorkScheduleShiftCategoryItemModel]()
    
    private enum CodingKeys: String, CodingKey {
        case weekday = "weekday"
        case weekdayText = "weekday_text"
        case setdate = "setdate"
        case isHoliday = "is_holiday"
        case categoryItem = "category_item"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let weekdayAsInt = try? container.decodeIfPresent(Int.self, forKey: .weekday) as? Int {
            self.weekday = "\(weekdayAsInt)"

        }else {
            self.weekday = try? container.decodeIfPresent(String.self, forKey: .weekday)
             
        }
        
        self.weekdayText = try container.decode(String.self, forKey: .weekdayText)
        self.setdate = try container.decode(String.self, forKey: .setdate)
        
        if let isHolidayAsInt = try container.decodeIfPresent(Int.self, forKey: .isHoliday) {
            self.isHoliday = (isHolidayAsInt == 1)

        }
        
        self.categoryItem = try container.decode([KSWorkScheduleShiftCategoryItemModel].self, forKey: .categoryItem)
    }
    
    public func encode(to encoder: Encoder) throws {
        _ = encoder.container(keyedBy: CodingKeys.self)
        
    }
}

class KSWorkScheduleShiftCategoryItemModel: Codable {

    var categoryID: String = ""
    var categoryText: String = ""
    var periodItem = [KSWorkScheduleShiftPeriodItemModel]()
    
    private enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case categoryText = "category_text"
        case periodItem = "period_item"

    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.categoryID = try container.decode(String.self, forKey: .categoryID)
        self.categoryText = try container.decode(String.self, forKey: .categoryText)
        self.periodItem = try container.decode([KSWorkScheduleShiftPeriodItemModel].self, forKey: .periodItem)

    }
    
    public func encode(to encoder: Encoder) throws {
        _ = encoder.container(keyedBy: CodingKeys.self)
        
    }
    
}

class KSWorkScheduleShiftPeriodItemModel: Codable {
    
    var typeName: String = ""
    var periodID: String = ""
    var periodTime: String = ""
    var onlineNum: String = ""
    var isFull: String = ""
    var isSelect: Bool = false
    var applyNum: Int = 0
    var authState: Int = 0
    
    private enum CodingKeys: String, CodingKey {
        case typeName = "type_name"
        case periodID = "period_id"
        case periodTime = "period_time"
        case onlineNum = "online_num"
        case isFull = "is_full"
        case isSelect = "isSelect"
        case applyNum = "apply_num"
        case authState = "auth_state"

    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.typeName = try container.decode(String.self, forKey: .typeName)
        self.periodID = try container.decode(String.self, forKey: .periodID)
        self.periodTime = try container.decode(String.self, forKey: .periodTime)
        self.onlineNum = try container.decode(String.self, forKey: .onlineNum)
        self.isFull = try container.decode(String.self, forKey: .isFull)
        
        if let isSelectAsInt = try container.decodeIfPresent(Int.self, forKey: .isSelect) {
            self.isSelect = (isSelectAsInt == 1)
        }
        self.applyNum = try container.decode(Int.self, forKey: .applyNum)
        self.authState = try container.decode(Int.self, forKey: .authState)

    }
    
    public func encode(to encoder: Encoder) throws {
        _ = encoder.container(keyedBy: CodingKeys.self)
        
    }
}

let decoder = JSONDecoder()
let jsonData:Data = jsonString.data(using: .utf8) ?? Data.init()
let shiftModel = try decoder.decode(KSWorkScheduleShiftDetailModel.self, from: jsonData)



//: [Next](@next)
