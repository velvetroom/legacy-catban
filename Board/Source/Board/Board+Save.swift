import Foundation

extension Board {
    func saveProject() {
        self.repository.save(project:self.project)
    }
    
    func saveUser() {
        self.repository.save(user:self.user)
    }
}
