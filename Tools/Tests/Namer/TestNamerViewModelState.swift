import XCTest
@testable import Tools

class TestNamerViewModelState:XCTestCase {
    private var viewModel:NamerViewModelState!
    
    override func setUp() {
        super.setUp()
        self.viewModel = NamerViewModelState()
    }
    
    func testNotRetainingObserver() {
        self.viewModel.observer = MockViewModelObserverProtocol()
        XCTAssertNil(self.viewModel.observer, "Retains")
    }
}
