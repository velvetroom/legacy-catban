import Foundation

struct CircleCompletionViewModel {
    var backlog:CircleCompletionStackViewModel
    var progress:CircleCompletionStackViewModel
    var done:CircleCompletionStackViewModel
    var totalCards:Int
    
    init() {
        self.backlog = CircleCompletionStackViewModel()
        self.progress = CircleCompletionStackViewModel()
        self.done = CircleCompletionStackViewModel()
        self.totalCards = 0
    }
}
