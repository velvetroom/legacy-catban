import Foundation

struct LandingPresenter:LandingPresenterProtocol {
    let collection:LandingPresenterCollectionProtocol
    let collectionMenuAnimation:LandingPresenterCollectionMenuAnimationProtocol
    
    init() {
        self.collection = LandingPresenterCollection()
        self.collectionMenuAnimation = LandingPresenterCollectionMenuAnimation()
    }
}
