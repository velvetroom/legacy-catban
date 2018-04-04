import XCTest
@testable import catban

class TestWriter:XCTestCase {
    private var model:Writer!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let text:String = "lorem ipsum"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Writer()
        self.model.text = Constants.text
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.text, "Failed to load text")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
        XCTAssertNil(self.model.onFinish, "Property should not be set")
    }
    
    func testCallOnFinish() {
        self.startExpectation()
        self.model.onFinish = { [weak self] (text:String) in
            XCTAssertEqual(text, Constants.text, "Invalid text received")
            self?.expect?.fulfill()
        }
        
        self.model.finishedWriting()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
