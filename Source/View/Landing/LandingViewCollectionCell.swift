import UIKit

class LandingViewCollectionCell:UICollectionViewCell {
    weak var labelTitle:UILabel!
    weak var buttonDelete:UIButton!
    weak var delegate:LandingPresenterCollectionDataSourceProtocol?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.configureView()
        self.addOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    @objc func selectorDelete(sender button:UIButton) {
        self.delegate?.deleteSelectedItem()
    }
    
    private func configureView() {
        self.clipsToBounds = false
        self.contentView.clipsToBounds = true
        self.layer.cornerRadius = Constants.cornerRadius
    }
}
