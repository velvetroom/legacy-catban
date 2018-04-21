import Foundation
@testable import catban

class MockBoardProtocol:BoardProtocol {
    var onDeleteProject:(() -> Void)?
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
    
    func deleteProject() {
        self.onDeleteProject?()
    }
}
