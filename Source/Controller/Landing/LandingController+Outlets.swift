import UIKit

extension LandingController {
    func factoryOutlets() {
        self.factoryViewCollection()
        self.factoryViewCollectionMenu()
        self.factoryPresenterDelegates()
        self.factoryGesture()
        self.factoryImageLogo()
    }
    
    private func factoryViewCollection() {
        let layout:LandingViewCollectionLayout = LandingViewCollectionLayout()
        
        let viewCollection:LandingViewCollection = LandingViewCollection(layout:layout)
        viewCollection.delegate = self.presenterCollection.delegate
        viewCollection.dataSource = self.presenterCollection.dataSource
        
        self.view.addSubview(viewCollection)
        self.outlets.viewCollection = viewCollection
        self.outlets.layoutCollection = layout
        self.constraintToSafeArea(view:viewCollection)
    }
    
    private func factoryViewCollectionMenu() {
        let viewCollectionMenu:LandingViewCollectionMenu = LandingViewCollectionMenu()
        
        self.view.addSubview(viewCollectionMenu)
        self.outlets.viewCollectionMenu = viewCollectionMenu
        
        self.outlets.layoutCollectionMenuBottom = viewCollectionMenu.bottomAnchor.constraint(
            equalTo:self.view.bottomAnchor, constant:Constants.collectionMenuHeight)
        viewCollectionMenu.heightAnchor.constraint(equalToConstant:Constants.collectionMenuHeight).isActive = true
        viewCollectionMenu.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        viewCollectionMenu.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        self.outlets.layoutCollectionMenuBottom.isActive = true
    }
    
    private func factoryPresenterDelegates() {
        self.presenterCollection.dataSource.delegate = self
        self.presenterCollection.delegate.delegate = self
    }
    
    private func factoryGesture() {
        let gestureCollection:UILongPressGestureRecognizer = UILongPressGestureRecognizer()
        gestureCollection.delegate = self.presenterCollection.gesture
        gestureCollection.addTarget(
            self.presenterCollection.gesture,
            action:#selector(LandingPresenterCollectionGesture.selectorGestureReceived(sender:)))
        
        self.outlets.viewCollection.addGestureRecognizer(gestureCollection)
        self.outlets.gestureCollection = gestureCollection
    }
    
    private func factoryImageLogo() {
        let imageLogo:UIImageView = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.clipsToBounds = true
        imageLogo.isUserInteractionEnabled = false
        imageLogo.contentMode = UIViewContentMode.center
        imageLogo.image = #imageLiteral(resourceName: "assetLogo")
        
        self.view.addSubview(imageLogo)
        self.outlets.imageLogo = imageLogo
        self.constraintToSafeArea(view:imageLogo)
    }
    
    private func constraintToSafeArea(view:UIView) {
        view.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
