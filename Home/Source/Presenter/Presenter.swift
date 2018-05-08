import UIKit
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Home.View.self
    var outlets:PresenterOutlets
    weak var delegate:PresenterDelegateProtocol?
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func didLoad(view:UIView) {
        self.loadOutlets(view:view)
        self.delegate?.didLoadPresenter()
    }
    
    private func loadOutlets(view:UIView) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.loadFor(view:view)
        self.outlets = loader.outlets
    }
}
