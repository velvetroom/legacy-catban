import Foundation

class OrganisePresenterFactory:OrganisePresenterFactoryProtocol {
    func factoryWith(board:BoardProtocol) -> OrganiseViewModel {
        return OrganiseViewModel()
    }
}
