import UIKit
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
        self.makeButtons()
        self.configureViewModel()
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
    
    @objc func selectorShare() {
        guard
            let image:UIImage = self.content.viewImage.image
        else { return }
        let activity:UIActivityViewController = UIActivityViewController(activityItems:[image],
                                                                         applicationActivities:nil)
        if let popover:UIPopoverPresentationController = activity.popoverPresentationController {
            popover.sourceView = self.content
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.any
        }
        self.present(activity, animated:true, completion:nil)
    }
    
    private func hookSelectors() {
        self.content.buttonClose.addTarget(self, action:#selector(self.selectorClose(button:)),
                                           for:UIControlEvents.touchUpInside)
    }
    
    private func makeButtons() {
        let buttonClose:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.stop, target:self,
                                                          action:#selector(self.selectorClose(button:)))
        let space:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace,
                                                    target:nil, action:nil)
        let buttonShare:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.action, target:self,
                                                          action:#selector(self.selectorShare))
        self.content.viewBar.setItems([buttonClose, space, buttonShare], animated:false)
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelQr = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelQr) in
            if let image:UIImage = property.image {
                self?.animate(image:image)
            }
        }
        self.viewModel.update(property:viewModel)
    }
    
    private func animateOpen() {
        UIView.animate(withDuration:Constants.ShareBackground.animationDuration, animations: { [weak self] in
            self?.content.viewBackground.alpha = Constants.ShareBackground.alphaOpen
        }) { [weak self] (done:Bool) in
            self?.content.viewBase.layoutTop.constant = -Constants.ShareBase.height
            UIView.animate(withDuration:Constants.ShareBase.animationDuration) { [weak self] in
                self?.content.layoutIfNeeded()
            }
        }
    }
    
    private func animateClose() {
        self.content.viewBase.layoutTop.constant = 0
        UIView.animate(withDuration:Constants.ShareBase.animationDuration, animations: { [weak self] in
            self?.content.layoutIfNeeded()
        }) { [weak self] (done:Bool) in
            UIView.animate(withDuration:Constants.ShareBackground.animationDuration, animations: { [weak self] in
                self?.content.viewBackground.alpha = Constants.ShareBackground.alphaClose
            }) { [weak self] (done:Bool) in
                self?.transition?.dismiss()
            }
        }
    }
    
    private func animate(image:UIImage) {
        self.content.viewImage.alpha = Constants.ShareImage.alphaOff
        self.content.viewImage.image = image
        UIView.animate(withDuration:Constants.ShareImage.animationDuration) { [weak self] in
            self?.content.viewImage.alpha = Constants.ShareImage.alphaOn
        }
    }
}
