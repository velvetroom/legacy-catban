import XCTest
@testable import Tools

class TestNamerView_Calls:XCTestCase {
    private var interactor:MockNamerInteractorProtocol!
    private var view:NamerView<MockNamerInteractorProtocol>!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = NamerView<MockNamerInteractorProtocol>()
        self.transition = MockTransitionProtocol()
        self.interactor = self.view.presenter.interactor
        self.view.transition = self.transition
    }
    
    func testCancelledCallsInteractor() {
        var called:Bool = false
        self.interactor.onNamerCancelled = { called = true }
        self.view.selectorCancel()
        XCTAssertTrue(called, "Not called")
    }
    
    func testFinishedCallsInteractor() {
        var called:Bool = false
        let name:String = "hello world"
        self.view.content.viewField.text = name
        self.interactor.onNamerFinished = { (newName:String) in
            XCTAssertEqual(name, newName, "Invalid name received")
            called = true
        }
        self.view.selectorSave()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCancelledCallsPop() {
        var called:Bool = false
        self.transition.onPop = { called = true }
        self.view.selectorCancel()
        XCTAssertTrue(called, "Not called")
    }
    
    func testFinishedCallsPop() {
        var called:Bool = false
        self.transition.onPop = { called = true }
        self.view.selectorSave()
        XCTAssertTrue(called, "Not called")
    }
}
