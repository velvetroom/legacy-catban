import UIKit

extension LandingPresenterCollection {
    /*private var gestureRouters:[UIGestureRecognizerState:((UILongPressGestureRecognizer) -> ())]
    {
        get
        {
            let map:[UIGestureRecognizerState:((UILongPressGestureRecognizer) -> ())] = [
                UIGestureRecognizerState.began : self.gestureStateBegan,
                UIGestureRecognizerState.possible : self.gestureStateBegan,
                UIGestureRecognizerState.changed : self.gestureStateChanged,
                UIGestureRecognizerState.ended : self.gestureStateEnded,
                UIGestureRecognizerState.cancelled : self.gestureStateCancelled,
                UIGestureRecognizerState.failed : self.gestureStateCancelled]
            
            return map
        }
    }
    
    //MARK: private
    
    private func gestureStateBegan(gesture:UILongPressGestureRecognizer)
    {
        let location:CGPoint = gesture.location(in:self.viewMain.viewList.collectionView)
        
        guard
            
            let indexPath:IndexPath = self.viewMain.viewList.collectionView.indexPathForItem(at:location),
            let cell:UICollectionViewCell = self.viewMain.viewList.collectionView.cellForItem(at:indexPath)
            
            else
        {
            return
        }
        
        self.model.saveMovingCellDelta(
            gestureLocation:location,
            cellLocation:cell.center)
        
        self.viewMain.viewList.collectionView.beginInteractiveMovementForItem(at:indexPath)
    }
    
    private func gestureStateChanged(gesture:UILongPressGestureRecognizer)
    {
        guard
            
            self.isDraggableLocation(gesture:gesture) == true
            
            else
        {
            return
        }
        
        let gestureLocation:CGPoint = gesture.location(in:self.viewMain.viewList.collectionView)
        
        guard
            
            let updatedLocation:CGPoint = self.model.updatedCellLocation(gestureLocation:gestureLocation)
            
            else
        {
            return
        }
        
        self.viewMain.viewList.collectionView.updateInteractiveMovementTargetPosition(updatedLocation)
    }
    
    private func gestureStateEnded(gesture:UILongPressGestureRecognizer)
    {
        self.model.movingCellDelta = nil
        self.viewMain.viewList.collectionView.endInteractiveMovement()
    }
    
    private func gestureStateCancelled(gesture:UILongPressGestureRecognizer)
    {
        self.model.movingCellDelta = nil
        self.viewMain.viewList.collectionView.cancelInteractiveMovement()
    }
    
    //MARK: internal
    
    func gestureReceived(gesture:UILongPressGestureRecognizer)
    {
        guard
            
            let router:((UILongPressGestureRecognizer) -> ()) = self.gestureRouters[gesture.state]
            
            else
        {
            return
        }
        
        router(gesture)
    }*/
    
    @objc func selectorGestureReceived(sender gesture:UILongPressGestureRecognizer) {
        print("received")
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer:UIGestureRecognizer) -> Bool {
        return self.shouldDrag(gesture:gestureRecognizer)
    }
    
    private func shouldDrag(gesture:UIGestureRecognizer) -> Bool {
        let location:CGPoint = gesture.location(in:gesture.view)
        guard
            let collection:UICollectionView = gesture.view as? UICollectionView,
            let _:IndexPath = collection.indexPathForItem(at:location)
        else {
            return false
        }
        return true
    }
}
