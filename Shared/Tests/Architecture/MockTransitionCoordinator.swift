import UIKit

class MockTransitionCoordinator:NSObject, UIViewControllerTransitionCoordinator {
    var isAnimated:Bool
    var presentationStyle:UIModalPresentationStyle
    var initiallyInteractive:Bool
    var isInterruptible:Bool
    var isInteractive:Bool
    var isCancelled:Bool
    var transitionDuration:TimeInterval
    var percentComplete:CGFloat
    var completionVelocity:CGFloat
    var completionCurve:UIViewAnimationCurve
    var containerView:UIView
    var targetTransform:CGAffineTransform
    
    override init() {
        self.isAnimated = false
        self.presentationStyle = UIModalPresentationStyle.currentContext
        self.initiallyInteractive = false
        self.isInterruptible = false
        self.isInteractive = false
        self.isCancelled = false
        self.transitionDuration = 0
        self.percentComplete = 0
        self.completionVelocity = 0
        self.completionCurve = UIViewAnimationCurve.easeIn
        self.containerView = UIView()
        self.targetTransform = CGAffineTransform.identity
        super.init()
    }

    func notifyWhenInteractionEnds(_ handler:@escaping(UIViewControllerTransitionCoordinatorContext) -> Void) { }
    func notifyWhenInteractionChanges(_ handler:@escaping(UIViewControllerTransitionCoordinatorContext) -> Void) { }
    
    func viewController(forKey key:UITransitionContextViewControllerKey) -> UIViewController? {
        return nil
    }
    
    func view(forKey key:UITransitionContextViewKey) -> UIView? {
        return nil
    }
    
    func animate(alongsideTransition animation:((UIViewControllerTransitionCoordinatorContext) -> Void)?, completion: ((UIViewControllerTransitionCoordinatorContext) -> Void)? = nil) -> Bool {
        return false
    }
    
    func animateAlongsideTransition(in view:UIView?, animation:((UIViewControllerTransitionCoordinatorContext) -> Void)?, completion: ((UIViewControllerTransitionCoordinatorContext) -> Void)? = nil) -> Bool {
        return false
    }
}
