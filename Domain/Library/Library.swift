import Foundation

class Library:LibraryProtocol {
    weak var delegate:LibraryDelegate?
    weak var state:LibraryStateProtocol!
    var session:SessionProtocol
    var boards:[String:BoardProtocol]
    var repository:RepositoryProtocol
    let boardsLoader:LibraryBoardsLoader
    static let stateDefault:LibraryStateProtocol = LibraryStateDefault()
    static let stateReady:LibraryStateProtocol = LibraryStateReady()
    
    init() {
        self.session = SessionNil()
        self.boards = [:]
        self.repository = Factory.makeRepository()
        self.boardsLoader = LibraryBoardsLoader()
        self.state = Library.stateDefault
        self.boardsLoader.library = self
    }
    
    func loadSession() throws {
        try self.state.loadSession(context:self)
    }
    
    func loadBoards() throws {
        try self.state.loadBoards(context:self)
    }
    
    func newBoard() throws {
        try self.state.newBoard(context:self)
    }
    
    func sessionLoaded() {
        self.state = Library.stateReady
        DispatchQueue.main.async { [weak self] in self?.delegate?.librarySessionLoaded() }
    }
    
    func saveSession() {
        self.repository.saveLocal(session:self.session as! Configuration.Session)
    }
    
    func notifyBoards() {
        DispatchQueue.main.async { [weak self] in self?.delegate?.libraryBoardsUpdated() }
    }
}
