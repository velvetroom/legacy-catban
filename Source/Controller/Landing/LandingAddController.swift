import UIKit

class LandingAddController:UIAlertController {
    var model:LandingAddProtocol
    
    init() {
        self.model = LandingAdd()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override var preferredStyle:UIAlertControllerStyle {
        get {
            return UIAlertControllerStyle.actionSheet
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.factoryActions()
        self.prepareForIpad()
    }
    
    private func prepareForIpad() {
        if let popover:UIPopoverPresentationController = self.popoverPresentationController {
            popover.sourceView = self.view
            popover.permittedArrowDirections = UIPopoverArrowDirection.right
            popover.sourceRect = CGRect(
                x:self.view.bounds.maxX - Constants.ipadMarginLeft,
                y:Constants.ipadMarginTop,
                width:1,
                height:1)
        }
    }
}
