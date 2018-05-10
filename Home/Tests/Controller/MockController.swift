import Foundation
@testable import Home
@testable import Board

class MockController:Controller {
    var onEditCardWith:((String) -> Void)?
    
    override func editCardWith(identifier:String) {
        self.onEditCardWith?(identifier)
    }
}
