import XCTest
@testable import Canvas

class TestCanvas:XCTestCase {
    private var model:Canvas!
    
    override func setUp() {
        super.setUp()
        self.model = Canvas()
    }
    
    func testNotRetainingDelegate() {
        self.model.delegate = MockCanvasDelegateProtocol()
        XCTAssertNil(self.model.delegate, "Retaining")
    }
    
    func testAssignCanvasEditorToPresenter() {
        XCTAssertNotNil(self.model.presenter.canvas, "Not assigned")
    }
    
    func testRefreshCallsPresenter() {
        var called:Bool = false
        let presenter:MockPresenterProtocol = MockPresenterProtocol()
        self.model.presenter = presenter
        presenter.onRefresh = {
            called = true
        }
        
        self.model.refresh()
        XCTAssertTrue(called, "Not called")
    }
    
    func testEditCardCallsDelegate() {
        var called:Bool = false
        let delegate:MockCanvasDelegateProtocol = MockCanvasDelegateProtocol()
        self.model.delegate = delegate
        delegate.onEditCardWithIdentifier = {
            called = true
        }
        
        self.model.editCardWith(identifier:String())
        XCTAssertTrue(called, "Not called")
    }
    
    func testEditColumnCallsDelegate() {
        var called:Bool = false
        let delegate:MockCanvasDelegateProtocol = MockCanvasDelegateProtocol()
        self.model.delegate = delegate
        delegate.onEditColumnWithIdentifier = {
            called = true
        }
        
        self.model.editColumnWith(identifier:String())
        XCTAssertTrue(called, "Not called")
    }
    
    func testCreateNewCardCallsDelegate() {
        var called:Bool = false
        let delegate:MockCanvasDelegateProtocol = MockCanvasDelegateProtocol()
        self.model.delegate = delegate
        delegate.onCreateNewCard = {
            called = true
        }
        
        self.model.createNewCard()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCreateNewColumnCallsDelegate() {
        var called:Bool = false
        let delegate:MockCanvasDelegateProtocol = MockCanvasDelegateProtocol()
        self.model.delegate = delegate
        delegate.onCreateNewColumn = {
            called = true
        }
        
        self.model.createNewColumn()
        XCTAssertTrue(called, "Not called")
    }
}
