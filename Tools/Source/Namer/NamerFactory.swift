import Foundation
import Shared

public class NamerFactory {
    public class func makeNamerWith<Interactor:NamerInteractorProtocol>(
        interactor:Interactor, and viewModel:NamerViewModel) -> PresentingViewProtocol {
        let view:NamerView<Interactor> = NamerView<Interactor>()
        view.presenter.viewModel = viewModel
        return view
    }
    
    private init() { }
}
