import SwiftUI

class FavoriteViewModel: ObservableObject {
	
	private init() { }
	static let shared = FavoriteViewModel()
	
	@Published var favoriteRecipes = [RecipeModel]()
	
	func isFavorite(recipe: RecipeModel) -> Bool {
	    favoriteRecipes.contains(recipe)
	}
	
	func toggleFavorites(recipe: RecipeModel) {
	    if isFavorite(recipe: recipe) {
		    if let index = favoriteRecipes.firstIndex(of: recipe) {
			    favoriteRecipes.remove(at: index)
		    }
	    } else {
		    favoriteRecipes.append(recipe)
	    }
	}
}
