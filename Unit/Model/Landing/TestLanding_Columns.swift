import XCTest
@testable import catban

class TestLanding_Columns:XCTestCase {
    private var model:Landing!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenterProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var column:ProjectColumn!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let columnIndex:Int = 993
        static let name:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.column = ProjectColumn()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.presenter = MockLandingPresenterProtocol()
        self.model.board = self.board
        self.model.project = self.project
        self.model.presenter = self.presenter
        self.model.viewModelLoader = self.viewModelLoader
        self.project.returnColumn = self.column
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.column, "Failed to load column")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
    }
    
    func testColumnAtIndex() {
        self.startExpectation()
        self.project.onColumnAtIndex = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.columnIndex, "Invalid index requested")
            self?.expect?.fulfill()
        }
        
        let _:ProjectColumn = self.model.columnAt(index:Constants.columnIndex)
        self.waitExpectations()
    }
    
    func testUpdateColumnAtIndexReloadsViewModel() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.updateColumnAt(index:Constants.columnIndex, with:Constants.name)
        self.waitExpectations()
    }
    
    func testUpdateColumnAtIndexUpdatesPresenter() {
        self.startExpectation()
        self.presenter.onUpdateColumnAtIndex = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.columnIndex, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.updateColumnAt(index:Constants.columnIndex, with:Constants.name)
        self.waitExpectations()
    }
    
    func testIndexForColumn() {
        self.startExpectation()
        let column:ProjectColumn = ProjectColumn()
        self.project.onIndexForColumn = { [weak self] (receivedColumn:ProjectColumn) in
            XCTAssertTrue(column === receivedColumn, "Invalid column received")
            self?.expect?.fulfill()
        }
        
        let _:Int = self.model.indexFor(column:column)
        self.waitExpectations()
    }
    
    func testUpdateColumnSavesProject() {
        self.startExpectation()
        self.board.onSaveProject = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.updateColumnAt(index:Constants.columnIndex, with:Constants.name)
        self.waitExpectations()
    }
    
    func testUpdateColumnUpdatesName() {
        self.column.name = String()
        self.model.updateColumnAt(index:Constants.columnIndex, with:Constants.name)
        XCTAssertEqual(self.column.name, Constants.name, "Failed to update name")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
