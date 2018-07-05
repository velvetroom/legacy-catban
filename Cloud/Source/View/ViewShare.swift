import Foundation
import CleanArchitecture
import Architecture
import Shared

class ViewShare:Architecture.View<PresenterShare, ViewShareContent> {
    override func initProperties() {
        super.initProperties()
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
    
    override func didLoad() {
        super.didLoad()
        self.hookSelectors()
    }
    
    override func didAppear() {
        super.didAppear()
        self.animateOpen()
    }
    
    override func orientationChanged(size:CGSize) {
        super.orientationChanged(size:size)
        self.view.frame = CGRect(origin:CGPoint.zero, size:size)
    }
    
    @objc func selectorClose(button:UIButton) {
        self.animateClose()
    }
    
    private func hookSelectors() {
        self.content.buttonClose.addTarget(self, action:#selector(self.selectorClose(button:)),
                                           for:UIControlEvents.touchUpInside)
    }
    
    private func animateOpen() {
        UIView.animate(withDuration:ViewConstants.ShareBackground.animationDuration, animations: { [weak self] in
            self?.content.viewBackground.alpha = ViewConstants.ShareBackground.alphaOpen
        }) { [weak self] (done:Bool) in
            self?.content.viewBase.layoutTop.constant = -ViewConstants.ShareBase.height
            UIView.animate(withDuration:ViewConstants.ShareBase.animationDuration) { [weak self] in
                self?.content.layoutIfNeeded()
            }
        }
    }
    
    private func animateClose() {
        self.content.viewBase.layoutTop.constant = 0
        UIView.animate(withDuration:ViewConstants.ShareBase.animationDuration, animations: { [weak self] in
            self?.content.layoutIfNeeded()
        }) { [weak self] (done:Bool) in
            UIView.animate(withDuration:ViewConstants.ShareBackground.animationDuration, animations: { [weak self] in
                self?.content.viewBackground.alpha = ViewConstants.ShareBackground.alphaClose
            }) { [weak self] (done:Bool) in
                self?.transition?.dismiss()
            }
        }
    }
}
