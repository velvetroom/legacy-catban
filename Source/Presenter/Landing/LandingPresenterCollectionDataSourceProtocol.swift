import Foundation

protocol LandingPresenterCollectionDataSourceProtocol:AnyObject {
    func reorderItemFrom(index:Int, to destination:Int, in section:Int)
}
