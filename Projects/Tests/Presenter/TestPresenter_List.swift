import XCTest
@testable import Projects

class TestPresenter_List:XCTestCase {
    private var view:View!
    private var board:MockBoardProjectsProtocol!
    private struct Constants {
        static let name:String = "lorem ipsum"
        static let frame:CGRect = CGRect(x:10, y:20, width:30, height:400)
    }
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.board = MockBoardProjectsProtocol()
        self.view.presenter.interactor.board = self.board
        var itemA:ViewModelListItem = ViewModelListItem()
        itemA.name = Constants.name
        let itemB:ViewModelListItem = ViewModelListItem()
        self.view.content.viewList.frame = Constants.frame
        XCTAssertNotNil(self.view.view)
        var viewModel:ViewModelList = ViewModelList()
        viewModel.items = [itemA, itemB]
        self.view.presenter.viewModel.update(property:viewModel)
    }
    
    func testNumberOfItems() {
        let viewModel:ViewModelList = self.view.presenter.viewModel.property()
        XCTAssertEqual(viewModel.items.count, self.view.content.viewList.numberOfItems(inSection:0), "Invalid sections")
    }
    
    func testCellviewType() {
        let indexPath:IndexPath = IndexPath(item:0, section:0)
        let cellview:UICollectionViewCell? = self.view.presenter.collectionView(self.view.content.viewList,
                                                                           cellForItemAt:indexPath)
        XCTAssertNotNil(cellview, "Failed to get cell")
        
        let listcell:ViewListCell? = cellview as? ViewListCell
        XCTAssertNotNil(listcell, "Invalid type")
    }
    
    func testConfigureCell() {
        let indexPath:IndexPath = IndexPath(item:0, section:0)
        let listcell:ViewListCell = self.view.presenter.collectionView(
            self.view.content.viewList, cellForItemAt:indexPath) as! ViewListCell
        XCTAssertEqual(listcell.labelName.text, Constants.name, "Not updated")
    }
    
    func testUpdatesCellState() {
        let indexPath:IndexPath = IndexPath(item:0, section:0)
        self.view.content.viewList.register(MockViewListCell.self,
                                            forCellWithReuseIdentifier:ViewConstants.ListItem.identifier)
        let _:UICollectionViewCell = self.view.presenter.collectionView(
            self.view.content.viewList, cellForItemAt:indexPath)
        XCTAssertNotNil(MockViewListCell.cell, "Not updated")
    }
    
    func testSizeForItem() {
        let size:CGSize = self.view.presenter.collectionView(
            self.view.content.viewList, layout:UICollectionViewLayout(), sizeForItemAt:IndexPath(item:0, section:0))
        XCTAssertEqual(size.width, Constants.frame.width, "Invalid width")
        XCTAssertEqual(size.height, ViewConstants.ListItem.height, "Invalid height")
    }
    
    func testEdgeInsets() {
        let insets:UIEdgeInsets = self.view.presenter.collectionView(
            self.view.content.viewList, layout:UICollectionViewLayout(), insetForSectionAt:0)
        XCTAssertNotEqual(insets, UIEdgeInsets.zero, "Invalid insets")
    }
}
