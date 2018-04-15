import Foundation

extension Repository {
    func loadBoard() throws -> BoardProtocol {
        throw ErrorProject.oneColumnMinimum
    }
}
