import Foundation
import Shared

public class NamerFactory {
    public class func makeWith<Interactor:NamerInteractorProtocol>(
        interactor:Interactor, and viewModel:NamerViewModelContent) -> PresentingViewProtocol {
        let presenter:NamerPresenter<Interactor> = makePresenterWith(interactor:interactor)
        let view:NamerView<Interactor> = NamerView<Interactor>(presenter:presenter)
        presenter.viewModel.update(property:viewModel)
        return view
    }
    
    private class func makePresenterWith<Interactor:NamerInteractorProtocol>(
        interactor:Interactor) -> NamerPresenter<Interactor> {
        let presenter:NamerPresenter<Interactor> = NamerPresenter<Interactor>()
        presenter.interactor = interactor
        return presenter
    }
    
    private init() { }
}
