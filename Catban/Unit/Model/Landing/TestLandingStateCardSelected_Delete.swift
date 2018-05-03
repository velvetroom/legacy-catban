import XCTest
@testable import catban

class TestLandingStateCardSelected_Delete:XCTestCase {
    private var model:LandingStateCardSelected!
    private var project:MockProjectProtocol!
    private var delegate:MockLandingStateDelegateProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let indexPath:IndexPath = IndexPath(item:3, section:4)
    }
    
    override func setUp() {
        super.setUp()
        self.model = LandingStateCardSelected()
        self.delegate = MockLandingStateDelegateProtocol()
        self.project = MockProjectProtocol()
        self.delegate.project = self.project
        self.model.delegate = self.delegate
        self.model.indexPath = Constants.indexPath
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testCallDelegate() {
        self.startExpectation()
        self.delegate.onDeleteCardAtIndexPath = { [weak self] (indexPath:IndexPath) in
            XCTAssertEqual(indexPath, Constants.indexPath, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.deleteCard()
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
