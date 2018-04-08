import XCTest
@testable import catban

class TestLandingViewCollectionCell:XCTestCase {
    private var cell:LandingViewCollectionCell!
    private var delegate:MockLandingPresenterCollectionDataSourceProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.cell = LandingViewCollectionCell(frame:CGRect.zero)
        self.delegate = MockLandingPresenterCollectionDataSourceProtocol()
        self.cell.delegate = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.cell, "Failed to load cell")
        XCTAssertNotNil(self.cell.labelTitle, "Failed to load title")
        XCTAssertNotNil(self.cell.buttonDelete, "Failed to load button")
        XCTAssertNotNil(self.cell.indexPath, "Failed to load index path")
        XCTAssertNotNil(self.cell.delegate, "Failed to load delegate")
    }
    
    func testHideDeleteOnUnselect() {
        self.cell.isSelected = false
        XCTAssertTrue(self.cell.buttonDelete.isHidden, "Failed to hide button")
    }
    
    func testShowDeleteOnSelect() {
        self.cell.isSelected = true
        XCTAssertFalse(self.cell.buttonDelete.isHidden, "Failed to hide button")
    }
    
    func testDeleteItem() {
        let indexPath:IndexPath = IndexPath(item:2923, section:3242)
        self.startExpectation()
        self.delegate.onDeleteItem = { [weak self] (index:IndexPath) in
            XCTAssertEqual(index, indexPath, "Invalid index for deletion")
            self?.expect?.fulfill()
        }
        
        self.cell.indexPath = indexPath
        self.cell.selectorDelete(sender:UIButton())
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
