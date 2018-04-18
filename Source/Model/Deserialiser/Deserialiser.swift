import Foundation

class Deserialiser:DeserialiserProtocol {
    func dictionaryFrom(data:Data) throws -> [String:Any] {
        let object:Any = try JSONSerialization.jsonObject(with:data, options:JSONSerialization.ReadingOptions())
        guard
            let dictionary:[String:Any] = object as? [String:Any]
        else {
            throw ErrorRepository.corruptedData
        }
        return dictionary
    }
}
