import UIKit

class StatsViewCollectionCell:UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
    }
}
