import Foundation

extension LandingController:LandingPresenterCollectionDataSourceProtocol {
    func moveItemFrom(origin:IndexPath, to destination:IndexPath) {
        self.model.moveCardFrom(origin:origin, to:destination)
    }
}
