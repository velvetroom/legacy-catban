import UIKit

class LandingController:UIViewController {
    var outlets:LandingOutlets
    var projectLoader:ProjectLoaderProtocol
    var viewModelLoader:LandingViewModelLoaderProtocol
    var collectionDelegate:LandingCollectionDelegateProtocol
    var project:Project?
    
    init() {
        self.outlets = LandingOutlets()
        self.projectLoader = ProjectLoader()
        self.viewModelLoader = LandingViewModelLoader()
        self.collectionDelegate = LandingCollectionDelegate()
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
        self.loadDependencies()
    }
}
