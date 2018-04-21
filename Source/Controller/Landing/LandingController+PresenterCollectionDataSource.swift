import Foundation

extension LandingController:LandingPresenterCollectionDataSourceProtocol {
    func columnAt(index:Int) -> ProjectColumn {
        return self.model.columnAt(index:index)
    }
    
    func moveItemFrom(origin:IndexPath, to destination:IndexPath) {
        self.model.moveCardFrom(origin:origin, to:destination)
    }
    
    func deleteSelectedItem() {
        let controller:LandingDeleteController = LandingDeleteController()
        controller.model.itemName = String.localizedLanding(key:"LandingController_deleteItemAtName")
        controller.model.onConfirm = { [weak self] in
            self?.model.deleteEditingCard()
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func edit(column:ProjectColumn) {
        self.model.clearCardSelection()
        let index:Int = self.model.indexFor(column:column)
        let controller:LandingEditController = LandingEditController()
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
            self?.confirmedDeleteSectionAt(index:index)
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func confirmedDeleteSectionAt(index:Int) {
        do {
            try self.model.deleteColumnAndMoveCardsAt(index:index)
        } catch let error {
            self.alertError(error:error)
        }
    }
}
