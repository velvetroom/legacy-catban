import UIKit
import Shared

class View:Shared.View {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = ViewScroll()
    }
}
