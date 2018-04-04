import UIKit
@testable import catban

class MockWriterViewText:WriterViewText {
    var onResignResponder:(() -> Void)?
    
    override func resignFirstResponder() -> Bool {
        self.onResignResponder?()
        return super.resignFirstResponder()
    }
}
