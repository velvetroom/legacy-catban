import XCTest
@testable import catban

class TestOrganisePresenterCollectionDelegate:XCTestCase {
    private var presenter:OrganisePresenterCollectionDelegate!
    private var view:MockOrganiseViewCollection!
    private var delegate:MockOrganisePresenterCollectionDelegateDelegateProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let frame:CGRect = CGRect(x:0, y:0, width:100, height:100)
        static let indexPath:IndexPath = IndexPath(item:131, section:1312)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenterCollectionDelegate()
        self.view = MockOrganiseViewCollection()
        self.delegate = MockOrganisePresenterCollectionDelegateDelegateProtocol()
        self.view.frame = Constants.frame
        self.presenter.delegate = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
    
    func testSizeForItem() {
        let size:CGSize = self.presenter.collectionView(
            self.view, layout:self.view.collectionViewLayout, sizeForItemAt:Constants.indexPath)
        XCTAssertEqual(size.width, Constants.frame.width, "Invalid with for cell")
        XCTAssertEqual(size.height, OrganisePresenterCollectionDelegate.Constants.cellHeight,
                       "Invalid height for cell")
    }
    
    func testDidSelectItem() {
        self.startExpectation()
        self.delegate.onDelegateSelectCellAtIndex = { [weak self] (index:IndexPath) in
            XCTAssertEqual(Constants.indexPath, index, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.presenter.collectionView(self.view, didSelectItemAt:Constants.indexPath)
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
