import UIKit

extension LandingController {
    @objc func selectorAdd(sender button:UIButton) {
        let controller:LandingAddController = LandingAddController()
        controller.model = self.model
        self.model.clearCardSelection()
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
        self.openWriterForEditingCard()
    }
}
