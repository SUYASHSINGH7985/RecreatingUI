import Combine

// ViewModel responsible for managing the portfolio data and business logic
class PortfolioViewModel: ObservableObject {
    // This array holds all the assets in the portfolio
    // It’s marked @Published so any UI observing it will update automatically when it changes
    @Published var assets: [Asset] = []
    
    // TODO: Add methods to load assets from a server or local database
    
    // TODO: Add functionality to add, update, or remove assets from the portfolio
    
    // TODO: Include calculations like total portfolio value, gains/losses, etc.
}
