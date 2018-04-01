import Foundation

extension LandingController:LandingPresenterCollectionDataSourceProtocol {
    func reorderItemFrom(index:Int, to destination:Int, in section:Int) {
        self.model.reorderItemFrom(index:index, to:destination, in:section)
    }
}
