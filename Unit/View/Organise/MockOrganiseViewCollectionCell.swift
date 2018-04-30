import Foundation
@testable import catban

class MockOrganiseViewCollectionCell:OrganiseViewCollectionCell {
    var onUpdateState:(() -> Void)?
    
    override func updateState() {
        self.onUpdateState?()
    }
}
