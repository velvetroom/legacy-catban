import Foundation

protocol LandingPresenterCollectionDataSourceProtocol:AnyObject {
    func columnAt(index:Int) -> ProjectColumn
    func moveItemFrom(origin:IndexPath, to destination:IndexPath)
    func deleteItemAt(indexPath:IndexPath)
    func edit(column:ProjectColumn)
}
