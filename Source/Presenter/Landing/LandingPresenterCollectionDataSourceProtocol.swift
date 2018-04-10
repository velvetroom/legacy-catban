import Foundation

protocol LandingPresenterCollectionDataSourceProtocol:AnyObject {
    func columnAt(index:Int) -> ProjectColumn
    func moveItemFrom(origin:IndexPath, to destination:IndexPath)
    func deleteSelectedItem()
    func edit(column:ProjectColumn)
}
