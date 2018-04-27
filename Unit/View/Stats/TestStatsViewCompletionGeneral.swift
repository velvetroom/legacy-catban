import XCTest
@testable import catban

class TestStatsViewCompletionGeneral:XCTestCase {
    private var view:StatsViewCompletionGeneral!
    private var viewStack:StatsViewCompletionGeneralStack!
    private var layoutHeight:NSLayoutConstraint!
    private var viewModel:CircleViewModelCompletion!
    private var viewModelStack:CircleViewModelCompletionStack!
    private struct Constants {
        static let totalCards:Int = 123
        static let stackCards:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletionGeneral()
        self.viewModel = CircleViewModelCompletion()
        self.viewStack = StatsViewCompletionGeneralStack()
        self.viewModelStack = CircleViewModelCompletionStack()
        self.layoutHeight = NSLayoutConstraint()
        self.viewModel.totalCards = Constants.totalCards
        self.viewStack.layoutHeight = self.layoutHeight
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.labelCardsNumber, "Failed to load label")
        XCTAssertNotNil(self.view.labelCardsTitle, "Failed to load label")
        XCTAssertNotNil(self.view.viewStackBacklog, "Failed to load stack")
        XCTAssertNotNil(self.view.viewStackProgress, "Failed to load stack")
        XCTAssertNotNil(self.view.viewStackDone, "Failed to load stack")
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewStack, "Failed to load view stack")
        XCTAssertNotNil(self.viewModelStack, "Failed to load view model stack")
        XCTAssertNotNil(self.layoutHeight, "Failed to load layout height")
        XCTAssertFalse(self.view.viewStackBacklog.labelTitle.text!.isEmpty, "Invalid title")
        XCTAssertFalse(self.view.viewStackProgress.labelTitle.text!.isEmpty, "Invalid title")
        XCTAssertFalse(self.view.viewStackDone.labelTitle.text!.isEmpty, "Invalid title")
    }
    
    func testUpdateCardsNumber() {
        self.view.updateWith(viewModel:self.viewModel)
        let currentNumber:Int = Int(self.view.labelCardsNumber.text!)!
        XCTAssertEqual(currentNumber, Constants.totalCards, "Failed to update view")
    }
    
    func testUpdateStackWithViewModelShowsStack() {
        self.viewModelStack.cards = Constants.stackCards
        self.view.update(stack:self.viewStack, with:self.viewModelStack)
        XCTAssertEqual(self.layoutHeight.constant, StatsViewCompletionGeneral.Constants.stackHeight,
                       "Failed to show stack")
    }
    
    func testUpdateStackWithViewModelHidesStack() {
        self.view.update(stack:self.viewStack, with:self.viewModelStack)
        XCTAssertEqual(self.layoutHeight.constant, 0, "Failed to hide stack")
    }
    
    func testUpdateStackWithViewModelUpdatesNumber() {
        self.viewModelStack.cards = Constants.stackCards
        self.view.update(stack:self.viewStack, with:self.viewModelStack)
        let cards:Int = Int(self.viewStack.labelNumber.text!)!
        XCTAssertEqual(cards, Constants.stackCards, "Failed to update cards number")
    }
    
    func testUpdateBacklog() {
        self.view.viewStackBacklog = self.viewStack
        self.viewModel.backlog.cards = Constants.totalCards
        self.view.updateWith(viewModel:self.viewModel)
        XCTAssertEqual(self.layoutHeight.constant, StatsViewCompletionGeneral.Constants.stackHeight,
                       "Failed to update backlog")
    }
    
    func testUpdateProgress() {
        self.view.viewStackProgress = self.viewStack
        self.viewModel.progress.cards = Constants.totalCards
        self.view.updateWith(viewModel:self.viewModel)
        XCTAssertEqual(self.layoutHeight.constant, StatsViewCompletionGeneral.Constants.stackHeight,
                       "Failed to update progress")
    }
    
    func testUpdateDone() {
        self.view.viewStackDone = self.viewStack
        self.viewModel.done.cards = Constants.totalCards
        self.view.updateWith(viewModel:self.viewModel)
        XCTAssertEqual(self.layoutHeight.constant, StatsViewCompletionGeneral.Constants.stackHeight,
                       "Failed to update done")
    }
}
