import Foundation
import Shared

class ControllerFactory {
    class func factoryLoad() -> ControllerProtocol {
        return Configuration.controllerLoadType.init()
    }
}
