import Foundation
import Board

public protocol ViewColumnProtocol {
    var project:ProjectManagedProtocol! { get set }
    var column:ColumnProtocol! { get set }
}
