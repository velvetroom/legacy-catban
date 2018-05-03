import XCTest
@testable import catban

class TestLandingPresenterOutlets_CollectionMenu:XCTestCase {
    private var presenter:LandingPresenterOutlets!
    private var viewModel:LandingViewModelOutlets!
    private var layoutBottom:NSLayoutConstraint!
    private var buttonMoveRight:UIButton!
    private var buttonMoveLeft:UIButton!
    private struct Constants {
        static let initialBottom:CGFloat = 231
        static let expectedBottom:CGFloat = 4533
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterOutlets()
        self.viewModel = LandingViewModelOutlets()
        self.layoutBottom = NSLayoutConstraint()
        self.buttonMoveRight = UIButton()
        self.buttonMoveLeft = UIButton()
        self.presenter.list.layoutCollectionMenuBottom = self.layoutBottom
        self.presenter.list.buttonCollectionMenuMoveRight = self.buttonMoveRight
        self.presenter.list.buttonCollectionMenuMoveLeft = self.buttonMoveLeft
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testUpdateLayoutBottom() {
        self.layoutBottom.constant = Constants.initialBottom
        self.viewModel.collectionMenu.layoutBottom = Constants.expectedBottom
        
        self.presenter.update(viewModel:self.viewModel)
        
        XCTAssertEqual(self.layoutBottom.constant, Constants.expectedBottom, "Failed to update layout bottom")
    }
    
    func testEnableButtonMoveRight() {
        self.buttonMoveRight.isEnabled = false
        self.viewModel.collectionMenu.moveRightEnabled = true
        
        self.presenter.update(viewModel:self.viewModel)
        
        XCTAssertTrue(self.buttonMoveRight.isEnabled, "Failed to enable move right")
    }
    
    func testDisableButtonMoveRight() {
        self.buttonMoveRight.isEnabled = true
        self.viewModel.collectionMenu.moveRightEnabled = false
        
        self.presenter.update(viewModel:self.viewModel)
        
        XCTAssertFalse(self.buttonMoveRight.isEnabled, "Failed to disable move right")
    }
    
    func testEnableButtonMoveLeft() {
        self.buttonMoveLeft.isEnabled = false
        self.viewModel.collectionMenu.moveLeftEnabled = true
        
        self.presenter.update(viewModel:self.viewModel)
        
        XCTAssertTrue(self.buttonMoveLeft.isEnabled, "Failed to enable move left")
    }
    
    func testDisableButtonMoveLeft() {
        self.buttonMoveLeft.isEnabled = true
        self.viewModel.collectionMenu.moveLeftEnabled = false
        
        self.presenter.update(viewModel:self.viewModel)
        
        XCTAssertFalse(self.buttonMoveLeft.isEnabled, "Failed to disable move left")
    }
}
