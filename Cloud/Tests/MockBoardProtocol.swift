import Foundation
import Board

class MockBoardProtocol:BoardProtocol {
    var onRemove:(() -> Void)?
    var onAdd:(() -> Void)?
    var identifier:String
    var countProjects:Int
    var firstProject:ProjectProtocol?
    private var added:ProjectProtocol?
    
    required init() {
        self.identifier = String()
        self.countProjects = 0
    }
    
    func remove(project:ProjectProtocol) {
        self.onRemove?()
    }
    
    func add(project:ProjectProtocol) {
        self.added = project
        self.onAdd?()
    }
}
