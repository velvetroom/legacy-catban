import Foundation
@testable import catban

class MockLandingPresenterProtocol:LandingPresenterProtocol {
    var onUpdateViewModel:(() -> Void)?
    var onApplyUpdates:(([CollectionUpdateProtocol]) -> Void)?
    var onUpdateColumnAtIndex:((Int) -> Void)?
    var onUpdateCardAtIndex:((IndexPath) -> Void)?
    var onInsertCardAtIndex:((IndexPath) -> Void)?
    var onDeleteCardAtIndex:((IndexPath) -> Void)?
    var onDeleteColumnAtIndex:((Int) -> Void)?
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
    }
    
    func update(viewModel:LandingViewModel) {
        self.onUpdateViewModel?()
    }
    
    func apply(updates:[CollectionUpdateProtocol]) {
        self.onApplyUpdates?(updates)
    }
    
    func updateColumnAt(index:Int) {
        self.onUpdateColumnAtIndex?(index)
    }
    
    func updateCardAt(index:IndexPath) {
        self.onUpdateCardAtIndex?(index)
    }
    
    func insertCardAt(index:IndexPath) {
        self.onInsertCardAtIndex?(index)
    }
    
    func deleteCardAt(index:IndexPath) {
        self.onDeleteCardAtIndex?(index)
    }
    
    func deleteColumnAt(index:Int) {
        self.onDeleteColumnAtIndex?(index)
    }
}
