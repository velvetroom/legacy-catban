import Foundation
import CleanArchitecture
import Board

public protocol InteractorProjectProtocol:InteractorProtocol {
    var project:ProjectManagedProtocol! { get set }
}
