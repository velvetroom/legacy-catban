import XCTest
@testable import catban

class TestStatsViewCompletion:XCTestCase {
    private var view:StatsViewCompletion!
    private var viewGeneral:MockStatsViewCompletionGeneral!
    private var project:Project!
    private var column:ProjectColumn!
    private var card:ProjectCard!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletion()
        self.viewGeneral = MockStatsViewCompletionGeneral()
        self.project = Project()
        self.column = ProjectColumn()
        self.card = ProjectCard()
        self.view.viewGeneral = self.viewGeneral
        self.column.cards.append(self.card)
        self.project.columns.append(self.column)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.radius, "Failed to load radius")
        XCTAssertNotNil(self.view.viewGeneral, "Failed to load general")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.column, "Failed to load column")
        XCTAssertNotNil(self.card, "Failed to load card")
        XCTAssertNotNil(self.viewGeneral, "Failed to load view general")
    }
    
    func testInitialCirclesAreZero() {
        XCTAssertTrue(self.view.viewModel.circles.isEmpty, "Initially circles should be empty")
    }
    
    func testUpdateWithUpdatesCircles() {
        self.view.updateWith(project:self.project)
        XCTAssertFalse(self.view.viewModel.circles.isEmpty, "Failed to update circles")
    }
    
    func testUpdateWithUpdatesViewGeneral() {
        self.startExpectation()
        self.viewGeneral.onUpdateWithViewModel = { [weak self] (viewModel:CircleViewModelCompletion) in
            XCTAssertEqual(viewModel.totalCards, self?.project.totalCards, "Invalid view model received")
            self?.expect?.fulfill()
        }
        
        self.view.updateWith(project:self.project)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectations")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
