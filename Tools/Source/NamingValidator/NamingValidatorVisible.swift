import Foundation

class NamingValidatorVisible:NamingValidatorProtocol {
    required init() { }
    
    func validate(name:String) throws {
        guard
            name.isEmpty == false
        else { return }
        let cleanedName:String = self.clean(name:name)
        if cleanedName.isEmpty {
            throw ErrorNaming.visible
        }
    }
    
    private func clean(name:String) -> String {
        var cleaned:String = name
        let map:[String] = self.replaceMap()
        for replace:String in map {
            cleaned = cleaned.replacingOccurrences(of:replace, with:String())
        }
        return cleaned
    }
    
    private func replaceMap() -> [String] {
        return [
            " ",
            "\n",
            "\t",
            "\r"]
    }
}
