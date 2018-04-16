import XCTest
@testable import catban

class TestLoad:XCTestCase {
    private var model:Load!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Load()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.dispatchQueue, "Failed to load dispatch queue")
        XCTAssertEqual(self.model.dispatchQueue.qos, DispatchQoS.background, "Invalid quality of service")
    }
    
    func testLoadBoard() {
        self.startExpectation()
        
        self.model.loadBoard { [weak self] (board:BoardProtocol) in
            XCTAssertTrue(Thread.isMainThread, "Invalid thread on return")
            self?.expect?.fulfill()
        }
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
