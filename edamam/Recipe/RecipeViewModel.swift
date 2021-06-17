import SwiftUI

class RecipeViewModel: ObservableObject {
	
	@Published var recipe: RecipeModel
	@Published var favoriteVM: FavoriteViewModel = .shared
	
	init(recipe: RecipeModel) {
		self.recipe = recipe
	}
	
	func isFavorite() -> Bool {
	    favoriteVM.isFavorite(recipe: recipe)
	}
	
	func toggleFavorites() {
		favoriteVM.toggleFavorites(recipe: recipe)
	}
}
