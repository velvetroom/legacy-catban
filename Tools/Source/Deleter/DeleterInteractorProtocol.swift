import Foundation
import Shared

public protocol DeleterInteractorProtocol:InteractorProtocol {
    func deleteConfirmed()
    func deleteCancelled()
}
