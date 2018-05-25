import Foundation
@testable import Home

class MockPresenterMenu:PresenterMenu {
    static var presenter:PresenterMenu?
    var onClose:(() -> Void)?
    var onOpenProjects:(() -> Void)?
    var onOpenAbout:(() -> Void)?
    
    override func show() {
        MockPresenterMenu.presenter = self
    }
    
    override func close() {
        self.onClose?()
    }
    
    override func openProjects() {
        self.onOpenProjects?()
    }
    
    override func openAbout() {
        self.onOpenAbout?()
    }
}
