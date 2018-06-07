import Foundation

class NamingValidatorComposite:NamingValidatorProtocol {
    var validators:[NamingValidatorProtocol.Type]
    
    required init() {
        self.validators = [NamingValidatorLength.self,
                           NamingValidatorVisible.self]
    }
    
    func validate(name:String) throws {
        for validator:NamingValidatorProtocol.Type in self.validators {
            let validator:NamingValidatorProtocol = validator.init()
            try validator.validate(name:name)
        }
    }
}
