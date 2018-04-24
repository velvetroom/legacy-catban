import XCTest
@testable import catban

class TestStatsPresenterFactory:XCTestCase {
    private var factory:StatsPresenterFactory!
    private var board:Board!
    
    override func setUp() {
        super.setUp()
        self.factory = StatsPresenterFactory()
        self.board = Board()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
        XCTAssertNotNil(self.board, "Failed to load board")
    }
    
    func testFactory() {
        let viewModel:StatsViewModel = self.factory.factoryWith(board:self.board)
        XCTAssertNotNil(viewModel, "Failed to load view model")
    }
}
