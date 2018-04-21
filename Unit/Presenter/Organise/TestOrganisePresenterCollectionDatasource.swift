import XCTest
@testable import catban

class TestOrganisePresenterCollectionDatasource:XCTestCase {
    private var presenter:OrganisePresenterCollectionDatasource!
    private var viewModel:OrganiseViewModelCollection!
    private var item:OrganiseViewModelCollectionItem!
    private var view:MockOrganiseViewCollection!
    private var cell:MockOrganiseViewCollectionCell!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let name:String = "lorem ipsum"
        static let index:IndexPath = IndexPath(item:0, section:0)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenterCollectionDatasource()
        self.viewModel = OrganiseViewModelCollection()
        self.item = OrganiseViewModelCollectionItem()
        self.view = MockOrganiseViewCollection()
        self.cell = MockOrganiseViewCollectionCell()
        self.item.name = Constants.name
        self.viewModel.items.append(item)
        self.presenter.viewModel = self.viewModel
        self.view.cell = self.cell
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.item, "Failed to load item")
    }
    
    func testNumberOfItems() {
        let items:Int = self.presenter.collectionView(self.view, numberOfItemsInSection:0)
        XCTAssertEqual(items, self.viewModel.items.count, "Invalid number of items returned")
    }
    
    func testCellType() {
        let cell:UICollectionViewCell = self.presenter.collectionView(self.view, cellForItemAt:Constants.index)
        let organiseCell:OrganiseViewCollectionCell = cell as! OrganiseViewCollectionCell
        XCTAssertNotNil(organiseCell, "Invalid cell type returned")
    }
    
    func testCellName() {
        let cell:UICollectionViewCell = self.presenter.collectionView(self.view, cellForItemAt:Constants.index)
        let organiseCell:OrganiseViewCollectionCell = cell as! OrganiseViewCollectionCell
        XCTAssertEqual(organiseCell.labelName?.text, Constants.name, "Failed to update name in cell")
    }
    
    func testCellUpdateState() {
        self.startExpectation()
        self.cell.onUpdateState = { [weak self] in
            self?.expect?.fulfill()
        }
        
        let _:UICollectionViewCell = self.presenter.collectionView(self.view, cellForItemAt:Constants.index)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
