import Foundation
import Board

public protocol ViewCardProtocol {
    var project:ProjectManagedProtocol! { get set }
    var card:CardProtocol! { get set }
}
