import UIKit

class PresenterRenamer {
    weak var view:ViewRenamer!
    var item:ViewModelListItem
    
    init() {
        self.item = ViewModelListItem()
    }
    
    func show() {
        self.view.isUserInteractionEnabled = true
        self.animateView(alpha:ViewConstants.Renamer.alphaOn)
        self.view.viewInput.viewField.text = self.item.name
        self.view.viewInput.viewField.becomeFirstResponder()
    }
    
    func hide() {
        self.view.isUserInteractionEnabled = false
        self.animateView(alpha:ViewConstants.Renamer.alphaOff)
    }
    
    private func animateView(alpha:CGFloat) {
        UIView.animate(withDuration:ViewConstants.Renamer.animateDuration) { [weak self] in
            self?.view.alpha = alpha
        }
    }
}
