import XCTest
@testable import Home

class TestViewModelCard:XCTestCase {
    private var viewModel:ViewModelCard!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModelCard()
    }
}
