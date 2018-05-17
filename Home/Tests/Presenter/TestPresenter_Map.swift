import XCTest
import Board
@testable import Home

class TestPresenter_Map:XCTestCase {
    private var presenter:Presenter!
    private var controller:Controller!
    private var project:ProjectManagedProtocol!
    private var viewScroll:ViewScroll!
    private var viewBoard:ViewBoard!
    private var viewColumn:ViewColumn!
    private var layoutLeft:NSLayoutConstraint!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.controller = Controller()
        self.project = MockProjectManagedProtocol()
        self.viewScroll = ViewScroll()
        self.viewBoard = ViewBoard()
        self.viewColumn = ViewColumn()
        self.layoutLeft = NSLayoutConstraint()
        self.viewColumn.layoutLeft = self.layoutLeft
        self.controller.project = self.project
        self.presenter.controller = self.controller
        self.presenter.outlets.viewBoard = self.viewBoard
        self.presenter.outlets.viewScroll = self.viewScroll
    }
    
    func testRestartsMapOnUpdate() {
        var column:MapColumn? = MapColumn()
        column?.view = self.viewColumn
        self.presenter.map.add(column:column!)
        column = nil
        
        self.presenter.shouldUpdate()
        XCTAssertNil(column, "Column not released")
    }
}
