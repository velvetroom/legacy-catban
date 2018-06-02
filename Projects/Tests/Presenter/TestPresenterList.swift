import XCTest
@testable import Projects

class TestPresenterList:XCTestCase {
    private var presenter:PresenterList!
    private var view:ViewList!
    private struct Constants {
        static let name:String = "lorem ipsum"
        static let frame:CGRect = CGRect(x:10, y:20, width:30, height:400)
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
        self.view.frame = Constants.frame
        self.presenter.view = self.view
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
    
    func testUpdatesCellState() {
        let indexPath:IndexPath = IndexPath(item:0, section:0)
        self.view.register(MockViewListCell.self, forCellWithReuseIdentifier:ViewConstants.ListItem.identifier)
        let _:UICollectionViewCell = self.presenter.collectionView(self.view, cellForItemAt:indexPath)
        XCTAssertNotNil(MockViewListCell.cell, "Not updated")
    }
    
    func testSizeForItem() {
        let size:CGSize = self.presenter.collectionView(
            self.view, layout:UICollectionViewLayout(), sizeForItemAt:IndexPath(item:0, section:0))
        XCTAssertEqual(size.width, Constants.frame.width, "Invalid width")
        XCTAssertEqual(size.height, ViewConstants.ListItem.height, "Invalid height")
    }
    
    func testEdgeInsets() {
        let insets:UIEdgeInsets = self.presenter.collectionView(
            self.view, layout:UICollectionViewLayout(), insetForSectionAt:0)
        XCTAssertNotEqual(insets, UIEdgeInsets.zero, "Invalid insets")
    }
    
    func testNotRetaining() {
        self.presenter.view = ViewList()
        XCTAssertNil(self.presenter.view, "Retains")
    }
}
