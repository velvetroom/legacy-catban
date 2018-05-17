import XCTest
@testable import Home

class TestViewModelColumn:XCTestCase {
    private var viewModel:ViewModelColumn!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModelColumn()
    }
}
