import UIKit

class View:UIViewController, ViewProtocol {
    var delegate:ViewDelegateProtocol?
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
