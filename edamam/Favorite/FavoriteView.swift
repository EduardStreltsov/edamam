import SwiftUI

struct FavoriteView: View {
	
	@ObservedObject var favoriteVM: FavoriteViewModel = .shared
	
	var body: some View {
		NavigationView {
			List {
				ForEach(favoriteVM.favoriteRecipes, id: \.id) { recipe in
					NavigationLink(destination: RecipeView(recipe: recipe)) {
						Text(recipe.label)
					}
				}
			}
				.listStyle(InsetListStyle())
				.navigationBarTitle("Favorite", displayMode: .inline)
		}
		
	}
}