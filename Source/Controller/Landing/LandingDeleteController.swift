import UIKit

class LandingDeleteController:UIAlertController {
    var model:LandingDeleteProtocol
    
    init() {
        self.model = LandingDelete()
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
            popover.permittedArrowDirections = UIPopoverArrowDirection.down
            popover.sourceRect = CGRect(
                x:self.view.center.x,
                y:self.view.bounds.maxY - Constants.marginBottom,
                width:1,
                height:1)
        }
    }
}
