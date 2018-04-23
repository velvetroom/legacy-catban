import Foundation
@testable import catban

class MockBoardProtocol:BoardProtocol {
    var onInserProject:((ProjectProtocol) -> Void)?
    var onDeleteProject:(() -> Void)?
    var onApplyUpdates:(([CollectionUpdateProtocol]) -> Void)?
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
        self.onInserProject?(project)
    }
    
    func deleteProject() {
        self.onDeleteProject?()
    }
    
    func apply(updates:[CollectionUpdateProtocol]) {
        self.onApplyUpdates?(updates)
    }
}
