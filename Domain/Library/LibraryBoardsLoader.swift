import Foundation

class LibraryBoardsLoader {
    weak var library:Library?
    private var identifiers:[String]
    private var boards:[String:BoardProtocol]
    private let queue:DispatchQueue
    
    init() {
        self.identifiers = []
        self.boards = [:]
        self.queue = DispatchQueue(label:Constants.identifier, qos:DispatchQoS.background,
                                   attributes:DispatchQueue.Attributes(),
                                   autoreleaseFrequency:DispatchQueue.AutoreleaseFrequency.inherit,
                                   target:DispatchQueue.global(qos:DispatchQoS.QoSClass.background))
    }
    
    func load(identifiers:[String]) {
        self.queue.async { [weak self] in
            self?.boards = [:]
            self?.identifiers = identifiers
            self?.next()
        }
    }
    
    private func next() {
        if let identifier:String = self.identifiers.first {
            self.identifiers.removeFirst()
            self.library?.repository.loadLocal(identifier:identifier) { [weak self] (board:Configuration.Board) in
                self?.loaded(identifier:identifier, board:board)
            }
        } else {
            self.library?.boards = boards
            self.library?.notifyBoards()
        }
    }
    
    private func loaded(identifier:String, board:BoardProtocol) {
        self.queue.async { [weak self] in
            self?.boards[identifier] = board
            self?.next()
        }
    }
}

private struct Constants {
    static let identifier:String = "iturbide.catban.libraryBoardsLoader"
}
