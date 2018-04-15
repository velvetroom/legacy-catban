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
        self.factoryViewCollectionMenu()
        self.factoryViewCollection()
        self.factoryPresenterDelegates()
        self.factoryGesture()
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
        
        self.view.insertSubview(viewCollection, belowSubview:self.outletsList.viewCollectionMenu!)
        self.outletsList.viewCollection = viewCollection
        self.outletsList.layoutCollection = layout
        
        viewCollection.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewCollection.bottomAnchor.constraint(
            equalTo:self.outletsList.viewCollectionMenu!.topAnchor).isActive = true
        viewCollection.leftAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewCollection.rightAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    private func factoryViewCollectionMenu() {
        let viewCollectionMenu:LandingViewCollectionMenu = LandingViewCollectionMenu()
        viewCollectionMenu.buttonClose.addTarget(self, action:#selector(self.selectorCloseEditingCard(sender:)),
                                                 for:UIControlEvents.touchUpInside)
        viewCollectionMenu.buttonMoveRight.addTarget(self, action:#selector(
            self.selectorMoveEditingCardRight(sender:)), for:UIControlEvents.touchUpInside)
        viewCollectionMenu.buttonMoveLeft.addTarget(self, action:#selector(
            self.selectorMoveEditingCardLeft(sender:)), for:UIControlEvents.touchUpInside)
        viewCollectionMenu.buttonEdit.addTarget(self, action:#selector(self.selectorEditCard(sender:)),
                                                for:UIControlEvents.touchUpInside)
        
        self.view.addSubview(viewCollectionMenu)
        self.outletsList.viewCollectionMenu = viewCollectionMenu
        
        self.outletsList.layoutCollectionMenuBottom = viewCollectionMenu.bottomAnchor.constraint(
            equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant:Constants.collectionMenuHeight)
        viewCollectionMenu.heightAnchor.constraint(equalToConstant:Constants.collectionMenuHeight).isActive = true
        viewCollectionMenu.leftAnchor.constraint(
            equalTo:self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewCollectionMenu.rightAnchor.constraint(
            equalTo:self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.outletsList.layoutCollectionMenuBottom?.isActive = true
        self.outletsList.buttonCollectionMenuMoveRight = viewCollectionMenu.buttonMoveRight
        self.outletsList.buttonCollectionMenuMoveLeft = viewCollectionMenu.buttonMoveLeft
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
}
