import UIKit

public protocol NavigationProtocol {
    init()
    func launch() -> UIWindow
    func navigateTo(controller:ControllerProtocol)
}
