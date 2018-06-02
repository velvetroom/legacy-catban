import Foundation

class RepositoryFile {
    var url:RepositoryFileUrl
    
    init() {
        self.url = RepositoryFileFactory.makeUrl()
    }
    
    func buildStructure() throws {
        try self.makeDirectory(url:self.url.directoryUrl)
        try self.makeDirectory(url:self.url.projectsUrl)
    }
    
    func boardData() throws -> Data {
        return try self.dataAt(url:self.url.boardUrl)
    }
    
    func projectsData() -> [Data] {
        let fileNames:[String] = self.projectFileNames()
        return self.projectsDataWith(fileNames:fileNames)
    }
    
    func writeBoard(data:Data) throws {
        try data.write(to:self.url.boardUrl, options:Data.WritingOptions.atomic)
    }
    
    func writeProject(data:Data, with identifier:String) throws {
        try self.deleteProjectWith(identifier:identifier)
        try data.write(to:self.projectUrlFor(identifier:identifier), options:Data.WritingOptions.atomic)
    }
    
    func delete() {
        do { try FileManager.default.removeItem(at:self.url.directoryUrl) } catch { }
    }
    
    func deleteProjectWith(identifier:String) throws {
        let url:URL = self.projectUrlFor(identifier:identifier)
        if FileManager.default.fileExists(atPath:url.path) {
            try FileManager.default.removeItem(at:url)
        }
    }
    
    private func projectsDataWith(fileNames:[String]) -> [Data] {
        var projectsData:[Data] = []
        for fileName:String in fileNames {
            let fileUrl:URL = self.url.projectsUrl.appendingPathComponent(fileName)
            let data:Data
            do {
                data = try self.dataAt(url:fileUrl)
            } catch {
                continue
            }
            projectsData.append(data)
        }
        return projectsData
    }
    
    private func makeDirectory(url:URL) throws {
        guard
            FileManager.default.fileExists(atPath:url.path) == false
        else { return }
        try FileManager.default.createDirectory(at:url, withIntermediateDirectories:true, attributes:nil)
        try self.excludeFromBackup(url:url)
    }
    
    private func excludeFromBackup(url:URL) throws {
        var url:URL = url
        var resourceValues:URLResourceValues = URLResourceValues()
        resourceValues.isExcludedFromBackup = true
        try url.setResourceValues(resourceValues)
    }
    
    private func dataAt(url:URL) throws -> Data {
        guard
            FileManager.default.fileExists(atPath:url.path)
        else { throw ErrorRepository.fileNotFound }
        return try Data(contentsOf:url)
    }
    
    private func projectFileNames() -> [String] {
        var strings:[String] = []
        do { strings = try FileManager.default.contentsOfDirectory(atPath:self.url.projectsUrl.path) } catch { }
        return strings
    }
    
    private func projectUrlFor(identifier:String) -> URL {
        return self.url.projectsUrl.appendingPathComponent(identifier).appendingPathExtension(
            RepositoryConstants.Url.fileExtension)
    }
}