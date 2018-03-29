import Foundation

struct LandingPresenter:LandingPresenterProtocol {
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    var collectionMenuAnimation:LandingPresenterCollectionMenuAnimationProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
        self.collectionMenuAnimation = LandingPresenterCollectionMenuAnimation()
    }
}
