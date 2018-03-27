import UIKit

class LandingPresenterCollectionGesture:NSObject, UIGestureRecognizerDelegate {
    private var gestureRouters:[UIGestureRecognizerState:((UILongPressGestureRecognizer) -> Void)] {
        get {
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
    
    @objc func selectorGestureReceived(sender gesture:UILongPressGestureRecognizer) {
        self.gestureRouters[gesture.state]?(gesture)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer:UIGestureRecognizer) -> Bool {
        return self.shouldDrag(gesture:gestureRecognizer)
    }
    
    private func gestureStateBegan(gesture:UILongPressGestureRecognizer) {
        let location:CGPoint = gesture.location(in:gesture.view)
        guard
            let collection:UICollectionView = gesture.view as? UICollectionView,
            let indexPath:IndexPath = collection.indexPathForItem(at:location),
            let cell:UICollectionViewCell = collection.cellForItem(at:indexPath)
            else {
                return
        }
        //        self.model.saveMovingCellDelta(
        //            gestureLocation:location,
        //            cellLocation:cell.center)
        collection.beginInteractiveMovementForItem(at:indexPath)
    }
    
    private func gestureStateChanged(gesture:UILongPressGestureRecognizer) {
//        let location:CGPoint = gesture.location(in:collection)
//        guard
//            self.shouldDrag(gesture:gesture) == true,
//            let collection:UICollectionView = gesture.view as? UICollectionView,
//            let updatedLocation:CGPoint = self.model.updatedCellLocation(location:location)
//            else {
//                return
//        }
//        collection.updateInteractiveMovementTargetPosition(updatedLocation)
    }
    
    private func gestureStateEnded(gesture:UILongPressGestureRecognizer)
    {
//        self.model.movingCellDelta = nil
//        self.viewMain.viewList.collectionView.endInteractiveMovement()
    }
    
    private func gestureStateCancelled(gesture:UILongPressGestureRecognizer)
    {
//        self.model.movingCellDelta = nil
//        self.viewMain.viewList.collectionView.cancelInteractiveMovement()
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
