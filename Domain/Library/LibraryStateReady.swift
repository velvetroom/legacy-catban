import Foundation

class LibraryStateReady:LibraryStateProtocol {
    func loadBoards(context:Library) throws {
        context.boardsLoader.load(identifiers:context.session.boards)
    }
    
    func newBoard(context:Library) throws {
        let board:Configuration.Board = Configuration.Board()
        context.repository.createRemote(board:board) { (identifier:String) in
            context.boards[identifier] = board
            context.session.boards.append(identifier)
            context.repository.saveLocal(identifier:identifier, board:board)
            context.saveSession()
            context.notifyBoards()
        }
    }
    
    func loadSession(context:Library) throws { throw DomainError.sessionLoaded }
}
