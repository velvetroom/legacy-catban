import Foundation

class NamerValidatorComposite:NamerValidatorProtocol {
    var validators:[NamerValidatorProtocol.Type]
    
    required init() {
        self.validators = [NamerValidatorLength.self,
                           NamerValidatorVisible.self]
    }
    
    func validate(name:String) throws {
        for validator:NamerValidatorProtocol.Type in self.validators {
            let validator:NamerValidatorProtocol = validator.init()
            try validator.validate(name:name)
        }
    }
}
