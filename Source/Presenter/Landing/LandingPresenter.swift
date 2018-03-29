import Foundation

struct LandingPresenter:LandingPresenterProtocol {
    var collection:LandingPresenterCollectionProtocol
    var collectionMenuAnimation:LandingPresenterCollectionMenuAnimationProtocol
    
    init() {
        self.collection = LandingPresenterCollection()
        self.collectionMenuAnimation = LandingPresenterCollectionMenuAnimation()
    }
}
