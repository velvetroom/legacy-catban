import UIKit

extension OrganiseController {
    func factoryOutlets() {
        self.configureView()
        self.factoryCollection()
        self.configurePresenter()
    }
    
    private func configureView() {
        self.view.backgroundColor = UIColor.Shared.gray
    }
    
    private func configurePresenter() {
        self.model.presenter.collection.delegate.delegate = self
    }
    
    private func factoryCollection() {
        let collection:OrganiseViewCollection = OrganiseViewCollection()
        collection.delegate = self.model.presenter.collection.delegate
        collection.dataSource = self.model.presenter.collection.datasource
        self.model.presenter.outlets.collection = collection
        
        self.view.addSubview(collection)
        
        collection.topAnchor.constraint(equalTo:self.safeArea.topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo:self.safeArea.bottomAnchor).isActive = true
        collection.leftAnchor.constraint(equalTo:self.safeArea.leftAnchor).isActive = true
        collection.rightAnchor.constraint(equalTo:self.safeArea.rightAnchor).isActive = true
    }
}
