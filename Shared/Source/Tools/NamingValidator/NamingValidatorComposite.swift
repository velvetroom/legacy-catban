import Foundation

class NamingValidatorComposite:NamingValidatorProtocol {
    var validators:[NamingValidatorProtocol.Type]
    private var name:String!
    
    required init() {
        self.validators = [NamingValidatorLength.self]
    }
    
    func validate(name:String) throws {
        for validator:NamingValidatorProtocol.Type in self.validators {
            let validator:NamingValidatorProtocol = validator.init()
            try validator.validate(name:name)
        }
    }
}
