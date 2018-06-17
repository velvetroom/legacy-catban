import XCTest
@testable import Tools

class TestNamerViewModelContent:XCTestCase {
    private var viewModel:NamerViewModelContent!
    
    override func setUp() {
        super.setUp()
        self.viewModel = NamerViewModelContent()
    }
    
    func testNotRetainingObserver() {
        self.viewModel.observer = MockViewModelObserverProtocol()
        XCTAssertNil(self.viewModel.observer, "Retains")
    }
}
