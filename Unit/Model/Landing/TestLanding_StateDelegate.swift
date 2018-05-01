import XCTest
@testable import catban

class TestLanding_StateDelegate:XCTestCase {
    private var model:Landing!
    private var update:MockUpdateFactoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let indexPathA:IndexPath = IndexPath(item:12, section:23)
        static let indexPathB:IndexPath = IndexPath(item:12, section:23)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.update = MockUpdateFactoryProtocol()
        self.model.update = self.update
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.update, "Failed to load update")
    }
    
    func testMoveCard() {
        self.startExpectation()
        self.update.onMoveCardFrom = { [weak self] (indexA:IndexPath, indexB:IndexPath) in
            XCTAssertEqual(indexA, Constants.indexPathA, "Invalid index received")
            XCTAssertEqual(indexB, Constants.indexPathB, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.moveCardFrom(origin:Constants.indexPathA, to:Constants.indexPathB)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
