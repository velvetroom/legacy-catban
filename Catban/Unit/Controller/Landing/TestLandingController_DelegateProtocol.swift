import XCTest
@testable import catban

class TestLandingController_DelegateProtocol:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var layoutMenuBottom:NSLayoutConstraint!
    private var project:Project!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let menuInitialBottom:CGFloat = 99
        static let indexPath:IndexPath = IndexPath(item:1, section:1)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<MockLandingProtocol>()
        self.layoutMenuBottom = NSLayoutConstraint()
        self.project = Project.factoryFirstProject()
        self.controller.model.presenter.outlets.list.layoutCollectionMenuBottom = self.layoutMenuBottom
        self.controller.model.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.layoutMenuBottom, "Failed to load layout constraint")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testRemoveEditingCardWhenDeselectCell() {
        self.controller.delegateSelectCellAt(index:Constants.indexPath)
        self.controller.delegateClearSelection()
        XCTAssertNil(self.controller.model.editingCard, "Failed to remove editing card")
    }
    
    func testSelectsUpdatesStateToSelected() {
        self.startExpectation()
        self.controller.model.onStateCardSelected = { [weak self] (indexPath:IndexPath) in
            XCTAssertEqual(indexPath, Constants.indexPath, "Invalid indexPath received")
            self?.expect?.fulfill()
        }
        
        self.controller.delegateSelectCellAt(index:Constants.indexPath)
        self.waitExpectation()
    }
    
    func testClearUpdatesStateToStandby() {
        self.startExpectation()
        self.controller.model.onStateStandby = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.delegateClearSelection()
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
