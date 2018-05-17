import XCTest
import Board
@testable import Home

class TestPresenter_Drag:XCTestCase {
    private var presenter:Presenter!
    private var controller:Controller!
    private var project:ProjectManagedProtocol!
    private var viewScroll:ViewScroll!
    private var viewBoard:ViewBoard!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.controller = Controller()
        self.project = MockProjectManagedProtocol()
        self.viewScroll = ViewScroll()
        self.viewBoard = ViewBoard()
        self.controller.project = self.project
        self.presenter.controller = self.controller
        self.presenter.outlets.viewBoard = self.viewBoard
        self.presenter.outlets.viewScroll = self.viewScroll
    }
    
    func testCreatesNewDragOnUpdate() {
        self.presenter.drag.columns.append(MapColumn())
        XCTAssertFalse(self.presenter.drag.columns.isEmpty, "Failed to add column")
        self.presenter.shouldUpdate()
        XCTAssertTrue(self.presenter.drag.columns.isEmpty, "Not updated")
    }
    
    func testLoadsDragViews() {
        self.presenter.shouldUpdate()
        XCTAssertNotNil(self.presenter.drag.viewBoard, "Not loaded")
        XCTAssertNotNil(self.presenter.drag.viewScroll, "Not loaded")
    }
    
    func testLoadColumns() {
        self.configureProject()
        self.presenter.shouldUpdate()
        XCTAssertEqual(self.presenter.drag.columns.count, self.project.countColumns, "Invalid columns")
        XCTAssertNotNil(self.presenter.drag.columns.first?.view, "View not set")
    }
    
    private func configureProject() {
        let cardA:CardProtocol = CardFactory.newCard()
        let cardB:CardProtocol = CardFactory.newCard()
        let columnA:ColumnProtocol = ColumnFactory.newColumn()
        let columnB:ColumnProtocol = ColumnFactory.newColumn()
        columnA.add(card:cardA)
        columnA.add(card:cardB)
        self.project.add(column:columnA)
        self.project.add(column:columnB)
    }
}
