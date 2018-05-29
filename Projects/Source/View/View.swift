import UIKit
import Shared

class View:Shared.View {
    weak var presenter:Presenter!
    weak var viewBase:ViewBase!
    
    override func didLoad() {
        super.didLoad()
        self.hookSelectors()
        self.configureNavigationItem()
    }
    
    override func loadView() {
        self.view = self.configureView()
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated:true)
    }
    
    @objc func selectorOpen(button:ViewMenuItem) {
        self.presenter.openProject()
    }
    
    private func configureNavigationItem() {
        self.navigationController?.setNavigationBarHidden(true, animated:true)
    }
    
    private func configureView() -> ViewBase {
        let viewBase:ViewBase = ViewBase()
        self.viewBase = viewBase
        return viewBase
    }
    
    private func hookSelectors() {
        self.viewBase.viewMenu.buttonOpen.addTarget(
            self, action:#selector(self.selectorOpen(button:)), for: UIControlEvents.touchUpInside)
    }
}
