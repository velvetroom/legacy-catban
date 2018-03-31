import UIKit

extension LandingController {
    private var outletsList:LandingPresenterOutletsList {
        get {
            return self.model.presenter.outlets.list
        }
        
        set(newValue) {
            self.model.presenter.outlets.list = newValue
        }
    }
    
    func factoryOutlets() {
        self.configureController()
        self.factoryViewCollection()
        self.factoryViewCollectionMenu()
        self.factoryPresenterDelegates()
        self.factoryGesture()
        self.factoryImageLogo()
    }
    
    private func configureController() {
        self.view.backgroundColor = UIColor.white
        self.outletsList.controller = self
    }
    
    private func factoryViewCollection() {
        let layout:LandingViewCollectionLayout = LandingViewCollectionLayout()
        
        let viewCollection:LandingViewCollection = LandingViewCollection(layout:layout)
        viewCollection.delegate = self.model.presenter.collection.delegate
        viewCollection.dataSource = self.model.presenter.collection.dataSource
        
        self.view.addSubview(viewCollection)
        self.outletsList.viewCollection = viewCollection
        self.outletsList.layoutCollection = layout
        self.constraintToSafeArea(view:viewCollection)
    }
    
    private func factoryViewCollectionMenu() {
        let viewCollectionMenu:LandingViewCollectionMenu = LandingViewCollectionMenu()
        viewCollectionMenu.buttonClose.addTarget(self, action:#selector(self.selectorCloseEditingCard(sender:)),
                                                 for:UIControlEvents.touchUpInside)
        
        self.view.addSubview(viewCollectionMenu)
        self.outletsList.viewCollectionMenu = viewCollectionMenu
        
        self.outletsList.layoutCollectionMenuBottom = viewCollectionMenu.bottomAnchor.constraint(
            equalTo:self.view.bottomAnchor, constant:Constants.collectionMenuHeight)
        viewCollectionMenu.heightAnchor.constraint(equalToConstant:Constants.collectionMenuHeight).isActive = true
        viewCollectionMenu.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        viewCollectionMenu.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        self.outletsList.layoutCollectionMenuBottom?.isActive = true
    }
    
    private func factoryPresenterDelegates() {
        self.model.presenter.collection.dataSource.delegate = self
        self.model.presenter.collection.delegate.delegate = self
    }
    
    private func factoryGesture() {
        let gestureCollection:UILongPressGestureRecognizer = UILongPressGestureRecognizer()
        gestureCollection.delegate = self.model.presenter.collection.gesture
        gestureCollection.addTarget(
            self.model.presenter.collection.gesture,
            action:#selector(LandingPresenterCollectionGesture.selectorGestureReceived(sender:)))
        
        self.outletsList.viewCollection?.addGestureRecognizer(gestureCollection)
        self.outletsList.gestureCollection = gestureCollection
    }
    
    private func factoryImageLogo() {
        let imageLogo:UIImageView = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.clipsToBounds = true
        imageLogo.isUserInteractionEnabled = false
        imageLogo.contentMode = UIViewContentMode.center
        imageLogo.image = #imageLiteral(resourceName: "assetLogo")
        
        self.view.addSubview(imageLogo)
        self.outletsList.imageLogo = imageLogo
        self.constraintToSafeArea(view:imageLogo)
    }
    
    private func constraintToSafeArea(view:UIView) {
        view.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
