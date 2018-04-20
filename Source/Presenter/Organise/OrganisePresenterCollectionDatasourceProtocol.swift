import UIKit

protocol OrganisePresenterCollectionDatasourceProtocol:UICollectionViewDataSource {
    var viewModel:OrganiseViewModelCollection { get set }
}
