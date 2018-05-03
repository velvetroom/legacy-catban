import UIKit
import Shared

protocol NavigationProtocol {
    func launch() -> UIWindow
    func navigateTo(controller:ControllerProtocol)
}
