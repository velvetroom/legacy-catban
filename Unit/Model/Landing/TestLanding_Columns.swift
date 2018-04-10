import XCTest
@testable import catban

class TestLanding_Columns:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenterProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let columnIndex:Int = 993
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.presenter = MockLandingPresenterProtocol()
        self.model.project = self.project
        self.model.presenter = self.presenter
        self.model.viewModelLoader = self.viewModelLoader
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
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
        
        self.model.updateColumnAt(index:Constants.columnIndex)
        
        self.waitExpectations()
    }
    
    func testUpdateColumnAtIndexUpdatesPresenter() {
        self.startExpectation()
        self.presenter.onUpdateColumnAtIndex = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.columnIndex, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.updateColumnAt(index:Constants.columnIndex)
        
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
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
