import XCTest

class UnitTest:XCTestCase {
    var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    func waitExpectations() {
        self.waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
