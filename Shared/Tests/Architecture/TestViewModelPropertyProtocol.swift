import XCTest
@testable import Shared

class TestViewModelPropertyProtocol:XCTestCase {
    private var property:MockViewModelPropertyProtocol!
    
    override func setUp() {
        super.setUp()
        self.property = MockViewModelPropertyProtocol()
    }
    
    func testNotifyObserver() {
        var notified:Bool = false
        self.property.observing = { (viewModel:MockViewModelPropertyProtocol) in notified = true }
        self.property.notifyObserver()
        XCTAssertTrue(notified, "Not notified")
    }
}
