import Foundation

extension Deserialiser {
    func parseHistortWith(dictionary:[String:Any]) throws -> History {
        guard
            let array:[Any] = dictionary[Serialiser.Constants.Project.history] as? [Any]
        else { throw ErrorRepository.malformedData }
        return try self.parseHistoryWith(array:array)
    }
    
    private func parseHistoryWith(array:[Any]) throws -> History {
        let history:History = History()
        for item:Any in array {
            guard
                let itemDictionary:[String:Any] = item as? [String:Any]
            else { throw ErrorRepository.malformedData }
            
        }
        return history
    }
}
