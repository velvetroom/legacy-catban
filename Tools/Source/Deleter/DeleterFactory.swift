import Foundation
import Shared

public class DeleterFactory {
    public class func makeWith<Interactor:DeleterInteractorProtocol>(
        interactor:Interactor, and viewModel:DeleterViewModel) -> PresentingViewProtocol {
        let presenter:DeleterPresenter<Interactor> = makePresenterWith(interactor:interactor)
        let view:DeleterView<Interactor> = DeleterView<Interactor>(presenter:presenter)
        presenter.viewModel.update(property:viewModel)
        return view
    }
    
    private class func makePresenterWith<Interactor:DeleterInteractorProtocol>(
        interactor:Interactor) -> DeleterPresenter<Interactor> {
        let presenter:DeleterPresenter<Interactor> = DeleterPresenter<Interactor>()
        presenter.interactor = interactor
        return presenter
    }
    
    private init() { }
}
