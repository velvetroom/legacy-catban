import UIKit

class WriterController:UIViewController {
    var model:WriterProtocol
    
    init() {
        self.model = Writer()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
