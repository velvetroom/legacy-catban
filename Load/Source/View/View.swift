import UIKit
import Shared

class View:Shared.View {
    override init() {
        super.init()
        self.view.backgroundColor = UIColor.blue
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
