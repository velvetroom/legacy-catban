import XCTest
@testable import catban

class TestWriterController_TextDelegate:XCTestCase {
    private var controller:MockWriterController!
    private var navigation:MockNavigationController!
    private var model:MockWriterProtocol!
    private var viewText:MockWriterViewText!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let text:String = "lorem ipsum"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = MockWriterController()
        self.viewText = MockWriterViewText()
        self.model = MockWriterProtocol()
        self.navigation = MockNavigationController()
        self.controller.model = self.model
        self.viewText.text = Constants.text
        self.controller.model.presenter.outlets.list.viewText = self.viewText
        self.controller.returnPresentingController = self.navigation
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.viewText, "Failed to load view text")
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
    
    func testFinishWritingFinishesModel() {
        self.startExpectation()
        self.controller.model.onFinish = { [weak self] (text:String) in
            self?.expect?.fulfill()
        }
        
        self.controller.finishWriting()
        
        self.waitExpectations()
    }
    
    func testFinishWritingDismissController() {
        self.startExpectation()
        self.navigation.onDismiss = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.finishWriting()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
