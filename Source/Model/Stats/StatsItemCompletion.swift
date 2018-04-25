import Foundation

class StatsItemCompletion:StatsItemProtocol {
    func factoryViewModelWith(project:ProjectProtocol) -> StatsViewModelCollectionItemProtocol {
        let countColumns:Int = project.columns.count
        if countColumns >= Constants.thirdOrder {
            return self.factoryThirdOrderWith(project:project)
        } else if countColumns >= Constants.secondOrder {
            return self.factorySecondOrderWith(project:project)
        } else {
            return self.factoryFirstOrderWith(project:project)
        }
    }
    
    private func factoryFirstOrderWith(
        project:ProjectProtocol) -> StatsViewModelCollectionItemProtocol {
        return StatsViewModelCollectionItemCompletionFirstOrder()
    }
    
    private func factorySecondOrderWith(
        project:ProjectProtocol) -> StatsViewModelCollectionItemProtocol {
        return StatsViewModelCollectionItemCompletionSecondOrder()
    }
    
    private func factoryThirdOrderWith(
        project:ProjectProtocol) -> StatsViewModelCollectionItemProtocol {
        return StatsViewModelCollectionItemCompletionThirdOrder()
    }
}
