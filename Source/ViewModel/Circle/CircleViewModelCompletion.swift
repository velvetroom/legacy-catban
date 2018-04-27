import Foundation

struct CircleViewModelCompletion {
    var backlog:CircleViewModelCompletionStack
    var progress:CircleViewModelCompletionStack
    var done:CircleViewModelCompletionStack
    var totalCards:Int
    
    init() {
        self.backlog = CircleViewModelCompletionStack()
        self.progress = CircleViewModelCompletionStack()
        self.done = CircleViewModelCompletionStack()
        self.totalCards = 0
    }
}
