import XCTest
@testable import Projects

class TestStates:XCTestCase {
    private var interactor:Interactor!
    private var states:MockStateProtocol!
    
    override func setUp() {
        super.setUp()
        self.interactor = Interactor()
        self.states = MockStateProtocol()
        self.interactor.state = self.states
    }
    
    func testOpenNamerCallsState() {
        var called:Bool = false
        self.states.onOpenNamer = { called = true }
        self.interactor.openNamer()
        XCTAssertTrue(called, "Not called")
    }
    
    func testNamerFinishedCallsState() {
        var called:Bool = false
        self.states.onNamerFinished = { called = true }
        self.interactor.namerFinishedWith(name:String())
        XCTAssertTrue(called, "Not called")
    }
}
