import UIKit

protocol OrganisePresenterCollectionDelegateProtocol:UICollectionViewDelegateFlowLayout {
    var delegate:OrganisePresenterCollectionDelegateDelegateProtocol? { get set }
}
