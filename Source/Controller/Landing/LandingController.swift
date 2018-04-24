import UIKit

class LandingController<ModelType:LandingProtocol>:Controller<ModelType> {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
        self.factoryOutlets()
        self.model.reloadViewModel()
    }
    
    @objc func selectorAdd(sender button:UIBarButtonItem) {
        let controller:LandingAddController = LandingAddController()
        controller.model.delegate = self
        self.model.clearCardSelection()
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    @objc func selectorOrganise(sender button:UIBarButtonItem) {
        self.navigation?.transitionToOrganiseWith(board:self.model.board)
    }
    
    @objc func selectorStats(sender button:UIBarButtonItem) {
        self.navigation?.transitionToStatsWith(board:self.model.board)
    }
    
    @objc func selectorEditProject(sender button:UIBarButtonItem) {
        self.editProject()
    }
    
    @objc func selectorCloseEditingCard(sender button:UIButton) {
        self.model.clearCardSelection()
    }
    
    @objc func selectorMoveEditingCardRight(sender button:UIButton) {
        self.model.moveEditingCardRight()
    }
    
    @objc func selectorMoveEditingCardLeft(sender button:UIButton) {
        self.model.moveEditingCardLeft()
    }
    
    @objc func selectorEditCard(sender button:UIButton) {
        guard
            let indexPath:IndexPath = self.model.editingCard
        else { return }
        self.openWriterForCardAt(indexPath:indexPath)
    }
}
