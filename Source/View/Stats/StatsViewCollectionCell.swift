import UIKit

class StatsViewCollectionCell:UICollectionViewCell {
    weak var view:StatsView?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func updateWith(view:StatsView) {
        self.view?.removeFromSuperview()
        self.view = view
        self.addSubview(view)
        self.equalConstraintsFor(view:view)
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
    }
    
    private func equalConstraintsFor(view:UIView) {
        view.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
