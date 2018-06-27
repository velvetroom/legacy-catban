import UIKit
import CleanArchitecture

open class View<Presenter:PresenterProtocol, Content:UIView>:CleanArchitecture.View<Presenter, Content>,
ViewNavigationProtocol {
    public var navigation:TransitionProtocol? {
        get {
            return self.transition as? TransitionProtocol
        }
        set(newValue) {
            self.transition = newValue as? Presenter.Transition
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    open override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        self.updateNavigation()
    }
    
    private func configureView() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
    
    private func updateNavigation() {
        let viewModel:ViewModelNavigation = self.viewModel.property()
        self.viewModel.update(property:viewModel)
    }
}