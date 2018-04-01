import XCTest
@testable import catban

class TestLandingViewModelLoaderOutlets_CollectionMenu:XCTestCase {
    private var loader:LandingViewModelLoaderOutlets!
    private var loaderCollectionMenu:MockLandingViewModelLoaderCollectionMenu!
    private var model:LandingProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoaderOutlets()
        self.loaderCollectionMenu = MockLandingViewModelLoaderCollectionMenu()
        self.model = Landing()
        self.loader.collectionMenu = self.loaderCollectionMenu
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
        XCTAssertNotNil(self.loaderCollectionMenu, "Failed to load collection menu")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testFactoryIsCalled() {
        self.startExpectation()
        self.model.editingCard = IndexPath(item:0, section:0)
        self.loaderCollectionMenu.onFactory = { [weak self] in
            self?.expect?.fulfill()
        }
        
        let _:LandingViewModelOutlets = self.loader.factoryWith(model:self.model)
        
        self.waitExpectation()
    }
    
    func testFactoryIsNotCalled() {
        self.startExpectation()
        self.loaderCollectionMenu.onFactory = {
            XCTAssertTrue(false, "Factory should not be called")
        }
        
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.2) { [weak self] in
            self?.expect?.fulfill()
        }
        
        let _:LandingViewModelOutlets = self.loader.factoryWith(model:self.model)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
