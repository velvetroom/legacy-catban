import XCTest
@testable import catban

class TestLandingStateCardSelected_Move:XCTestCase {
    private var model:LandingStateCardSelected!
    private var project:Project!
    private var delegate:MockLandingStateDelegateProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let indexPath:IndexPath = IndexPath(item:0, section:1)
    }
    
    override func setUp() {
        super.setUp()
        self.model = LandingStateCardSelected()
        self.delegate = MockLandingStateDelegateProtocol()
        self.project = Project()
        self.delegate.project = self.project
        self.model.delegate = self.delegate
        self.model.indexPath = Constants.indexPath
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testMoveCardLeftCallsDelegate() {
        self.startExpectation()
        self.delegate.onMoveCardFromOrigin = { [weak self] (indexA:IndexPath, indexB:IndexPath) in
            XCTAssertNotEqual(indexA, indexB, "Origin and destination can't be the same")
            self?.expect?.fulfill()
        }
        
        self.model.moveCardLeft()
        self.waitExpectations()
    }
    
    func testMoveCardLeftUpdatesIndexPath() {
        self.model.moveCardLeft()
        XCTAssertNotEqual(self.model.indexPath, Constants.indexPath, "Failed to update indexPath")
    }
    
    func testMoveCardRightCallsDelegate() {
        self.startExpectation()
        self.delegate.onMoveCardFromOrigin = { [weak self] (indexA:IndexPath, indexB:IndexPath) in
            XCTAssertNotEqual(indexA, indexB, "Origin and destination can't be the same")
            self?.expect?.fulfill()
        }
        
        self.model.moveCardRight()
        self.waitExpectations()
    }
    
    func testMoveCardRightUpdatesIndexPath() {
        self.model.moveCardRight()
        XCTAssertNotEqual(self.model.indexPath, Constants.indexPath, "Failed to update indexPath")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
