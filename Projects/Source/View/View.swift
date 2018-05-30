import UIKit
import Shared

class View:Shared.View {
    weak var presenter:Presenter!
    weak var viewBase:ViewBase!
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated:true)
    }
    
    override func didLoad() {
        super.didLoad()
        self.hookSelectors()
        self.configureNavigationItem()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [weak self] in
            self?.viewBase.viewList.updateIndicator()
        }
    }
    
    override func loadView() {
        self.view = self.configureView()
    }
    
    override func viewWillTransition(to size:CGSize, with coordinator:UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to:size, with:coordinator)
        self.viewBase.viewList.updateLayout()
    }
    
    @objc func selectorOpen(button:ViewMenuItem) {
        self.showNavigationBar()
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
