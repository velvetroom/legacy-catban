import Foundation

protocol LandingPresenterCollectionProtocol {
    var delegate:LandingPresenterCollectionDelegate { get }
    var dataSource:LandingPresenterCollectionDataSource { get }
    var gesture:LandingPresenterCollectionGesture { get }
}
