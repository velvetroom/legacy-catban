import Foundation

public class KeyboardAdjusterFactory {
    public class func makeAdjuster() -> KeyboardAdjusterProtocol {
        return KeyboardAdjuster()
    }
    
    private init() { }
}
