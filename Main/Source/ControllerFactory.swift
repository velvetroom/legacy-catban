import Foundation
import Shared

class ControllerFactory {
    class func factoryLoad() -> ControllerProtocol {
        return Configuration.controllerLoadType.init()
    }
    
    class func factoryHome() -> ControllerProjectProtocol {
        return Configuration.controllerHomeType.init()
    }
}
