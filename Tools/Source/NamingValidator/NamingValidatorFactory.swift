import Foundation

public class NamingValidatorFactory {
    public class func makeValidator() -> NamingValidatorProtocol {
        return NamingValidatorComposite()
    }
    
    private init() { }
}
