import Foundation

class LandingPresenter:LandingPresenterProtocol {
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    private var viewCollection:LandingViewCollection? {
        get {
            return self.outlets.list.viewCollection
        }
    }
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
    }
    
    func update(viewModel:LandingViewModel) {
        self.collection.update(viewModel:viewModel.collection)
        self.outlets.update(viewModel:viewModel.outlets)
    }
    
    func apply(updates:[CollectionUpdateProtocol]) {
        guard
            let viewCollection:LandingViewCollection = self.viewCollection
        else {
            return
        }
        viewCollection.performBatchUpdates({
            for update:CollectionUpdateProtocol in updates {
                update.strategy(collectionView:viewCollection)
            }
        }, completion:nil)
    }
    
    func updateColumnAt(index:Int) {
        let indexSet:IndexSet = IndexSet(integer:index)
        self.viewCollection?.reloadSections(indexSet)
    }
    
    func updateCardAt(index:IndexPath) {
        self.viewCollection?.reloadItems(at:[index])
    }
    
    func insertCardAt(index:IndexPath) {
        self.viewCollection?.insertItems(at:[index])
    }
    
    func deleteCardAt(index:IndexPath) {
        self.viewCollection?.deleteItems(at:[index])
    }
    
    func deleteColumnAt(index:Int) {
        let indexSet:IndexSet = IndexSet(integer:index)
        self.viewCollection?.deleteSections(indexSet)
    }
}
