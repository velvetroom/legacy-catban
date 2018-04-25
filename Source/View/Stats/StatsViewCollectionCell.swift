import UIKit

class StatsViewCollectionCell:UICollectionViewCell {
    weak var view:UIView?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func updateWith(viewModel:StatsViewModelCollectionItemProtocol) {
        self.view?.removeFromSuperview()
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
    }
}
