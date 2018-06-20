import UIKit
import Shared

class ViewMenu:Shared.View<Interactor, PresenterMenu, ViewMenuContent> {
    override func didLoad() {
        super.didLoad()
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.hookSelectors()
    }
    
    @objc func selectorClose(button:UIButton) {
        self.content.animateClose()
        self.presenter.close()
    }
    
    @objc func selectorProjects(button:UIButton) {
        self.presenter.openProjects()
    }
    
    @objc func selectorAbout(button:UIButton) {
        self.presenter.openAbout()
    }
    
    override func didAppear() {
        super.didAppear()
        self.content.animateOpen()
    }
    
    override func orientationChanged(size:CGSize) {
        super.orientationChanged(size:size)
        self.view.frame = CGRect(origin:CGPoint.zero, size:size)
    }
    
    private func hookSelectors() {
        self.content.viewClose.addTarget(self, action:#selector(self.selectorClose(button:)),
                                         for:UIControlEvents.touchUpInside)
        self.content.viewOptions.closeButton.addTarget(self, action:#selector(self.selectorClose(button:)),
                                                       for:UIControlEvents.touchUpInside)
        self.content.viewOptions.optionProjects.addTarget(self, action:#selector(self.selectorProjects(button:)),
                                                          for:UIControlEvents.touchUpInside)
//        self.viewBase.viewOptions.optionAbout.addTarget(self, action:#selector(self.selectorAbout(button:)),
//                                                        for:UIControlEvents.touchUpInside)
    }
}
