import Foundation

class Library:LibraryProtocol {
    weak var delegate:LibraryDelegate?
    var session:SessionProtocol
    var boards:[String:BoardProtocol]
    var repository:RepositoryProtocol
    private let boardsLoader:LibraryBoardsLoader
    
    init() {
        self.session = SessionNil()
        self.boards = [:]
        self.repository = Factory.makeRepository()
        self.boardsLoader = LibraryBoardsLoader()
        self.boardsLoader.library = self
    }
    
    func loadSession() {
        self.repository.loadLocal(session: { [weak self] (session:Configuration.Session) in
            self?.session = session
            self?.notifySession()
        }, error: { [weak self] (_:Error) in
            self?.loadSessionFailed()
        })
    }
    
    func loadBoards() {
        self.boardsLoader.load(identifiers:self.session.boards)
    }
    
    func newBoard() {
        let board:Configuration.Board = Configuration.Board()
        self.repository.createRemote(board:board) { [weak self] (identifier:String) in
            self?.boards[identifier] = board
            self?.session.boards.append(identifier)
            self?.repository.saveLocal(identifier:identifier, board:board)
            self?.saveSession()
            self?.notifyBoards()
        }
    }
    
    func loaded(boards:[String:BoardProtocol]) {
        self.boards = boards
        self.notifyBoards()
    }
    
    private func loadSessionFailed() {
        let session:Configuration.Session = Configuration.Session()
        self.session = session
        self.repository.saveLocal(session:session)
        self.notifySession()
    }
    
    private func saveSession() {
        self.repository.saveLocal(session:self.session as! Configuration.Session)
    }
    
    private func notifySession() {
        DispatchQueue.main.async { [weak self] in self?.delegate?.librarySessionLoaded() }
    }
    
    private func notifyBoards() {
        DispatchQueue.main.async { [weak self] in self?.delegate?.libraryBoardsUpdated() }
    }
}
