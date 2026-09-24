import UIKit

/// The stable identifiers for the curated MapNote icon picker.
/// Persist `rawValue`; the asset name is derived from that identifier.
public enum MapNoteSymbol: String, CaseIterable {
    // travel
    case flight
    case train
    case directionsCar = "directions_car"
    case directionsBoat = "directions_boat"
    case hotel
    case luggage
    case directionsBike = "directions_bike"
    case explore
    case map
    case sailing
    case directionsBus = "directions_bus"
    case subway
    case airplaneTicket = "airplane_ticket"
    case passport
    case airportShuttle = "airport_shuttle"
    case localTaxi = "local_taxi"
    case tram
    case cableCar = "cable_car"
    case motorcycle
    case electricScooter = "electric_scooter"
    case carRental = "car_rental"
    case houseboat
    case directionsWalk = "directions_walk"
    case transitTicket = "transit_ticket"

    // outdoors
    case hiking
    case beachAccess = "beach_access"
    case camping
    case birdwatching
    case park
    case forest
    case landscape
    case sunny
    case water
    case downhillSkiing = "downhill_skiing"
    case kayaking
    case surfing
    case eco
    case grass
    case pottedPlant = "potted_plant"
    case spa
    case pool
    case scubaDiving = "scuba_diving"
    case kitesurfing
    case paragliding
    case rowing
    case snowboarding
    case iceSkating = "ice_skating"
    case nordicWalking = "nordic_walking"
    case skateboarding
    case cloud
    case rainy
    case weatherSnowy = "weather_snowy"
    case nightlight
    case waterDrop = "water_drop"
    case hotTub = "hot_tub"
    case rollerSkating = "roller_skating"
    case sledding

    // foodAndDrink
    case restaurant
    case localCafe = "local_cafe"
    case localBar = "local_bar"
    case bakeryDining = "bakery_dining"
    case localPizza = "local_pizza"
    case icecream
    case ramenDining = "ramen_dining"
    case lunchDining = "lunch_dining"
    case wineBar = "wine_bar"
    case localDrink = "local_drink"
    case fastfood
    case dinnerDining = "dinner_dining"
    case breakfastDining = "breakfast_dining"
    case brunchDining = "brunch_dining"
    case riceBowl = "rice_bowl"
    case soupKitchen = "soup_kitchen"
    case takeoutDining = "takeout_dining"
    case grocery
    case liquor
    case beerMeal = "beer_meal"
    case bento
    case tapas
    case shavedIce = "shaved_ice"
    case egg
    case nutrition

    // activities
    case photoCamera = "photo_camera"
    case museum
    case musicNote = "music_note"
    case sportsSoccer = "sports_soccer"
    case palette
    case shoppingBag = "shopping_bag"
    case theaterComedy = "theater_comedy"
    case movie
    case sportsBasketball = "sports_basketball"
    case fitnessCenter = "fitness_center"
    case localFlorist = "local_florist"
    case libraryBooks = "library_books"
    case theaters
    case piano
    case headphones
    case mic
    case sportsTennis = "sports_tennis"
    case sportsVolleyball = "sports_volleyball"
    case sportsBaseball = "sports_baseball"
    case badminton
    case architecture
    case science
    case menuBook = "menu_book"
    case localActivity = "local_activity"
    case casino
    case attractions
    case festival
    case nightlife
    case videocam
    case brush
    case draw
    case sportsEsports = "sports_esports"
    case toys
    case sportsMartialArts = "sports_martial_arts"
    case golfCourse = "golf_course"

    // places
    case home
    case school
    case work
    case event
    case apartment
    case storefront
    case localHospital = "local_hospital"
    case localLibrary = "local_library"
    case stadium
    case church
    case templeBuddhist = "temple_buddhist"
    case mosque
    case castle
    case fort
    case templeHindu = "temple_hindu"
    case synagogue
    case localMall = "local_mall"
    case localGasStation = "local_gas_station"
    case localPharmacy = "local_pharmacy"
    case localPostOffice = "local_post_office"
    case localPolice = "local_police"
    case localFireDepartment = "local_fire_department"
    case localParking = "local_parking"
    case localLaundryService = "local_laundry_service"
    case localAtm = "local_atm"
    case localCarWash = "local_car_wash"
    case warehouse
    case factory
    case cottage
    case cabin
    case villa
    case locationCity = "location_city"
    case accountBalance = "account_balance"
    case localSee = "local_see"
    case localConvenienceStore = "local_convenience_store"

    // personal
    case star
    case favorite
    case flag
    case pets
    case celebration
    case cake
    case emojiEvents = "emoji_events"
    case bookmark
    case sentimentSatisfied = "sentiment_satisfied"
    case lightbulb
    case redeem
    case groups
    case sentimentDissatisfied = "sentiment_dissatisfied"
    case familyRestroom = "family_restroom"
    case childCare = "child_care"
    case elderly
    case person
    case volunteerActivism = "volunteer_activism"
    case thumbUp = "thumb_up"
    case handshake
    case workspacePremium = "workspace_premium"
    case verified
    case checkCircle = "check_circle"
    case warning
    case selfImprovement = "self_improvement"
    case starShine = "star_shine"
    case diamond

    private var materialSymbolName: String {
        self == .birdwatching ? "raven" : rawValue
    }

    public var assetName: String {
        let suffix = materialSymbolName.split(separator: "_").map { part in
            String(part.prefix(1)).uppercased() + part.dropFirst()
        }.joined()
        return "MapNoteMaterial\(suffix)"
    }

    public var stickerAssetName: String {
        "MapNoteSticker\(assetName.dropFirst("MapNoteMaterial".count))"
    }

    /// The original vector symbol, rendered as a template for any user color.
    public var image: UIImage? {
        UIImage(named: assetName, in: .module, compatibleWith: nil)?
            .withRenderingMode(.alwaysTemplate)
    }

    /// The precomputed white vector backing, including its rounded edge.
    public var stickerBackgroundImage: UIImage? {
        UIImage(named: stickerAssetName, in: .module, compatibleWith: nil)?
            .withRenderingMode(.alwaysOriginal)
    }
}

public enum MapNoteSymbolCategory: CaseIterable {
    case travel
    case outdoors
    case foodAndDrink
    case activities
    case places
    case personal

    public var symbols: [MapNoteSymbol] {
        switch self {
        case .travel:
            return [
                .flight, .train, .directionsCar, .directionsBoat,
                .hotel, .luggage, .directionsBike, .explore,
                .map, .sailing, .directionsBus, .subway,
                .airplaneTicket, .passport, .airportShuttle, .localTaxi,
                .tram, .cableCar, .motorcycle, .electricScooter,
                .carRental, .houseboat, .directionsWalk, .transitTicket
            ]
        case .outdoors:
            return [
                .hiking, .beachAccess, .camping, .birdwatching,
                .park, .forest, .landscape, .sunny,
                .water, .downhillSkiing, .kayaking, .surfing,
                .eco, .grass, .pottedPlant, .spa,
                .pool, .scubaDiving, .kitesurfing, .paragliding,
                .rowing, .snowboarding, .iceSkating, .nordicWalking,
                .skateboarding, .cloud, .rainy, .weatherSnowy,
                .nightlight, .waterDrop, .hotTub, .rollerSkating,
                .sledding
            ]
        case .foodAndDrink:
            return [
                .restaurant, .localCafe, .localBar, .bakeryDining,
                .localPizza, .icecream, .ramenDining, .lunchDining,
                .wineBar, .localDrink, .fastfood, .dinnerDining,
                .breakfastDining, .brunchDining, .riceBowl, .soupKitchen,
                .takeoutDining, .grocery, .liquor, .beerMeal,
                .bento, .tapas, .shavedIce, .egg,
                .nutrition
            ]
        case .activities:
            return [
                .photoCamera, .museum, .musicNote, .sportsSoccer,
                .palette, .shoppingBag, .theaterComedy, .movie,
                .sportsBasketball, .fitnessCenter, .localFlorist, .libraryBooks,
                .theaters, .piano, .headphones, .mic,
                .sportsTennis, .sportsVolleyball, .sportsBaseball, .badminton,
                .architecture, .science, .menuBook, .localActivity,
                .casino, .attractions, .festival, .nightlife,
                .videocam, .brush, .draw, .sportsEsports,
                .toys, .sportsMartialArts, .golfCourse
            ]
        case .places:
            return [
                .home, .school, .work, .event,
                .apartment, .storefront, .localHospital, .localLibrary,
                .stadium, .church, .templeBuddhist, .mosque,
                .castle, .fort, .templeHindu, .synagogue,
                .localMall, .localGasStation, .localPharmacy, .localPostOffice,
                .localPolice, .localFireDepartment, .localParking, .localLaundryService,
                .localAtm, .localCarWash, .warehouse, .factory,
                .cottage, .cabin, .villa, .locationCity,
                .accountBalance, .localSee, .localConvenienceStore
            ]
        case .personal:
            return [
                .star, .favorite, .flag, .pets,
                .celebration, .cake, .emojiEvents, .bookmark,
                .sentimentSatisfied, .lightbulb, .redeem, .groups,
                .sentimentDissatisfied, .familyRestroom, .childCare, .elderly,
                .person, .volunteerActivism, .thumbUp, .handshake,
                .workspacePremium, .verified, .checkCircle, .warning,
                .selfImprovement, .starShine, .diamond
            ]
        }
    }
}
