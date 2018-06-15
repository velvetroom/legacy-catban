import Foundation
import Board
@testable import Projects

class MockInteractor:Interactor {
    var onUpdated:(() -> Void)?
    
    override func updated(project:ProjectProtocol) {
        self.onUpdated?()
    }
}
