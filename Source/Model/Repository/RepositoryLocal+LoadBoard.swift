import Foundation

extension RepositoryLocal {
    func loadBoard() throws -> BoardProtocol {
        throw ErrorRepository.boardNotFoundLocally
    }
}
