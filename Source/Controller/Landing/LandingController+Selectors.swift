import UIKit

extension LandingController {
    @objc func selectorAdd(sender button:UIButton) {
        let controller:LandingControllerAdd = LandingControllerAdd()
        controller.model = self.model
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    @objc func selectorEdit(sender button:UIButton) {
        
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
            let editingCard:ProjectCard = self.model.editingCardReference
        else {
            return
        }
        self.openWriterFor(card:editingCard)
    }
}
