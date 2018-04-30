import Foundation
@testable import catban

class MockLandingViewModelLoaderCollectionMenu:LandingViewModelLoaderCollectionMenu {
    var onFactory:(() -> Void)?
    override func factoryWith(model:LandingProtocol) -> LandingViewModelCollectionMenu {
        self.onFactory?()
        return super.factoryWith(model:model)
    }
}
