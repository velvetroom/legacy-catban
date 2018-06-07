import Foundation
import Shared

class ViewNamer:Shared.View {
    weak var viewBase:ViewNamerBase!
    
    override func loadView() {
        self.view = self.configureView()
    }
    
    override func didLoad() {
        super.didLoad()
        self.toolbarHidden = false
        self.navigationbarHidden = false
        self.title = "Board name"
    }
    
    private func configureView() -> ViewNamerBase {
        let viewBase:ViewNamerBase = ViewNamerBase()
        self.viewBase = viewBase
        return viewBase
    }
}
