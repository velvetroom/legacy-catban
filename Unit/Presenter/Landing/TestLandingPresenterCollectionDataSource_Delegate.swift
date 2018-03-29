import XCTest
@testable import catban

class TestLandingPresenterCollectionDataSource_Delegate:XCTestCase {
    private var presenter:LandingPresenterCollectionDataSource!
    private var delegate:MockLandingPresenterCollectionDataSourceProtocol!
    private var collectionView:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let movingSection:Int = 123
        static let originalIndex:Int = 24432
        static let destinationIndex:Int = 667
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionDataSource()
        self.delegate = MockLandingPresenterCollectionDataSourceProtocol()
        self.collectionView = MockLandingViewCollection()
        self.presenter.delegate = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
    
    func testMoveItem() {
        self.startExpectation()
        self.delegate.onReorderItem = { [weak self] (index:Int, destination:Int, section:Int) in
            XCTAssertEqual(index, Constants.originalIndex, "Invalid original index")
            XCTAssertEqual(destination, Constants.destinationIndex, "Invalid destination index")
            XCTAssertEqual(section, Constants.movingSection, "Invalid section")
            self?.expect?.fulfill()
        }
        
        self.moveItem()
        
        self.waitExpectation()
    }
    
    func testReloadCollection() {
        self.startExpectation()
        let viewModel:LandingViewModelCollection = LandingViewModelCollection()
        self.delegate.onReloadCollection = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.update(viewModel:viewModel, reloadCollection:true)
        
        self.waitExpectation()
    }
    
    func testNotReloadCollection() {
        self.startExpectation()
        let viewModel:LandingViewModelCollection = LandingViewModelCollection()
        self.delegate.onReloadCollection = {
            XCTAssertTrue(false, "Collection should not be reloaded")
        }
        
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.2) { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.update(viewModel:viewModel, reloadCollection:false)
        
        self.waitExpectation()
    }
    
    private func moveItem() {
        let originalIndex:IndexPath = IndexPath(item:Constants.originalIndex, section:Constants.movingSection)
        let destinationIndex:IndexPath = IndexPath(item:Constants.destinationIndex, section:Constants.movingSection)
        self.presenter.collectionView(self.collectionView, moveItemAt:originalIndex, to:destinationIndex)
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
