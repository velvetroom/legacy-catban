import Foundation
import Board

class MockBoardProtocol:BoardProtocol {
    var identifier:String
    var projects:[ProjectProtocol]
    var project:ProjectProtocol?
    var onAddProject:(() -> Void)?
    var onRemoveProject:(() -> Void)?
    
    var firstProject:ProjectProtocol? {
        get {
            return nil
        }
    }
    
    var countProjects:Int {
        get {
            return self.projects.count
        }
    }
    
    init() {
        self.identifier = String()
        self.projects = []
    }
    
    func remove(project:ProjectProtocol) {
        self.onRemoveProject?()
    }
    
    func projectWith(identifier:String) -> ProjectProtocol {
        return self.project!
    }
    
    func iterate(projects:((ProjectProtocol) -> Void)) {
        self.projects.forEach(projects)
    }
    
    func projectAt(index:Int) -> ProjectProtocol {
        return MockProjectProtocol()
    }
    
    func add(project:ProjectProtocol) {
        self.onAddProject?()
    }
}
