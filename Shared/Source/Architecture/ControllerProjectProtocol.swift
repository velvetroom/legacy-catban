import Foundation
import Board

public protocol ControllerProjectProtocol:ControllerProtocol {
    var project:ProjectManagedProtocol! { get set }
}
