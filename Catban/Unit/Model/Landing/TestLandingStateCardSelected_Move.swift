import XCTest
@testable import catban

class TestLandingStateCardSelected_Move:XCTestCase {
    private var model:LandingStateCardSelected!
    private var project:MockProjectProtocol!
    private var delegate:MockLandingStateDelegateProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let indexPath:IndexPath = IndexPath(item:3, section:4)
        static let returnIndex:IndexPath = IndexPath(item:4, section:3)
    }
    
    override func setUp() {
        super.setUp()
        self.model = LandingStateCardSelected()
        self.delegate = MockLandingStateDelegateProtocol()
        self.project = MockProjectProtocol()
        self.delegate.project = self.project
        self.model.delegate = self.delegate
        self.model.indexPath = Constants.indexPath
        self.project.indexForCard = Constants.returnIndex
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
            XCTAssertEqual(indexB, Constants.returnIndex,
                           "Destination is not the same as indexForCard in project")
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
            XCTAssertEqual(indexB, Constants.returnIndex,
                           "Destination is not the same as indexForCard in project")
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
