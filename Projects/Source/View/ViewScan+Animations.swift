import UIKit

extension ViewScan {
    func animateToLoad() {
        UIView.animate(withDuration:ViewConstants.Scan.animationDuration) { [weak self] in
            self?.content.viewLoading.alpha = 1
            self?.content.viewBar.tintColor = UIColor.black
        }
    }
}
