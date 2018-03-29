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
        viewCollection.delegate = self.presenter.collection.delegate
        viewCollection.dataSource = self.presenter.collection.dataSource
        
        self.view.addSubview(viewCollection)
        self.presenter.outlets.list.viewCollection = viewCollection
        self.presenter.outlets.list.layoutCollection = layout
        self.constraintToSafeArea(view:viewCollection)
    }
    
    private func factoryViewCollectionMenu() {
        let viewCollectionMenu:LandingViewCollectionMenu = LandingViewCollectionMenu()
        
        self.view.addSubview(viewCollectionMenu)
        self.presenter.outlets.list.viewCollectionMenu = viewCollectionMenu
        
        self.presenter.outlets.list.layoutCollectionMenuBottom = viewCollectionMenu.bottomAnchor.constraint(
            equalTo:self.view.bottomAnchor, constant:Constants.collectionMenuHeight)
        viewCollectionMenu.heightAnchor.constraint(equalToConstant:Constants.collectionMenuHeight).isActive = true
        viewCollectionMenu.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        viewCollectionMenu.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        self.presenter.outlets.list.layoutCollectionMenuBottom.isActive = true
    }
    
    private func factoryPresenterDelegates() {
        self.presenter.collection.dataSource.delegate = self
        self.presenter.collection.delegate.delegate = self
    }
    
    private func factoryGesture() {
        let gestureCollection:UILongPressGestureRecognizer = UILongPressGestureRecognizer()
        gestureCollection.delegate = self.presenter.collection.gesture
        gestureCollection.addTarget(
            self.presenter.collection.gesture,
            action:#selector(LandingPresenterCollectionGesture.selectorGestureReceived(sender:)))
        
        self.presenter.outlets.list.viewCollection.addGestureRecognizer(gestureCollection)
        self.presenter.outlets.list.gestureCollection = gestureCollection
    }
    
    private func factoryImageLogo() {
        let imageLogo:UIImageView = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.clipsToBounds = true
        imageLogo.isUserInteractionEnabled = false
        imageLogo.contentMode = UIViewContentMode.center
        imageLogo.image = #imageLiteral(resourceName: "assetLogo")
        
        self.view.addSubview(imageLogo)
        self.presenter.outlets.list.imageLogo = imageLogo
        self.constraintToSafeArea(view:imageLogo)
    }
    
    private func constraintToSafeArea(view:UIView) {
        view.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
