import Foundation
@testable import Home

class MockPresenterMenu:PresenterMenu {
    var onClose:(() -> Void)?
    var onOpenProjects:(() -> Void)?
    var onOpenAbout:(() -> Void)?
    var onOpenCloud:(() -> Void)?
    
    override func close() {
        self.onClose?()
    }
    
    override func openProjects() {
        self.onOpenProjects?()
    }
    
    override func openAbout() {
        self.onOpenAbout?()
    }
    
    override func openCloud() {
        self.onOpenCloud?()
    }
}
