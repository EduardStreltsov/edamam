import SwiftUI

struct RecipeView: View {
	
	@ObservedObject var recipeVM: RecipeViewModel
	@StateObject var favoriteVM: FavoriteViewModel = .shared
	
	init(recipe: RecipeModel) {
		recipeVM = RecipeViewModel(recipe: recipe)
	}
	
	var body: some View {
		let recipe = recipeVM.recipe
		GeometryReader { geometry in
			VStack {
				if let url = URL(string: recipe.image) {
					AsyncImage(url: url, placeholder: {
						ProgressView().progressViewStyle(CircularProgressViewStyle())
					})
					.frame(minWidth: geometry.size.width)
				}
				
				HStack {
					Button(action: {
						recipeVM.toggleFavorites()
					}) {
						Image(systemName: (recipeVM.isFavorite() ? "heart.fill" : "heart"))
							//.frame(minWidth: geometry.size.width / 6, minHeight: 34)
							//.background(Color.blue)
							//.foregroundColor(.white)
							//.cornerRadius(6)
							.frame(minWidth: geometry.size.width / 4)
							.font(Font.system(size: 25))
							.tag(recipeVM.isFavorite() ? "heart.fill" : "heart")
					}
					
					VStack(alignment: .leading) {
						Text("Cooking time: \(recipe.formattedTotalTime)")
						Text("Yield: \(recipe.yield)")
						Text("Calories: \(recipe.formattedCalories) kcal.")
						Text("Total weight: \(recipe.formattedTotalWeight) g.")
					}
					.frame(minWidth: geometry.size.width / 4 * 3, alignment: .leading)
					//.background(Color.gray)
				}
					.frame(minWidth: geometry.size.width)
					//.background(Color.yellow)
				
				Divider()
				
				List(recipe.ingredients, id: \.self) { ingredient in
					Text("\(ingredient.text)")
					
				}
					.listStyle(InsetListStyle())
			}
				.navigationBarTitle(recipe.label, displayMode: .inline)
		}
	}
}
