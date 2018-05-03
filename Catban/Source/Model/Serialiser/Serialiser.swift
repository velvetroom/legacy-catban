import Foundation

class Serialiser:SerialiserProtocol {
    func dataFrom(dictionary:[String:Any]) throws -> Data {
        return try JSONSerialization.data(withJSONObject:dictionary, options:
            JSONSerialization.WritingOptions.prettyPrinted)
    }
}
