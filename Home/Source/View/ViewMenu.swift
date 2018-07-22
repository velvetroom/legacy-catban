import UIKit
import Architecture

class ViewMenu:Architecture.View<PresenterMenu, ViewMenuContent> {
    override func initProperties() {
        super.initProperties()
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
    
    override func didLoad() {
        super.didLoad()
        self.hookSelectors()
    }
    
    @objc func selectorClose() {
        self.content.animateClose()
        self.presenter.close()
    }
    
    @objc func selectorCloud() {
        self.content.animateClose()
        self.presenter.openCloud()
    }
    
    @objc func selectorProjects() {
        self.content.animateClose()
        self.presenter.openProjects()
    }
    
    @objc func selectorAbout() {
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
        self.content.viewClose.addTarget(self, action:#selector(self.selectorClose),
                                         for:UIControlEvents.touchUpInside)
        self.content.viewOptions.closeButton.addTarget(self, action:#selector(self.selectorClose),
                                                       for:UIControlEvents.touchUpInside)
        self.content.viewOptions.optionCloud.addTarget(self, action:#selector(self.selectorCloud),
                                                       for:UIControlEvents.touchUpInside)
        self.content.viewOptions.optionProjects.addTarget(self, action:#selector(self.selectorProjects),
                                                          for:UIControlEvents.touchUpInside)
        
//        self.viewBase.viewOptions.optionAbout.addTarget(self, action:#selector(self.selectorAbout(button:)),
//                                                        for:UIControlEvents.touchUpInside)
    }
}
