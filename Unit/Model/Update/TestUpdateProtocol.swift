import XCTest
@testable import catban

class TestUpdateProtocol:XCTestCase {
    private var update:MockUpdateProtocol!
    private var board:MockBoardProtocol!
    private var view:MockLandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.update = MockUpdateProtocol()
        self.board = MockBoardProtocol()
        self.view = MockLandingViewCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testStrategy() {
        self.update.strategy(board:self.board)
        self.update.strategy(collectionView:self.view)
    }
}
