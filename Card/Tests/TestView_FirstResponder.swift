import XCTest
import Board
import Shared
@testable import Card

class TestView_FirstResponder:XCTestCase {
    private var view:Card.View!
    private var text:MockViewText!
    private var project:MockProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Card.View()
        self.text = MockViewText()
        self.project = MockProjectManagedProtocol()
        self.view.content.viewText = self.text
        self.view.presenter.interactor.project = self.project
    }
    
    func testTextBecomesFirstResponder() {
        var firstResponder:Bool = false
        self.text.onBecomeFirstResponder = { firstResponder = true }
        self.view.didAppear()
        XCTAssertTrue(firstResponder, "Not first responder")
    }
    
    func testTextResignsFirstResponderOnDone() {
        var resigns:Bool = false
        self.text.onResignsFirstResponder = { resigns = true }
        self.view.selectorDone(button:UIBarButtonItem())
        XCTAssertTrue(resigns, "Not resigning")
    }
    
    func testTextResignsFirstResponderOnDelete() {
        var resigns:Bool = false
        self.text.onResignsFirstResponder = { resigns = true }
        self.view.selectorDelete(button:UIBarButtonItem())
        XCTAssertTrue(resigns, "Not resigning")
    }
}
