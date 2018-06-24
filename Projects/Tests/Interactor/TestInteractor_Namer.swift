import XCTest
@testable import Projects

class TestInteractor_Namer:XCTestCase {
    private var view:Projects.View!
    private var state:MockStateProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Projects.View()
        self.state = MockStateProtocol()
        self.view.presenter.interactor.state = self.state
    }
    
    func testNamerFinishedCallsState() {
        var called:Bool = false
        self.state.onNamerFinished = { called = true }
        self.view.presenter.interactor.namerFinishedWith(name:String())
        XCTAssertTrue(called, "Not called")
    }
    
    func testNamerCancelledChangesToDefault() {
        self.view.presenter.interactor.state = StateRename()
        self.view.presenter.interactor.namerCancelled()
        let state:StateDefault? = self.view.presenter.interactor.state as? StateDefault
        XCTAssertNotNil(state, "Invalid state")
    }
    
    func testOpenNamerCallsState() {
        var called:Bool = false
        self.state.onOpenNamer = { called = true }
        self.view.presenter.interactor.openNamer()
        XCTAssertTrue(called, "Not called")
    }
}
