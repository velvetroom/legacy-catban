import XCTest
@testable import Card

class TestPresenterOutletsLoader:XCTestCase {
    private var presenter:Presenter!
    private var loader:PresenterOutletsLoader!
    private var presenterForKeyboard:MockPresenterForKeyboard!
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.loader = PresenterOutletsLoader()
        self.view = View()
        self.presenterForKeyboard = MockPresenterForKeyboard()
        self.loader.presenter = self.presenter
        self.loader.view = view
        self.presenter.presenterForKeyboard = self.presenterForKeyboard
    }
    
    func testLoadView() {
        XCTAssertNotNil(self.loader.loadOulets().view, "Not loaded")
    }
    
    func testNotRetainingPresenter() {
        self.loader.presenter = Presenter()
        XCTAssertNil(self.loader.presenter, "Retains")
    }
    
    func testLoadText() {
        XCTAssertNotNil(self.loader.loadOulets().viewText, "Not loaded")
    }
    
    func testLoadTextLayoutBottom() {
        XCTAssertNotNil(self.loader.loadOulets().viewText?.layoutBottom, "Not loaded")
    }
    
    func testNotRetainingView() {
        self.view = nil
        XCTAssertNil(self.loader.view, "Retaining view")
    }
    
    func testStartListeningForKeyboard() {
        var started:Bool = false
        self.presenterForKeyboard.onStartListening = {
            started = true
        }
        
        let _:PresenterOutlets = self.loader.loadOulets()
        XCTAssertTrue(started, "Failed to start listening")
    }
}
