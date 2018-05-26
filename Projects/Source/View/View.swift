import Foundation
import Shared

class View:Shared.View {
    weak var presenter:Presenter!
    
    override func didLoad() {
        super.didLoad()
        self.configureNavigationItem()
    }
    
    override func loadView() {
        self.view = self.configureView()
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated:true)
    }
    
    private func configureNavigationItem() {
        self.navigationController?.setNavigationBarHidden(true, animated:true)
    }
    
    private func configureView() -> ViewBase {
        let viewBase:ViewBase = ViewBase()
        
        return viewBase
    }
}
