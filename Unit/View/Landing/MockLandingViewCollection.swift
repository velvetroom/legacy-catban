import UIKit
@testable import catban

class MockLandingViewCollection:LandingViewCollection {
    var onReloadDataCalled:(() -> Void)?
    var onScrollToItem:((IndexPath) -> Void)?
    var onMoveItem:((IndexPath, IndexPath) -> Void)?
    var onReloadSectionsAt:((IndexSet) -> Void)?
    var onReloadItemAtIndex:(([IndexPath]) -> Void)?
    var onSelectItemAtIndex:((IndexPath?) -> Void)?
    var onInsertItemAtIndex:(([IndexPath]) -> Void)?
    var onDeleteItemAtIndex:(([IndexPath]) -> Void)?
    var onDeleteSections:((IndexSet) -> Void)?
    var onInsertSections:((IndexSet) -> Void)?
    var onClearSelection:(() -> Void)?
    var onPerformBatchUpdates:(() -> Void)?
    var onScrollToRect:((CGRect, Bool) -> Void)?
    var returnNumberOfItemsInSection:Int?
    
    override func reloadData() {
        super.reloadData()
        self.onReloadDataCalled?()
    }
    
    override func numberOfItems(inSection section:Int) -> Int {
        guard
            let items:Int = self.returnNumberOfItemsInSection
        else { return super.numberOfItems(inSection:section) }
        return items
    }
    
    override func performBatchUpdates(_ updates:(() -> Void)?, completion:((Bool) -> Void)? = nil) {
        self.onPerformBatchUpdates?()
        super.performBatchUpdates(updates, completion:completion)
    }
    
    override func moveItem(at indexPath:IndexPath, to newIndexPath:IndexPath) {
        self.onMoveItem?(indexPath, newIndexPath)
    }
    
    override func reloadSections(_ sections:IndexSet) {
        self.onReloadSectionsAt?(sections)
    }
    
    override func reloadItems(at indexPaths:[IndexPath]) {
        self.onReloadItemAtIndex?(indexPaths)
    }
    
    override func insertItems(at indexPaths:[IndexPath]) {
        self.onInsertItemAtIndex?(indexPaths)
    }
    
    override func deleteItems(at indexPaths:[IndexPath]) {
        self.onDeleteItemAtIndex?(indexPaths)
    }
    
    override func deleteSections(_ sections:IndexSet) {
        self.onDeleteSections?(sections)
    }
    
    override func insertSections(_ sections:IndexSet) {
        self.onInsertSections?(sections)
    }
    
    override func scrollToItem(
        at indexPath:IndexPath,
        at scrollPosition:UICollectionViewScrollPosition,
        animated:Bool) {
        self.onScrollToItem?(indexPath)
    }
    
    override func scrollRectToVisible(_ rect:CGRect, animated:Bool) {
        self.onScrollToRect?(rect, animated)
    }
    
    override func selectItem(at index:IndexPath?, animated:Bool, scrollPosition:UICollectionViewScrollPosition) {
        self.onSelectItemAtIndex?(index)
        super.selectItem(at:index, animated:animated, scrollPosition:scrollPosition)
    }
    
    override func clearSelection() {
        self.onClearSelection?()
    }
}
