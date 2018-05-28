import XCTest
@testable import Projects

class TestPresenterList:XCTestCase {
    private var presenter:PresenterList!
    private var view:ViewList!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterList()
        self.view = ViewList()
        self.presenter.items = [ViewModelListItem(), ViewModelListItem()]
        self.view.delegate = self.presenter
        self.view.dataSource = self.presenter
    }
    
    func testNumberOfItems() {
        XCTAssertEqual(self.presenter.items.count, self.view.numberOfItems(inSection:0), "Invalid sections")
    }
    
    func testCellviewType() {
        let indexPath:IndexPath = IndexPath(item:0, section:0)
        let cellview:UICollectionViewCell? = self.presenter.collectionView(self.view, cellForItemAt:indexPath)
        XCTAssertNotNil(cellview, "Failed to get cell")
        
        let listcell:ViewListCell? = cellview as? ViewListCell
        XCTAssertNotNil(listcell, "Invalid type")
    }
}
