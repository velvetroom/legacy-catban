import XCTest
@testable import catban

class UnitTest:XCTestCase {
    var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        self.waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
