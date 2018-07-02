import Foundation
import Board

public extension Repository {
    public func startRemote(project:ProjectProtocol) throws -> ProjectSynchedProtocol {
        throw ErrorRepository.alreadyClouded
    }
}
