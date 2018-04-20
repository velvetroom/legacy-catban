import UIKit

class LandingPresenterCollectionGesture:NSObject, UIGestureRecognizerDelegate {
    var movingCellDelta:CGPoint?
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
        else { return }
        self.addMovingCellDelta(gestureLocation:location, cellLocation:cell.center)
        collection.beginInteractiveMovementForItem(at:indexPath)
    }
    
    private func gestureStateChanged(gesture:UILongPressGestureRecognizer) {
        let location:CGPoint = gesture.location(in:gesture.view)
        guard
            let collection:UICollectionView = gesture.view as? UICollectionView,
            let updatedLocation:CGPoint = self.updatedMovingCellLocation(gestureLocation:location)
        else { return }
        collection.updateInteractiveMovementTargetPosition(updatedLocation)
    }
    
    private func gestureStateEnded(gesture:UILongPressGestureRecognizer) {
        self.movingCellDelta = nil
        guard
            let collection:UICollectionView = gesture.view as? UICollectionView
        else { return }
        collection.endInteractiveMovement()
    }
    
    private func gestureStateCancelled(gesture:UILongPressGestureRecognizer) {
        self.movingCellDelta = nil
        guard
            let collection:UICollectionView = gesture.view as? UICollectionView
        else { return }
        collection.cancelInteractiveMovement()
    }
    
    private func shouldDrag(gesture:UIGestureRecognizer) -> Bool {
        let location:CGPoint = gesture.location(in:gesture.view)
        guard
            let collection:UICollectionView = gesture.view as? UICollectionView,
            let _:IndexPath = collection.indexPathForItem(at:location)
        else { return false }
        return true
    }
    
    private func addMovingCellDelta(gestureLocation:CGPoint, cellLocation:CGPoint) {
        let deltaX:CGFloat = cellLocation.x - gestureLocation.x
        let deltaY:CGFloat = cellLocation.y - gestureLocation.y
        self.movingCellDelta = CGPoint(x:deltaX, y:deltaY)
    }
    
    func updatedMovingCellLocation(gestureLocation:CGPoint) -> CGPoint? {
        guard
            let movingCellDelta:CGPoint = self.movingCellDelta
        else { return nil }
        let locationX:CGFloat = gestureLocation.x + movingCellDelta.x
        let locationY:CGFloat = gestureLocation.y + movingCellDelta.y
        return CGPoint(x:locationX, y:locationY)
    }
}
