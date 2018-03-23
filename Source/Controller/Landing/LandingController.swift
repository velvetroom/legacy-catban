import UIKit

class LandingController:UIViewController {
    var outlets:LandingControllerOutlets
    var projectLoader:ProjectLoaderProtocol
    private(set) var project:Project?
    
    init() {
        self.outlets = LandingControllerOutlets()
        self.projectLoader = ProjectLoader()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.adjustNavigationItem()
        self.factoryOutlets()
        self.loadProject { [weak self] (project:Project) in
            self?.project = project
        }
    }
}
