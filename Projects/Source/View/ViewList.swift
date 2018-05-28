import UIKit

class ViewList:UICollectionView {
    var presenter:PresenterList
    
    init() {
        self.presenter = PresenterList()
        let flow:ViewListFlow = ViewListFlow()
        super.init(frame:CGRect.zero, collectionViewLayout:flow)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    deinit {
        print("deinit list")
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.alwaysBounceVertical = true
        self.register(ViewListCell.self, forCellWithReuseIdentifier:ViewConstants.ListItem.identifier)
        self.delegate = self.presenter
        self.dataSource = self.presenter
    }
    
    private func factoryViews() {
        
    }
}
