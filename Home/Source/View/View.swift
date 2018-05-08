import UIKit
import Shared

class View:Shared.View {
    override func loadView() {
        self.view = ViewScroll()
    }
}
