import UIKit

protocol StatsPresenterCollectionDatasourceProtocol:UICollectionViewDataSource {
    var viewModel:StatsViewModelCollection { get set }
}
