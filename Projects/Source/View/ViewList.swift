import UIKit

class ViewList:UICollectionView {
    init() {
        let flow:ViewListFlow = ViewListFlow()
        super.init(frame:CGRect.zero, collectionViewLayout:flow)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
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
    
    private func factoryViews() {
        
    }
}
