import XCTest
@testable import catban

class TestLanding_UpdateCard:XCTestCase {
    private var model:Landing!
    private var presenter:MockLandingPresenterProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let text:String = "lorem ipsum"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.presenter = MockLandingPresenterProtocol()
        self.model.presenter = self.presenter
        self.viewModelLoader = MockLandingViewModelLoader()
        self.model.viewModelLoader = self.viewModelLoader
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
    }
    
    func testUpdateEditingCardCallsPresenter() {
        let index:IndexPath = IndexPath(item:0, section:0)
        self.startExpectation()
        self.model.editingCard = index
        self.presenter.onUpdateCardAtIndex = { [weak self] (indexReceived:IndexPath) in
            XCTAssertEqual(index, indexReceived, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.updateCardAt(indexPath:index)
        
        self.waitExpectation()
    }
    
    func testViewModelGetsUpdatedOnUpdateCard() {
        let index:IndexPath = IndexPath(item:0, section:0)
        self.startExpectation()
        self.model.editingCard = index
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.updateCardAt(indexPath:index)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
