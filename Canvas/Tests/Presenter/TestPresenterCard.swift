import XCTest
@testable import Canvas
@testable import Board

class TestPresenterCard:XCTestCase {
    private var presenter:PresenterCard!
    private var view:MockView!
    private var mapColumn:MockMapNestableColumnProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterCard()
        self.view = MockView()
        self.mapColumn = MockMapNestableColumnProtocol()
        self.presenter.view = self.view
        self.presenter.mapColumn = self.mapColumn
    }
    
    func testNotRetainingView() {
        self.presenter.view = MockView()
        XCTAssertNil(self.presenter.view, "Retains")
    }
    
    func testNotRetainingColumn() {
        self.presenter.mapColumn = MockMapNestableColumnProtocol()
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
    
    func testLoadAssignsIdentifierToView() {
        let identifier:String = "lorem ipsum"
        let card:MockCardProtocol = MockCardProtocol()
        card.identifier = identifier
        self.presenter.card = card
        
        self.presenter.load()
        let viewCard:ViewCard? = self.presenter.viewItem as? ViewCard
        XCTAssertEqual(viewCard?.identifier, identifier, "Not assigned")
    }
    
    func testLoadAssignsIdentifierToMap() {
        let identifier:String = "lorem ipsum"
        let card:MockCardProtocol = MockCardProtocol()
        card.identifier = identifier
        self.presenter.card = card
        
        self.presenter.load()
        let mapCard:MapCard? = self.presenter.mapItem as? MapCard
        XCTAssertEqual(mapCard?.identifier, identifier, "Not assigned")
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
    
    func testLoadAssignsHeight() {
        let content:String = "hello world"
        let card:MockCardProtocol = MockCardProtocol()
        card.content = content
        self.presenter.card = card
        
        self.presenter.load()
        XCTAssertGreaterThan(self.presenter.height, 0, "Height not assigned")
    }
    
    func testLoadActivatesConstraints() {
        let card:MockCardProtocol = MockCardProtocol()
        self.presenter.card = card
        self.presenter.load()
        XCTAssertTrue(self.presenter.viewItem.layoutTop.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewItem.layoutLeft.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewItem.layoutWidth.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewItem.layoutHeight.isActive, "Not active")
    }
}
