import XCTest
@testable import catban

class TestLanding_DeleteColumn:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenterProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var collectionUpdateFactory:MockLandingCollectionUpdateFactoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let column:Int = 8342
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.presenter = MockLandingPresenterProtocol()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.collectionUpdateFactory = MockLandingCollectionUpdateFactoryProtocol()
        self.model.project = self.project
        self.model.presenter = self.presenter
        self.model.viewModelLoader = self.viewModelLoader
        self.model.collectionUpdateFactory = self.collectionUpdateFactory
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
    }
    
    func testDeleteCallsModel() {
        self.startExpectation()
        self.project.onDeleteColumnAt = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.column, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.deleteColumnAt(index:Constants.column)
        
        self.waitExpectation()
    }
    
    func testDeleteCallsPresenter() {
        self.startExpectation()
        self.presenter.onDeleteColumnAtIndex = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.column, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.deleteColumnAt(index:Constants.column)
        
        self.waitExpectation()
    }
    
    func testDeleteReloadsViewModel() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.deleteColumnAt(index:Constants.column)
        
        self.waitExpectation()
    }
    
    func testFactoryUpdateForMovingItems() {
        self.startExpectation()
        self.collectionUpdateFactory.onMovingItemsFromColumn = { [weak self] (index:Int, project:ProjectProtocol) in
            let project:MockProjectProtocol? = project as? MockProjectProtocol
            XCTAssertEqual(index, Constants.column, "Invalid index received")
            XCTAssertNotNil(project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.model.deleteColumnAt(index:Constants.column)
        
        self.waitExpectation()
    }
    
    func testFactoryUpdateForDeleteColumn() {
        self.startExpectation()
        self.collectionUpdateFactory.onDeleteColumnAtIndex = { [weak self] (index:Int, project:ProjectProtocol) in
            let project:MockProjectProtocol? = project as? MockProjectProtocol
            XCTAssertEqual(index, Constants.column, "Invalid index received")
            XCTAssertNotNil(project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.model.deleteColumnAt(index:Constants.column)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
