import UIKit

extension StatsViewCompletionGeneral {
    func factoryStacks() {
        self.factoryStackBacklog()
        self.factoryStackProgress()
        self.factoryStackDone()
    }
    
    private func factoryStackBacklog() {
        let view:StatsViewCompletionGeneralStack = StatsViewCompletionGeneralStack()
        view.viewColour.backgroundColor = UIColor.Shared.gray
        view.labelTitle.text = String.localizedStats(key:"StatsViewCompletionGeneral_stackBacklog_title")
        self.viewStackBacklog = view
        
        self.addSubview(view)
        
        view.topAnchor.constraint(equalTo:self.labelCardsNumber.bottomAnchor,
                                  constant:Constants.stacksTop).isActive = true
        view.layoutHeight = view.heightAnchor.constraint(equalToConstant:Constants.stackHeight)
        view.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant:Constants.stackWidth).isActive = true
        view.layoutHeight?.isActive = true
    }
    
    private func factoryStackProgress() {
        let view:StatsViewCompletionGeneralStack = StatsViewCompletionGeneralStack()
        view.viewColour.backgroundColor = UIColor.Shared.blue.withAlphaComponent(0.2)
        view.labelTitle.text = String.localizedStats(key:"StatsViewCompletionGeneral_stackProgress_title")
        self.viewStackProgress = view
        
        self.addSubview(view)
        
        view.topAnchor.constraint(equalTo:self.viewStackBacklog.bottomAnchor).isActive = true
        view.layoutHeight = view.heightAnchor.constraint(equalToConstant:Constants.stackHeight)
        view.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant:Constants.stackWidth).isActive = true
        view.layoutHeight?.isActive = true
    }
    
    private func factoryStackDone() {
        let view:StatsViewCompletionGeneralStack = StatsViewCompletionGeneralStack()
        view.viewColour.backgroundColor = UIColor.Shared.blue
        view.labelTitle.text = String.localizedStats(key:"StatsViewCompletionGeneral_stackDone_title")
        self.viewStackDone = view
        
        self.addSubview(view)
        
        view.topAnchor.constraint(equalTo:self.viewStackProgress.bottomAnchor).isActive = true
        view.layoutHeight = view.heightAnchor.constraint(equalToConstant:Constants.stackHeight)
        view.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant:Constants.stackWidth).isActive = true
        view.layoutHeight?.isActive = true
    }
}
