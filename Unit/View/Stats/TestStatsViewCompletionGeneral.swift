import XCTest
@testable import catban

class TestStatsViewCompletionGeneral:XCTestCase {
    private var view:StatsViewCompletionGeneral!
    private var viewModel:CircleCompletionViewModel!
    private struct Constants {
        static let totalCards:Int = 123
    }
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletionGeneral()
        self.viewModel = CircleCompletionViewModel()
        self.viewModel.totalCards = Constants.totalCards
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.labelCardsNumber, "Failed to load label")
        XCTAssertNotNil(self.view.labelCardsTitle, "Failed to load label")
        XCTAssertNotNil(self.view.viewStackBacklog, "Failed to load stack")
        XCTAssertNotNil(self.view.viewStackProgress, "Failed to load stack")
        XCTAssertNotNil(self.view.viewStackDone, "Failed to load stack")
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertFalse(self.view.viewStackBacklog.labelTitle.text!.isEmpty, "Invalid title")
        XCTAssertFalse(self.view.viewStackProgress.labelTitle.text!.isEmpty, "Invalid title")
        XCTAssertFalse(self.view.viewStackDone.labelTitle.text!.isEmpty, "Invalid title")
    }
    
    func testUpdateCardsNumber() {
        self.view.updateWith(viewModel:self.viewModel)
        let currentNumber:Int = Int(self.view.labelCardsNumber.text!)!
        XCTAssertEqual(currentNumber, Constants.totalCards, "Failed to update view")
    }
}
