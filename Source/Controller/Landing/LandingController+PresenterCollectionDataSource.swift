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
        self.model.clearCardSelection()
        let controller:LandingColumnEditController = LandingColumnEditController()
        controller.model.onRename = { [weak self] in
            self?.openWriterForColumnAt(index:index)
        }
        controller.model.onDelete = { [weak self] in
            self?.deleteSectionAt(index:index)
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func deleteSectionAt(index:Int) {
        let controller:LandingDeleteController = LandingDeleteController()
        controller.model.itemName = String.localizedLanding(key:"LandingController_deleteSectionAtName")
        controller.model.onConfirm = { [weak self] in
            
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
}
