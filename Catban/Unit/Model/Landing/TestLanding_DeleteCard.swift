import XCTest
@testable import catban

class TestLanding_DeleteCard:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenterProtocol!
    private var collection:MockLandingViewCollection!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let indexPath:IndexPath = IndexPath(item:324312, section:43212)
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.collection = MockLandingViewCollection()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.presenter = MockLandingPresenterProtocol()
        self.model.project = self.project
        self.model.presenter = self.presenter
        self.model.presenter.outlets.list.viewCollection = self.collection
        self.model.viewModelLoader = self.viewModelLoader
        self.model.editingCard = Constants.indexPath
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.collection, "Failed to load collection")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
//    func testDeleteClearsCurrentSelection() {
//        self.model.editingCard = IndexPath(item:1320, section:230)
//        self.model.state.deleteCard()
//
//        XCTAssertNil(self.model.editingCard, "Failed to clear editing card")
//    }
    
//    func testDeleteReloadsViewModel() {
//        self.startExpectation()
//        self.viewModelLoader.onLoadCalled = { [weak self] in
//            self?.expect?.fulfill()
//        }
//        
//        self.model.state.deleteCard()
//        self.waitExpectation()
//    }
//    
//    func testDeleteCallsDeleteOnProject() {
//        self.startExpectation()
//        self.project.onDeleteCardAt = { [weak self] (index:IndexPath) in
//            XCTAssertEqual(index, Constants.indexPath, "Invalid index path received")
//            self?.expect?.fulfill()
//        }
//        
//        self.model.state.deleteCard()
//        self.waitExpectation()
//    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
