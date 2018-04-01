import Foundation

protocol LandingPresenterCollectionDataSourceProtocol:AnyObject {
    func moveItemFrom(origin:IndexPath, to destination:IndexPath)
}
