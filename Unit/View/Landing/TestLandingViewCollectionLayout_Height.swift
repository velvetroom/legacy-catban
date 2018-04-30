import XCTest
@testable import catban

class TestLandingViewCollectionLayout_Height:XCTestCase {
    private var layout:LandingViewCollectionLayout!
    private var viewModel:LandingViewModelCollectionLayout!
    private var view:MockLandingViewCollection!
    private struct Constants {
        static let smallerHeight:CGFloat = 100
        static let biggerHeight:CGFloat = 200
    }
    
    override func setUp() {
        super.setUp()
        self.layout = LandingViewCollectionLayout()
        self.viewModel = LandingViewModelCollectionLayout()
        self.view = MockLandingViewCollection()
        self.layout.viewModel = self.viewModel
        self.view.setCollectionViewLayout(self.layout, animated:false)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.layout, "Failed to load layout")
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.layout.collectionView, "Failed to assign collection to layout")
    }
    
    func testUseViewModelHeight() {
        self.updateView(height:Constants.smallerHeight)
        self.updateViewModel(height:Constants.biggerHeight)
        
        let height:CGFloat = self.layout.collectionViewContentSize.height
        
        XCTAssertEqual(height, Constants.biggerHeight, "Layout should use view model height")
    }
    
    func testUseViewHeight() {
        self.updateView(height:Constants.biggerHeight)
        self.updateViewModel(height:Constants.smallerHeight)
        
        let height:CGFloat = self.layout.collectionViewContentSize.height
        
        XCTAssertEqual(height, Constants.biggerHeight, "Layout should use view height")
    }
    
    private func updateView(height:CGFloat) {
        self.view.frame = CGRect(x:1, y:1, width:1, height:height)
    }
    
    private func updateViewModel(height:CGFloat) {
        self.layout.viewModel.contentSize = CGSize(width:1, height:height)
    }
}
