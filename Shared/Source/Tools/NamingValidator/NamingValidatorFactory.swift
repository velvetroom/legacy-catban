import Foundation

public class NamingValidatorFactory {
    class func makeValidator() -> NamingValidatorProtocol {
        return NamingValidatorComposite()
    }
    
    private init() { }
}
