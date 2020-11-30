protocol SearchProtocol {
    func search(newKey: String?, newLanguage: String?) -> (result: TestResult, outputString: String)
}