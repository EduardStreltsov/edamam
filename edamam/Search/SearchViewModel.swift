import SwiftUI

protocol Searchable {
	func search(query: String)
}

class SearchViewModel: ObservableObject, Searchable {
	
	@Published var searchResult = [RecipeModel]()
	@Published var isSearching = false
	
	func search(query: String) {
		if query.isEmpty {
			return
		}
		
		isSearching = true
		
        var components = URLComponents(string: APIConfig.searchUrl)!
		components.queryItems = [
			URLQueryItem(name: "q", value: query),
			URLQueryItem(name: "app_id", value: APIConfig.applicationId),
			URLQueryItem(name: "app_key", value: APIConfig.applicationKey)
		]
		components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
		var request = URLRequest(url: components.url!)
		request.httpMethod = "GET"
		let session = URLSession.shared
		let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> () in
			print(String(describing: response))
			guard error == nil else {
				print(error?.localizedDescription)
				print(error)
				return
			}
			guard let data = data else {
				print("no data")
				return
			}
			do {
				let result = try JSONDecoder().decode(Hits.self, from: data)
				self.searchResult = result.hits.map { $0.recipe }
				self.isSearching = false
			} catch let error {
				print(error.localizedDescription)
				print(error)
			}
		}
		task.resume()
	}
}

