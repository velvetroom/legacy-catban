import Foundation

class Library:LibraryProtocol {
    var boards:[BoardProtocol]
    
    init() {
        self.boards = []
    }
    
    func loadBoards(completion: @escaping (() -> Void), error: @escaping ((Error) -> Void)) {
        
    }
}
