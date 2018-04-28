import Foundation

extension Board {
    func saveProject() {
        self.repository.save(project:self.project)
    }
}
