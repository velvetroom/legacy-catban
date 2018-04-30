import UIKit

extension StatsController {
    private var outlets:StatsPresenterOutlets {
        get {
            return self.model.presenter.outlets
        }
        set(newValue) {
            self.model.presenter.outlets = newValue
        }
    }
    
    func factoryOutlets() {
        self.factoryCollection()
        self.factoryPageControl()
    }
    
    private func factoryCollection() {
        let viewCollection:StatsViewCollection = StatsViewCollection()
        viewCollection.delegate = self.model.presenter.collection.delegate
        viewCollection.dataSource = self.model.presenter.collection.datasource
        self.outlets.collection = viewCollection
        
        self.view.addSubview(viewCollection)
        
        viewCollection.topAnchor.constraint(equalTo:self.safeArea.topAnchor).isActive = true
        viewCollection.bottomAnchor.constraint(equalTo:self.safeArea.bottomAnchor).isActive = true
        viewCollection.leftAnchor.constraint(equalTo:self.safeArea.leftAnchor).isActive = true
        viewCollection.rightAnchor.constraint(equalTo:self.safeArea.rightAnchor).isActive = true
    }
    
    private func factoryPageControl() {
        let pageControl:StatsViewPageControl = StatsViewPageControl()
        self.outlets.pageControl = pageControl
        
        self.view.addSubview(pageControl)
        
        pageControl.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        pageControl.bottomAnchor.constraint(equalTo:self.safeArea.bottomAnchor, constant:StatsViewModel.Constants.pageControlBottom).isActive = true
        pageControl.leftAnchor.constraint(equalTo:self.safeArea.leftAnchor).isActive = true
        pageControl.rightAnchor.constraint(equalTo:self.safeArea.rightAnchor).isActive = true
    }
}
