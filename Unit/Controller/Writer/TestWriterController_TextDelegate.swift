import XCTest
@testable import catban

class TestWriterController_TextDelegate:XCTestCase {
    private var controller:WriterController!
    private var viewText:MockWriterViewText!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let text:String = "lorem ipsum"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = WriterController()
        self.viewText = MockWriterViewText()
        self.viewText.text = Constants.text
        self.controller.model.presenter.outlets.list.viewText = self.viewText
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testUpdateModelAfterResignFirstResponder() {
        self.controller.textViewDidChange(self.viewText)
        
        XCTAssertEqual(self.controller.model.text, Constants.text, "Failed to update model")
    }
    
    func testResignFirstResponderOnDone() {
        self.startExpectation()
        self.viewText.onResignResponder = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorDone(sender:UIButton())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
