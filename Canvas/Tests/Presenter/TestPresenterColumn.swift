import XCTest
@testable import Canvas
@testable import Board

class TestPresenterColumn:XCTestCase {
    private var presenter:PresenterColumn!
    private var view:MockView!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterColumn()
        self.view = MockView()
        self.presenter.view = self.view
    }
    
    func testNotRetainingView() {
        self.presenter.view = View()
        XCTAssertNil(self.presenter.view, "Retains")
    }
    
    func testNotRetainingColumn() {
        self.presenter.column = MockColumnProtocol()
        XCTAssertNil(self.presenter.column, "Retains")
    }
    
    func testAssignViewToColumn() {
        XCTAssertNotNil(self.presenter.mapColumn.view, "Not assigning")
    }
    
    func testLoadAssignName() {
        let name:String = "lorem ipsum"
        let column:MockColumnProtocol = MockColumnProtocol()
        column.name = name
        self.presenter.column = column
        
        self.presenter.load()
        XCTAssertEqual(self.presenter.viewColumn.labelName.text, name, "Not assigned")
    }
    
    func testLoadAddsChildren() {
        let column:MockColumnProtocol = MockColumnProtocol()
        column.cards.append(MockCardProtocol())
        self.presenter.column = column
        
        self.presenter.load()
        XCTAssertNotNil(self.presenter.mapColumn.childItem, "Not loaded")
    }
    
    func testLoadNewCardAssignsNewCard() {
        let column:MockColumnProtocol = MockColumnProtocol()
        self.presenter.column = column
        self.presenter.load()
        
        self.presenter.loadNewCard()
        let newCard:MapNewCard? = self.presenter.mapColumn.childItem as? MapNewCard
        XCTAssertNotNil(newCard, "Not loaded")
    }
    
    func testLoadActivateConstraints() {
        let column:MockColumnProtocol = MockColumnProtocol()
        self.presenter.column = column
        self.presenter.load()
        
        XCTAssertTrue(self.presenter.viewColumn.layoutTop.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewColumn.layoutLeft.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewColumn.layoutWidth.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewColumn.layoutHeight.isActive, "Not active")
    }
}
