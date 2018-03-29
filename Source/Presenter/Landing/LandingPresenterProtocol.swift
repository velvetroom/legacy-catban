import Foundation

protocol LandingPresenterProtocol {
    var outlets:LandingPresenterOutletsProtocol { get set }
    var collection:LandingPresenterCollectionProtocol { get set }
    var collectionMenuAnimation:LandingPresenterCollectionMenuAnimationProtocol { get set }
}
