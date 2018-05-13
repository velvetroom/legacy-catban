import XCTest
@testable import Home

class TestViewModel:XCTestCase {
    private var viewModel:ViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModel()
    }
}
