import Foundation
@testable import Projects

class MockPresenterList:PresenterList {
    var onSelectFirstItem:(() -> Void)?
    var onSelectItemWithIdentifier:(() -> Void)?
    
    override func selectFirstItem() {
        self.onSelectFirstItem?()
    }
    
    override func selectItemWith(identifier:String) {
        self.onSelectItemWithIdentifier?()
    }
}
