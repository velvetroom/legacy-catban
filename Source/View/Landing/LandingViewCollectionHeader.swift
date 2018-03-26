import UIKit

class LandingViewCollectionHeader:UICollectionReusableView {
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor(white:0.9, alpha:1)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
