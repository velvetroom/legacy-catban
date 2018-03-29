import Foundation

protocol LandingPresenterProtocol {
    var collection:LandingPresenterCollectionProtocol { get set }
    var collectionMenuAnimation:LandingPresenterCollectionMenuAnimationProtocol { get set }
}
