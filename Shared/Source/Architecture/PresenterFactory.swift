import Foundation

class PresenterFactory {
    class func makePresenter<Interactor, Presenter:PresenterProtocol, ViewModel>() -> Presenter
        where Interactor == Presenter.Interactor, ViewModel == Presenter.ViewModel {
            var interactor:Interactor = Interactor()
            var presenter:Presenter = Presenter()
            let viewModel:ViewModel = ViewModel()
            presenter.interactor = interactor
            presenter.viewModel = viewModel
            interactor.presenter = presenter
            return presenter
    }
    
    private init() { }
}
