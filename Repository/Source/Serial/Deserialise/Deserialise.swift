import Foundation
import Board

class Deserialise:DeserialiseProtocol {
    var data:Data!
    private var dictionary:[String:Any]!

    func makeBoard() throws -> BoardProtocol {
        try self.makeDictionary()
        var board:BoardProtocol = BoardFactory.blankBoard()
        board.identifier = try self.getIdentifier()
        return board
    }
    
    func makeProject() throws -> ProjectProtocol {
        try self.makeDictionary()
        var project:ProjectProtocol = ProjectFactory.blankProject()
        project.identifier = try self.getIdentifier()
        project.name = try self.valueWith(key:RepositoryConstants.Keys.Project.name)
        return project
    }
    
    private func getIdentifier() throws -> String {
        return try self.valueWith(key:RepositoryConstants.Keys.Shared.identifier)
    }
    
    private func makeDictionary() throws {
        let object:Any = try JSONSerialization.jsonObject(with:data, options:JSONSerialization.ReadingOptions())
        guard
            let dictionary:[String:Any] = object as? [String:Any]
        else { throw ErrorRepository.corruptedData }
        self.dictionary = dictionary
    }
    
    private func valueWith<Type>(key:String) throws -> Type {
        guard
            let value:Type = self.dictionary[key] as? Type
        else { throw ErrorRepository.malformedData }
        return value
    }
}
