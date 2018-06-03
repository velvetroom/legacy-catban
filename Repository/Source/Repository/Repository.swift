import Foundation
import Shared
import Board

public class Repository:RepositoryProtocol {
    var file:RepositoryFile
    var deserialise:DeserialiseProtocol
    var dispatchQueue:DispatchQueue
    
    public required init() {
        self.file = RepositoryFile()
        self.deserialise = Deserialise()
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
    
    public func save(project:ProjectProtocol) {
        self.dispatchQueue.async {
            self.backgroundSave(project:project)
        }
    }
    
    public func delete(project:ProjectProtocol) {
        self.dispatchQueue.async {
            self.backgroundDelete(project:project)
        }
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
    
    private func backgroundSave(board:BoardProtocol) {
        let serialise:SerialiseProtocol = Serialise()
        do {
            let data:Data = try serialise.makeDataFrom(board:board)
            try self.file.writeBoard(data:data)
        } catch {
            return
        }
    }
    
    private func backgroundSave(project:ProjectProtocol) {
        let serialise:SerialiseProtocol = Serialise()
        do {
            let data:Data = try serialise.makeDataFrom(project:project)
            try self.file.writeProject(data:data, with:project.identifier)
        } catch {
            return
        }
    }
    
    private func backgroundDelete(project:ProjectProtocol) {
        do { try self.file.deleteProjectWith(identifier:project.identifier) } catch { }
    }
}
