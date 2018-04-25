import Foundation

class StatsItemCompletion:StatsItemProtocol {
    func factoryViewWith(project:ProjectProtocol) -> StatsView {
        let countColumns:Int = project.columns.count
        if countColumns >= Constants.thirdOrder {
            return self.factoryThirdOrderWith(project:project)
        } else if countColumns >= Constants.secondOrder {
            return self.factorySecondOrderWith(project:project)
        } else {
            return self.factoryFirstOrderWith(project:project)
        }
    }
    
    private func factoryFirstOrderWith(project:ProjectProtocol) -> StatsView {
        return StatsViewCompletionFirstOrder()
    }
    
    private func factorySecondOrderWith(project:ProjectProtocol) -> StatsView {
        return StatsViewCompletionSecondOrder()
    }
    
    private func factoryThirdOrderWith(project:ProjectProtocol) -> StatsView {
        return StatsViewCompletionThirdOrder()
    }
}
