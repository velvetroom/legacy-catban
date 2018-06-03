import XCTest
import Board
@testable import Shared
@testable import Card

class TestPresenterDelete:XCTestCase {
    private var controller:MockController!
    private var presenter:PresenterDelete!
    private var view:MockView!
    private var card:CardProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterDelete()
        self.view = MockView()
        self.card = CardFactory.newCard()
        self.controller = MockController()
        self.presenter.view = self.view
        self.presenter.card = self.card
        self.presenter.controller = self.controller
    }
    
    func testPresentController() {
        var presented:Bool = false
        self.view.onPresentController = {
            presented = true
        }
        
        self.presenter.askConfirmation()
        XCTAssertTrue(presented, "Not presented")
    }
    
    func testNotRetainingCard() {
        self.card = nil
        XCTAssertNil(self.presenter.card, "Retained")
    }
    
    func testNotRetainingView() {
        self.presenter.view = Shared.View()
        XCTAssertNil(self.presenter.view, "Retained")
    }
    
    func testNotRetainingController() {
        self.controller = nil
        XCTAssertNil(self.presenter.controller, "Retained")
    }
}
