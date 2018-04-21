import Foundation

extension LandingController {
    func editProject() {
        self.model.clearCardSelection()
        let controller:LandingEditController = LandingEditController()
        controller.model.itemName = String.localizedLanding(key:"LandingController_editProjectName")
        controller.model.onRename = { [weak self] in
            self?.openWriterForProject()
        }
        controller.model.onDelete = { [weak self] in
            self?.deleteProject()
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func confirmedDeleteProject() {
        do {
//            try self.model.deleteColumnAndMoveCardsAt(index:index)
        } catch let error {
//            self.alertError(error:error)
        }
    }
    
    private func deleteProject() {
        let controller:LandingDeleteController = LandingDeleteController()
        controller.model.itemName = String.localizedLanding(key:"LandingController_deleteProjectName")
        controller.model.onConfirm = { [weak self] in
            self?.confirmedDeleteProject()
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
}
