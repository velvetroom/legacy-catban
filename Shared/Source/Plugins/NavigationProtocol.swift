import UIKit

public protocol NavigationProtocol {
    func launch() -> UIWindow
    func navigateTo(controller:ControllerProtocol)
}
