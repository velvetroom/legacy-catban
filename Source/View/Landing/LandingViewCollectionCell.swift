import UIKit

class LandingViewCollectionCell:UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.configureView()
        self.addOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
    }
    
    private func addOutlets() {
        
    }
}
