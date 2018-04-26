import Foundation

struct ProjectCompletionViewModel {
    var backlog:ProjectCompletionViewModelStack
    var progress:ProjectCompletionViewModelStack
    var done:ProjectCompletionViewModelStack
    var totalCards:Int
    
    init() {
        self.backlog = ProjectCompletionViewModelStack()
        self.progress = ProjectCompletionViewModelStack()
        self.done = ProjectCompletionViewModelStack()
        self.totalCards = 0
    }
}
