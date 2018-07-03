import Foundation
import Board

class Deserialise:DeserialiseProtocol {
    var data:Data!
    var dictionary:[String:Any]!

    func makeBoard() throws -> BoardProtocol {
        try self.makeDictionary()
        var board:BoardProtocol = BoardFactory.blankBoard()
        board.identifier = try self.getIdentifier()
        return board
    }
    
    func makeProject() throws -> ProjectProtocol {
        try self.makeDictionary()
        let project:ProjectProtocol = try self.loadProject()
        try self.makeColumnsFor(project:project)
        return project
    }
    
    func getIdentifier() throws -> String {
        return try self.valueWith(key:RepositoryConstants.Keys.Shared.identifier)
    }
    
    func valueWith<Type>(key:String) throws -> Type {
        guard
            let value:Type = self.dictionary[key] as? Type
        else { throw ErrorRepository.malformedData }
        return value
    }
    
    private func makeColumnsFor(project:ProjectProtocol) throws {
        let array:[[String:Any]] = try self.valueWith(key:RepositoryConstants.Keys.Project.columns)
        for item:[String:Any] in array {
            self.dictionary = item
            project.add(column:try self.makeColumn())
        }
    }
    
    private func makeColumn() throws -> ColumnProtocol {
        var column:ColumnProtocol = ColumnFactory.blankColumn()
        column.identifier = try self.getIdentifier()
        column.name = try self.valueWith(key:RepositoryConstants.Keys.Column.name)
        column.created = try self.valueWith(key:RepositoryConstants.Keys.Shared.created)
        try self.makeCardsFor(column:column)
        return column
    }
    
    private func makeCardsFor(column:ColumnProtocol) throws {
        let array:[[String:Any]] = try self.valueWith(key:RepositoryConstants.Keys.Column.cards)
        for item:[String:Any] in array {
            self.dictionary = item
            column.add(card:try self.makeCard())
        }
    }
    
    private func makeCard() throws -> CardProtocol {
        var card:CardProtocol = CardFactory.blankCard()
        card.identifier = try self.getIdentifier()
        card.content = try self.valueWith(key:RepositoryConstants.Keys.Card.content)
        card.created = try self.valueWith(key:RepositoryConstants.Keys.Shared.created)
        return card
    }
    
    private func makeDictionary() throws {
        let object:Any = try JSONSerialization.jsonObject(with:data, options:JSONSerialization.ReadingOptions())
        guard
            let dictionary:[String:Any] = object as? [String:Any]
        else { throw ErrorRepository.corruptedData }
        self.dictionary = dictionary
    }
}
