import XCTest
@testable import Projects

class TestPresenterList:XCTestCase {
    private var presenter:PresenterList!
    private var view:ViewList!
    private struct Constants {
        static let name:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterList()
        self.view = ViewList()
        self.view.delegate = self.presenter
        self.view.dataSource = self.presenter
        var itemA:ViewModelListItem = ViewModelListItem()
        itemA.name = Constants.name
        let itemB:ViewModelListItem = ViewModelListItem()
        self.presenter.items = [itemA, itemB]
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
    
    func testConfigureCell() {
        let indexPath:IndexPath = IndexPath(item:0, section:0)
        let listcell:ViewListCell = self.presenter.collectionView(
            self.view, cellForItemAt:indexPath) as! ViewListCell
        XCTAssertEqual(listcell.labelName.text, Constants.name, "Not updated")
    }
}
