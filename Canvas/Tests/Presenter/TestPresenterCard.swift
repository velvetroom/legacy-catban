import XCTest
@testable import Canvas
@testable import Board

class TestPresenterCard:XCTestCase {
    private var presenter:PresenterCard!
    private var view:MockView!
    private var mapColumn:MockMapColumnProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterCard()
        self.view = MockView()
        self.mapColumn = MockMapColumnProtocol()
        self.presenter.view = self.view
        self.presenter.mapColumn = self.mapColumn
    }
    
    func testNotRetainingView() {
        self.presenter.view = MockView()
        XCTAssertNil(self.presenter.view, "Retains")
    }
    
    func testNotRetainingColumn() {
        self.presenter.mapColumn = MockMapColumnProtocol()
        XCTAssertNil(self.presenter.mapColumn, "Retains")
    }
    
    func testNotRetainingCard() {
        self.presenter.card = MockCardProtocol()
        XCTAssertNil(self.presenter.card, "Retains")
    }
    
    func testViewItemIsCard() {
        let viewCard:ViewCard? = self.presenter.viewItem as? ViewCard
        XCTAssertNotNil(viewCard, "View item is not card")
    }
    
    func testLoadAssignsIdentifier() {
        let identifier:String = "lorem ipsum"
        let card:MockCardProtocol = MockCardProtocol()
        card.identifier = identifier
        self.presenter.card = card
        
        self.presenter.load()
        let viewCard:ViewCard? = self.presenter.viewItem as? ViewCard
        XCTAssertEqual(viewCard?.identifier, identifier, "Not assigned")
    }
    
    func testLoadAssignsContent() {
        let content:String = "hello world"
        let card:MockCardProtocol = MockCardProtocol()
        card.content = content
        self.presenter.card = card
        
        self.presenter.load()
        let viewCard:ViewCard? = self.presenter.viewItem as? ViewCard
        XCTAssertEqual(viewCard?.labelContent.text, content, "Not assigned")
    }
}
