import UIKit
import Architecture
import Shared

class ViewScan:Architecture.View<PresenterScan, ViewScanContent> {
    override func initProperties() {
        super.initProperties()
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
    
    override func didLoad() {
        super.didLoad()
        self.makeBarActions()
    }
    
    override func didAppear() {
        super.didAppear()
        self.animateOpen()
    }
    
    override func orientationChanged(size:CGSize) {
        super.orientationChanged(size:size)
        self.view.frame = CGRect(origin:CGPoint.zero, size:size)
        self.animateOpen()
    }
    
    @objc func selectorClose() {
        self.animateClose()
    }
    
    private func animateOpen() {
        self.content.viewBase.layoutTop.constant = -self.content.bounds.height
        UIView.animate(withDuration:ViewConstants.Scan.animationDuration) { [weak self] in
            self?.content.layoutIfNeeded()
        }
    }
    
    private func animateClose() {
        self.content.viewBase.layoutTop.constant = 0
        UIView.animate(withDuration:ViewConstants.Scan.animationDuration, animations: { [weak self] in
            self?.content.layoutIfNeeded()
        }) { (done:Bool) in
            self.presenter.close()
        }
    }
}
