import UIKit

class LandingViewCollectionCell:UICollectionViewCell {
    weak var labelTitle:UILabel!
    weak var buttonDelete:UIButton!
    weak var delegate:LandingPresenterCollectionDataSourceProtocol?
    var indexPath:IndexPath
    
    override init(frame:CGRect) {
        self.indexPath = IndexPath(item:0, section:0)
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
