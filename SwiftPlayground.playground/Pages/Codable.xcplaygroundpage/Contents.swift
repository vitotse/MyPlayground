//: [Previous](@previous)

import Foundation

// Extension Decodable
public protocol JSONType: Codable {
    var jsonValue: Any { get }
}

extension Int: JSONType {
    public var jsonValue: Any { return self }
}
extension String: JSONType {
    public var jsonValue: Any { return self }
}
extension Double: JSONType {
    public var jsonValue: Any { return self }
}
extension Bool: JSONType {
    public var jsonValue: Any { return self }
}

public struct AnyJSONType: JSONType {
    public let jsonValue: Any

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let intValue = try? container.decode(Int.self) {
            jsonValue = intValue
        } else if let stringValue = try? container.decode(String.self) {
            jsonValue = stringValue
        } else if let boolValue = try? container.decode(Bool.self) {
            jsonValue = boolValue
        } else if let doubleValue = try? container.decode(Double.self) {
            jsonValue = doubleValue
        } else if let doubleValue = try? container.decode(Array<AnyJSONType>.self) {
            jsonValue = doubleValue
        } else if let doubleValue = try? container.decode(Dictionary<String, AnyJSONType>.self) {
            jsonValue = doubleValue
        } else {
            throw DecodingError.typeMismatch(JSONType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unsupported JSON tyep"))
        }
        
    }
    
    public func encode(to encoder: Encoder) throws {
        

    }
}

// Example
let json: [String: Any] = [
    "object": "customer",
    "id": "4yq6txdpfadhbaqnwp3",
    "email": "john.doe@example.com",
    "metadata": [
        "link_id": "linked-id",
        "buy_count": 4
    ]
]

class Customer: Codable {
  let object: String
  let email: String
  let metadata: AnyJSONType
    
    
    private enum CodingKeys: String, CodingKey {
        
        case object
        case email
        case metadata
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
             
        
        self.object = try container.decode(String.self, forKey: .object)
        self.email = try container.decode(String.self, forKey: .email)
        self.metadata = try container.decode(AnyJSONType.self, forKey: .metadata)
        
    }
    
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.metadata, forKey: .metadata)

    }

    
}


let decoder = JSONDecoder()
let data = try! JSONSerialization.data(withJSONObject: json, options: [])

let customer = try! decoder.decode(Customer.self, from: data)


//print("customer : \(customer.metadata.jsonValue as? [String : Any])")

if let metaDict = customer.metadata.jsonValue as? [String : Any] {
    let link = metaDict["link_id"] as? AnyJSONType
    
//    print("link - \(link?.jsonValue)")
}


let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

let jsonData = try? encoder.encode(customer)
let jsonString = String(data: jsonData, encoding: .utf8)!


//: [Next](@next)


