import XCTest
@testable import Home

class TestPresenterUpdaterFactory:XCTestCase {
    func testMakeCardUpdater() {
        let item:PresenterUpdaterBoardItemProtocol? = PresenterUpdaterFactory.makeFor(viewModel:ViewModelCard())
        XCTAssertNotNil(item, "Make failed")
        let itemCard:PresenterUpdaterCard? = item as? PresenterUpdaterCard
        XCTAssertNotNil(itemCard, "Invalid item type")
    }
    
    func testMakeNewCardUpdater() {
        let item:PresenterUpdaterBoardItemProtocol? = PresenterUpdaterFactory.makeFor(viewModel:ViewModelNewCard())
        XCTAssertNotNil(item, "Make failed")
        let itemNewCard:PresenterUpdaterNewCard? = item as? PresenterUpdaterNewCard
        XCTAssertNotNil(itemNewCard, "Invalid item type")
    }
}
