import Foundation

class PresenterFactory {
    class func makePresenter<Interactor, Presenter:PresenterProtocol>() -> Presenter
        where Interactor == Presenter.Interactor {
            var interactor:Interactor = Interactor()
            var presenter:Presenter = Presenter()
            presenter.interactor = interactor
            interactor.presenter = presenter
            return presenter
    }
    
    private init() { }
}
