import Foundation
import Shared

class ViewNamer:Shared.View {
    weak var viewBase:ViewNamerBase!
    
    override func loadView() {
        self.view = self.configureView()
    }
    
    override func didLoad() {
        super.didLoad()
        self.configureNavigationItem()
    }
    
    private func configureView() -> ViewNamerBase {
        let viewBase:ViewNamerBase = ViewNamerBase()
        self.viewBase = viewBase
        return viewBase
    }
    
    private func configureNavigationItem() {
        self.navigationbarHidden = false
        self.title = String.localized(key:"ViewNamer_title", in:type(of:self))
    }
}
