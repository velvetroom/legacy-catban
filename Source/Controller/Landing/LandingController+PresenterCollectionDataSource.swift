import Foundation

extension LandingController:LandingPresenterCollectionDataSourceProtocol {
    func reorderItemFrom(index:Int, to destination:Int, in section:Int) {
        self.project?.move(cardIndex:index, to:destination, in:section)
        self.reloadViewModel()
    }
}
