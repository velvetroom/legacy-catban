import UIKit
@testable import catban

class MockLandingViewCollection:LandingViewCollection {
    var onReloadDataCalled:(() -> Void)?
    var onScrollToItem:((IndexPath) -> Void)?
    var onMoveItem:((IndexPath, IndexPath) -> Void)?
    var onReloadItemAtIndex:(([IndexPath]) -> Void)?
    var onSelectItemAtIndex:((IndexPath?) -> Void)?
    var onInsertItemAtIndex:(([IndexPath]) -> Void)?
    var onClearSelection:(() -> Void)?
    var returnNumberOfItemsInSection:Int?
    
    override func reloadData() {
        super.reloadData()
        self.onReloadDataCalled?()
    }
    
    override func numberOfItems(inSection section:Int) -> Int {
        guard
            let items:Int = self.returnNumberOfItemsInSection
        else {
            return super.numberOfItems(inSection:section)
        }
        return items
    }
    
    override func moveItem(at indexPath:IndexPath, to newIndexPath:IndexPath) {
        self.onMoveItem?(indexPath, newIndexPath)
    }
    
    override func reloadItems(at indexPaths:[IndexPath]) {
        self.onReloadItemAtIndex?(indexPaths)
    }
    
    override func insertItems(at indexPaths:[IndexPath]) {
        self.onInsertItemAtIndex?(indexPaths)
    }
    
    override func scrollToItem(
        at indexPath:IndexPath,
        at scrollPosition:UICollectionViewScrollPosition,
        animated:Bool) {
        self.onScrollToItem?(indexPath)
    }
    
    override func selectItem(at index:IndexPath?, animated:Bool, scrollPosition:UICollectionViewScrollPosition) {
        self.onSelectItemAtIndex?(index)
        super.selectItem(at:index, animated:animated, scrollPosition:scrollPosition)
    }
    
    override func clearSelection() {
        self.onClearSelection?()
    }
}
