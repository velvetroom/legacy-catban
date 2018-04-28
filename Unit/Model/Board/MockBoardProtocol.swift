import Foundation
@testable import catban

class MockBoardProtocol:BoardProtocol {
    var onInsertProject:((ProjectProtocol) -> Void)?
    var onDeleteProject:(() -> Void)?
    var onApplyUpdates:(([UpdateProtocol]) -> Void)?
    var onSelectProjectAtIndex:((Int) -> Void)?
    var user:UserProtocol
    var projects:[ProjectProtocol]
    var project:ProjectProtocol {
        get {
            return self.user.project
        }
        set(newValue) {
            self.user.project = newValue
        }
    }
    
    init() {
        self.user = User()
        self.projects = []
    }
    
    func selectProjectAt(index:Int) {
        self.onSelectProjectAtIndex?(index)
    }
    
    func insertProject(project:ProjectProtocol) {
        self.onInsertProject?(project)
    }
    
    func deleteProject() {
        self.onDeleteProject?()
    }
    
    func apply(updates:[UpdateProtocol]) {
        self.onApplyUpdates?(updates)
    }
}
