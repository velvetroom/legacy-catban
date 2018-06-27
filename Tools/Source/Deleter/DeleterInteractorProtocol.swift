import Foundation
import CleanArchitecture

public protocol DeleterInteractorProtocol:InteractorProtocol {
    func deleteConfirmed()
    func deleteCancelled()
}
