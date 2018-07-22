import Foundation
import Shared
import Board

public class Repository:RepositoryProtocol {
    var deserialise:DeserialiseProtocol
    var file:RepositoryFile
    var remote:RemoteProtocol
    var dispatchQueue:DispatchQueue
    
    public required init() {
        self.file = RepositoryFile()
        self.deserialise = Deserialise()
        self.remote = Remote()
        self.dispatchQueue = DispatchQueue.privateBackgroundWith(
            identifier:RepositoryConstants.Shared.queueIdentifier)
    }
    
    public func loadBoard() throws -> BoardProtocol {
        try self.file.buildStructure()
        self.deserialise.data = try self.file.boardData()
        let board:BoardProtocol = try self.deserialise.makeBoard()
        self.loadProjectsOn(board:board)
        return board
    }
    
    public func save(board:BoardProtocol) {
        self.dispatchQueue.async {
            self.backgroundSave(board:board)
        }
    }
    
    private func backgroundSave(board:BoardProtocol) {
        let serialise:SerialiseProtocol = Serialise()
        do {
            let data:Data = try serialise.makeDataFrom(board:board)
            try self.file.writeBoard(data:data)
        } catch { }
    }
    
    private func loadProjectsOn(board:BoardProtocol) {
        let projectsData:[Data] = self.file.projectsData()
        for data:Data in projectsData {
            self.deserialise.data = data
            let project:ProjectProtocol
            do {
                try project = self.deserialise.makeProject()
            } catch {
                continue
            }
            board.add(project:project)
        }
    }
}
