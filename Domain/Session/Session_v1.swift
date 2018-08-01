import Foundation

class Session_v1:SessionProtocol, Codable {
    var selected:Int?
    var boards:[String]
    
    init() {
        self.boards = []
    }
    
    func current(library:LibraryProtocol) throws -> BoardProtocol {
        guard let selected:Int = self.selected else { throw DomainError.noBoardSelected }
        return library.boards[selected]
    }
}
