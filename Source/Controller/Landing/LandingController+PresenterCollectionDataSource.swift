import Foundation

extension LandingController:LandingPresenterCollectionDataSourceProtocol {
    func moveItemFrom(origin:IndexPath, to destination:IndexPath) {
        self.model.moveCardFrom(origin:origin, to:destination)
    }
    
    func deleteItemAt(indexPath:IndexPath) {
        let controller:LandingDeleteController = LandingDeleteController()
        controller.model.itemName = String.localizedLanding(key:"LandingController_deleteItemAtName")
        controller.model.onConfirm = { [weak self] in
                self?.model.deleteCardAt(indexPath:indexPath)
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func editHeaderAt(index:Int) {
        
    }
}
