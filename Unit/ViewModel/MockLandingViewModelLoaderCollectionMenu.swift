import Foundation
@testable import catban

class MockLandingViewModelLoaderCollectionMenu:LandingViewModelLoaderCollectionMenu {
    var onFactory:(() -> Void)?
    override func factoryWith(project:ProjectProtocol, editing:IndexPath) -> LandingViewModelCollectionMenu {
        self.onFactory?()
        return super.factoryWith(project:project, editing:editing)
    }
}
