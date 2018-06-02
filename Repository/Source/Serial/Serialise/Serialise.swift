import Foundation
import Board

class Serialise:SerialiseProtocol {
    var dictionary:[String:Any]
    
    init() {
        self.dictionary = [:]
    }
    
    func makeDataFrom(board:BoardProtocol) throws -> Data {
        self.makeDictionaryFrom(board:board)
        return try self.makeData()
    }
    
    func makeDataFrom(project:ProjectProtocol) throws -> Data {
        self.makeDictionaryFrom(project:project)
        return try self.makeData()
    }
    
    private func makeDictionaryFrom(board:BoardProtocol) {
        self.dictionary[RepositoryConstants.Keys.Shared.identifier] = board.identifier
    }
    
    private func makeDictionaryFrom(project:ProjectProtocol) {
        self.dictionary[RepositoryConstants.Keys.Shared.identifier] = project.identifier
        self.dictionary[RepositoryConstants.Keys.Shared.created] = project.created
        self.dictionary[RepositoryConstants.Keys.Project.name] = project.name
        self.dictionary[RepositoryConstants.Keys.Project.columns] = self.makeColumnArrayFrom(project:project)
    }
    
    private func makeColumnArrayFrom(project:ProjectProtocol) -> [[String:Any]] {
        var array:[[String:Any]] = []
        project.iterate { (column:ColumnProtocol) in
            array.append(self.makeDictionaryFrom(column:column))
        }
        return array
    }
    
    private func makeDictionaryFrom(column:ColumnProtocol) -> [String:Any] {
        var dictionary:[String:Any] = [:]
        dictionary[RepositoryConstants.Keys.Shared.identifier] = column.identifier
        dictionary[RepositoryConstants.Keys.Shared.created] = column.created
        dictionary[RepositoryConstants.Keys.Column.name] = column.name
        dictionary[RepositoryConstants.Keys.Column.cards] = self.makeCardArrayFrom(column:column)
        return dictionary
    }
    
    private func makeCardArrayFrom(column:ColumnProtocol) -> [[String:Any]] {
        var array:[[String:Any]] = []
        column.iterate { (card:CardProtocol) in
            array.append(self.makeDictionaryFrom(card:card))
        }
        return array
    }
    
    private func makeDictionaryFrom(card:CardProtocol) -> [String:Any] {
        var dictionary:[String:Any] = [:]
        dictionary[RepositoryConstants.Keys.Shared.identifier] = card.identifier
        dictionary[RepositoryConstants.Keys.Shared.created] = card.created
        dictionary[RepositoryConstants.Keys.Card.content] = card.content
        return dictionary
    }
    
    private func makeData() throws -> Data {
        return try JSONSerialization.data(withJSONObject:self.dictionary,
                                          options:JSONSerialization.WritingOptions.prettyPrinted)
    }
}
