import Foundation
import Board

public protocol InteractorProjectProtocol:InteractorProtocol {
    var project:ProjectManagedProtocol! { get set }
}
