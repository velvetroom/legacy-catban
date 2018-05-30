import UIKit

class ViewList:UICollectionView {
    weak var layoutSelectorY:NSLayoutConstraint!
    
    init() {
        let flow:ViewListFlow = ViewListFlow()
        super.init(frame:CGRect.zero, collectionViewLayout:flow)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func layoutSubviews() {
        self.didLayoutSubviews()
        super.layoutSubviews()
    }
    
    func didLayoutSubviews() {
        self.collectionViewLayout.invalidateLayout()
        self.delegate?.scrollViewDidScroll?(self)
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.alwaysBounceVertical = true
        self.register(ViewListCell.self, forCellWithReuseIdentifier:ViewConstants.ListItem.identifier)
    }
}
