import Foundation
@testable import catban

class MockOrganisePresenterCollectionDelegateProtocol:NSObject, OrganisePresenterCollectionDelegateProtocol {
    weak var delegate:OrganisePresenterCollectionDelegateDelegateProtocol?
}
