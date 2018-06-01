import Foundation
import Board

class Serialise:SerialiseProtocol {
    var dictionary:[String:Any]
    
    init() {
        self.dictionary = [:]
    }
    
    func makeDataFrom(board:BoardProtocol) throws -> Data {
        try self.makeDictionaryFrom(board:board)
        return try self.makeData()
    }
    
    func makeDataFrom(project:ProjectProtocol) throws -> Data {
        try self.makeDictionaryFrom(project:project)
        return try self.makeData()
    }
    
    private func makeDictionaryFrom(board:BoardProtocol) throws {
        self.dictionary[RepositoryConstants.Keys.Shared.identifier] = board.identifier
    }
    
    private func makeDictionaryFrom(project:ProjectProtocol) throws {
        self.dictionary[RepositoryConstants.Keys.Shared.identifier] = project.identifier
        self.dictionary[RepositoryConstants.Keys.Shared.created] = project.created
        self.dictionary[RepositoryConstants.Keys.Project.name] = project.name
    }
    
    private func makeData() throws -> Data {
        return try JSONSerialization.data(withJSONObject:self.dictionary,
                                          options:JSONSerialization.WritingOptions.prettyPrinted)
    }
}
