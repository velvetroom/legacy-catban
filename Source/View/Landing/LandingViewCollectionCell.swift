import UIKit

class LandingViewCollectionCell:UICollectionViewCell {
    weak var labelTitle:UILabel!
    weak var buttonDelete:UIButton!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.configureView()
        self.addOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = false
        self.contentView.clipsToBounds = true
        self.layer.cornerRadius = Constants.cornerRadius
    }
}
