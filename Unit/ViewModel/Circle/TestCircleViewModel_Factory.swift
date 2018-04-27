import XCTest
@testable import catban

class TestCircleViewModel_Factory:XCTestCase {
    private var viewModel:CircleViewModelCompletion!
    private struct Constants {
        static let backlogRadians:CGFloat = 4
        static let progressRadians:CGFloat = 5
        static let doneRadians:CGFloat = 6
        static let circlesNoCards:Int = 2
        static let cards:Int = 2
    }
    
    override func setUp() {
        super.setUp()
        self.viewModel = CircleViewModelCompletion()
        self.viewModel.backlog.radians = Constants.backlogRadians
        self.viewModel.progress.radians = Constants.progressRadians
        self.viewModel.done.radians = Constants.doneRadians
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
    
    func testFactoryNoCards() {
        let circles:[CircleViewModel] = CircleViewModel.factoryWith(viewModel:self.viewModel)
        XCTAssertEqual(circles.count, Constants.circlesNoCards, "Failed to factory circles")
    }
    
    func testFactoryBacklog() {
        self.viewModel.backlog.cards = Constants.cards
        let circles:[CircleViewModel] = CircleViewModel.factoryWith(viewModel:self.viewModel)
        XCTAssertEqual(circles.count, Constants.circlesNoCards + 1, "Failed to factory circles")
    }
    
    func testFactoryProgress() {
        self.viewModel.progress.cards = Constants.cards
        let circles:[CircleViewModel] = CircleViewModel.factoryWith(viewModel:self.viewModel)
        XCTAssertEqual(circles.count, Constants.circlesNoCards + 1, "Failed to factory circles")
    }
    
    func testFactoryDone() {
        self.viewModel.done.cards = Constants.cards
        let circles:[CircleViewModel] = CircleViewModel.factoryWith(viewModel:self.viewModel)
        XCTAssertEqual(circles.count, Constants.circlesNoCards + 1, "Failed to factory circles")
    }
    
    func testFactoryCircleBacklog() {
        let expected:CGFloat = CircleViewModel.Constants.startAngle + Constants.backlogRadians -
            CircleViewModel.Constants.interSpace
        let circle:CircleViewModel = CircleViewModel.factoryBacklogCircleWith(viewModel:self.viewModel)
        XCTAssertEqual(circle.endAngle, expected, "Invalid radians")
    }
    
    func testFactoryCircleProgress() {
        let expectedStart:CGFloat = CircleViewModel.Constants.startAngle + Constants.backlogRadians
        let circle:CircleViewModel = CircleViewModel.factoryProgressCircleWith(viewModel:self.viewModel)
        let expectedEnd:CGFloat = circle.startAngle + Constants.progressRadians -
            CircleViewModel.Constants.interSpace
        XCTAssertEqual(circle.startAngle, expectedStart, "Invalid radians")
        XCTAssertEqual(circle.endAngle, expectedEnd, "Invalid radians")
    }
    
    func testFactoryCircleDone() {
        let expectedStart:CGFloat = CircleViewModel.Constants.startAngle + Constants.backlogRadians +
            Constants.progressRadians
        let circle:CircleViewModel = CircleViewModel.factoryDoneCircleWith(viewModel:self.viewModel)
        let expectedEnd:CGFloat = circle.startAngle + Constants.doneRadians -
            CircleViewModel.Constants.interSpace
        XCTAssertEqual(circle.startAngle, expectedStart, "Invalid radians")
        XCTAssertEqual(circle.endAngle, expectedEnd, "Invalid radians")
    }
}
