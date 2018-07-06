import UIKit
import Architecture
import Shared

class ViewScan:Architecture.View<PresenterScan, ViewScanContent> {
    override func didLoad() {
        super.didLoad()
        self.makeBarActions()
    }
    
    @objc func selectorClose() {
        self.presenter.close()
    }
}
