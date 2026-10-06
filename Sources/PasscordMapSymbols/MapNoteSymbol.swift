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
    case busMapPin = "bus_map_pin"
    case restArea = "rest_area"

    // outdoors
    case hiking
    case beachAccess = "beach_access"
    case camping
    case birdwatching
    case park
    case forest
    case landscape
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
    case waterDrop = "water_drop"
    case hotTub = "hot_tub"
    case rollerSkating = "roller_skating"
    case sledding
    case playground
    case outdoorGrill = "outdoor_grill"

    // weather
    case sunny
    case partlyCloudyDay = "partly_cloudy_day"
    case cloud
    case rainy
    case thunderstorm
    case weatherSnowy = "weather_snowy"
    case weatherHail = "weather_hail"
    case foggy
    case air
    case wbTwilight = "wb_twilight"
    case nightlight
    case partlyCloudyNight = "partly_cloudy_night"

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
    case directionsRun = "directions_run"
    case stairs2 = "stairs_2"
    case sportsGymnastics = "sports_gymnastics"
    case pickleball
    case sportsMma = "sports_mma"
    case sportsCricket = "sports_cricket"
    case sportsHandball = "sports_handball"
    case sportsHockey = "sports_hockey"
    case sportsFootball = "sports_football"
    case sportsRugby = "sports_rugby"
    case accessibleForward = "accessible_forward"
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
    case localMall = "local_mall"
    case localGasStation = "local_gas_station"
    case parcelPickup = "parcel_pickup"
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

    // dailyServices
    case evStation = "ev_station"
    case wc
    case babyChangingStation = "baby_changing_station"
    case carRepair = "car_repair"
    case dentistry
    case medicalServices = "medical_services"
    case recycling
    case petSupplies = "pet_supplies"

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

    // Additional travel symbols
    case flightTakeoff = "flight_takeoff"
    case flightLand = "flight_land"
    case electricBike = "electric_bike"
    case electricCar = "electric_car"
    case electricMoped = "electric_moped"
    case electricRickshaw = "electric_rickshaw"
    case gondolaLift = "gondola_lift"
    case funicular
    case monorail
    case helicopter
    case scooter
    case snowmobile
    case rvHookup = "rv_hookup"
    case anchor
    case signpost
    case autoTowing = "auto_towing"
    case bikeDock = "bike_dock"

    // Additional outdoors symbols
    case mountainFlag = "mountain_flag"
    case volcano
    case onsen
    case sauna
    case planet
    case deck
    case snowshoeing
    case outdoorGarden = "outdoor_garden"
    case agriculture
    case owl
    case snail
    case crueltyFree = "cruelty_free"
    case emojiNature = "emoji_nature"
    case compost
    case hive
    case pergola
    case bathOutdoor = "bath_outdoor"

    // Additional weather symbols
    case rainyLight = "rainy_light"
    case rainyHeavy = "rainy_heavy"
    case rainySnow = "rainy_snow"
    case snowingHeavy = "snowing_heavy"
    case moonStars = "moon_stars"
    case tornado
    case cyclone
    case flood

    // Additional foodAndDrink symbols
    case emojiFoodBeverage = "emoji_food_beverage"
    case kebabDining = "kebab_dining"
    case setMeal = "set_meal"
    case cookie
    case skillet
    case japaneseCurry = "japanese_curry"
    case okonomiyaki
    case washoku
    case yoshoku
    case hanamiDango = "hanami_dango"
    case soba
    case udon
    case yakitori
    case coffeeMaker = "coffee_maker"
    case waterBottle = "water_bottle"
    case chefHat = "chef_hat"
    case wheat
    case avocadoBean = "avocado_bean"

    // Additional activities symbols
    case chess
    case playingCards = "playing_cards"
    case toysAndGames = "toys_and_games"
    case computer
    case historyEdu = "history_edu"
    case sportsMotorsports = "sports_motorsports"
    case padel
    case target
    case sportsKabaddi = "sports_kabaddi"
    case swords
    case crossword
    case manga
    case radio
    case movieFilter = "movie_filter"
    case camera
    case drone
    case headMountedDevice = "head_mounted_device"

    // Additional places symbols
    case chalet
    case bungalow
    case holidayVillage = "holiday_village"
    case nightShelter = "night_shelter"
    case newsstand
    case foodBank = "food_bank"
    case labs
    case construction

    // Additional dailyServices symbols
    case contentCut = "content_cut"
    case healthAndBeauty = "health_and_beauty"
    case fragrance
    case eyeglasses
    case shoppingCart = "shopping_cart"
    case checkroom
    case chair
    case handyman
    case localShipping = "local_shipping"
    case stethoscope
    case vaccines
    case pill
    case physicalTherapy = "physical_therapy"
    case massage
    case stroller
    case acupuncture
    case psychology
    case radiology
    case bloodtype
    case cleaningServices = "cleaning_services"
    case dryCleaning = "dry_cleaning"
    case plumbing
    case electricalServices = "electrical_services"
    case print
    case currencyExchange = "currency_exchange"
    case key
    case shower
    case bed
    case roomService = "room_service"
    case concierge
    case pestControl = "pest_control"

    // Additional personal symbols
    case familyGroup = "family_group"
    case personHeart = "person_heart"
    case partnerHeart = "partner_heart"
    case heartSmile = "heart_smile"
    case heartBroken = "heart_broken"
    case sentimentExcited = "sentiment_excited"
    case sentimentCalm = "sentiment_calm"
    case sentimentStressed = "sentiment_stressed"
    case sentimentWorried = "sentiment_worried"
    case sick
    case foldedHands = "folded_hands"
    case candle
    case jewelry
    case crown
    case savings
    case wallet
    case backpack

    private var materialSymbolName: String {
        switch self {
        case .birdwatching: "raven"
        case .parcelPickup: "package_2"
        default: rawValue
        }
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

/// Browsing groups only. Persist a symbol's raw value, never its section or index.
/// Each selectable symbol belongs to exactly one group.
public enum MapNoteSymbolCategory: CaseIterable {
    case travel
    case lodging
    case foodAndDrink
    case drinksAndDesserts
    case sports
    case outdoorActivities
    case outdoors
    case artsAndCulture
    case activities
    case workAndStudy
    case dailyServices
    case homeAndFamily
    case healthAndWellness
    case places
    case personal
    case markers
    case weather

    public var symbols: [MapNoteSymbol] {
        switch self {
        case .travel:
            return [
                .directionsWalk, .directionsBike, .electricBike, .scooter,
                .electricScooter, .directionsCar, .electricCar, .localTaxi,
                .motorcycle, .electricMoped, .electricRickshaw, .directionsBus,
                .airportShuttle, .busMapPin, .subway, .train,
                .tram, .monorail, .cableCar, .gondolaLift,
                .funicular, .flight, .flightTakeoff, .flightLand,
                .helicopter, .directionsBoat, .sailing, .houseboat,
                .carRental, .transitTicket, .bikeDock, .anchor
            ]
        case .lodging:
            return [
                .map, .explore, .signpost, .passport,
                .airplaneTicket, .luggage, .backpack, .hotel,
                .roomService, .concierge, .restArea, .camping,
                .rvHookup, .cottage, .cabin, .villa,
                .chalet, .bungalow, .holidayVillage, .nightShelter
            ]
        case .foodAndDrink:
            return [
                .restaurant, .fastfood, .lunchDining, .dinnerDining,
                .breakfastDining, .brunchDining, .localPizza, .ramenDining,
                .riceBowl, .soupKitchen, .takeoutDining, .bento,
                .tapas, .kebabDining, .setMeal, .japaneseCurry,
                .okonomiyaki, .washoku, .yoshoku, .soba,
                .udon, .yakitori, .skillet, .chefHat,
                .egg, .nutrition, .wheat, .avocadoBean,
                .outdoorGrill
            ]
        case .drinksAndDesserts:
            return [
                .localCafe, .emojiFoodBeverage, .coffeeMaker, .localDrink,
                .waterBottle, .localBar, .wineBar, .liquor,
                .beerMeal, .bakeryDining, .cake, .cookie,
                .icecream, .shavedIce, .hanamiDango
            ]
        case .sports:
            return [
                .fitnessCenter, .directionsRun, .stairs2, .sportsGymnastics,
                .sportsSoccer, .sportsBasketball, .sportsTennis, .sportsVolleyball,
                .sportsBaseball, .badminton, .pickleball, .padel,
                .sportsCricket, .sportsHandball, .sportsHockey, .sportsFootball,
                .sportsRugby, .sportsMma, .sportsMartialArts, .sportsKabaddi,
                .swords
            ]
        case .outdoorActivities:
            return [
                .hiking, .nordicWalking, .snowshoeing, .mountainFlag,
                .downhillSkiing, .snowboarding, .sledding, .snowmobile,
                .iceSkating, .rollerSkating, .skateboarding, .pool,
                .kayaking, .rowing, .surfing, .scubaDiving,
                .kitesurfing, .paragliding, .golfCourse, .sportsMotorsports,
                .target
            ]
        case .outdoors:
            return [
                .beachAccess, .park, .forest, .landscape,
                .water, .volcano, .planet, .waterDrop,
                .eco, .grass, .pottedPlant, .outdoorGarden,
                .agriculture, .birdwatching, .owl, .snail,
                .crueltyFree, .emojiNature, .hive, .pets,
                .compost, .pergola
            ]
        case .artsAndCulture:
            return [
                .museum, .theaterComedy, .musicNote, .piano,
                .headphones, .mic, .radio, .movie,
                .movieFilter, .photoCamera, .camera, .videocam,
                .drone, .palette, .brush, .draw,
                .manga
            ]
        case .activities:
            return [
                .localActivity, .attractions, .festival, .nightlife,
                .casino, .sportsEsports, .headMountedDevice, .chess,
                .playingCards, .toysAndGames, .crossword, .toys,
                .playground, .deck
            ]
        case .workAndStudy:
            return [
                .school, .work, .event, .computer,
                .libraryBooks, .menuBook, .localLibrary, .historyEdu,
                .architecture, .science, .labs, .lightbulb,
                .print
            ]
        case .dailyServices:
            return [
                .shoppingBag, .shoppingCart, .grocery, .storefront,
                .localMall, .localConvenienceStore, .newsstand, .localFlorist,
                .checkroom, .fragrance, .jewelry, .redeem,
                .wallet, .savings, .localAtm, .currencyExchange,
                .parcelPickup, .localPostOffice, .localShipping, .localGasStation,
                .evStation, .localParking, .carRepair, .localCarWash,
                .autoTowing, .localLaundryService, .dryCleaning, .cleaningServices,
                .handyman, .plumbing, .electricalServices, .pestControl,
                .recycling, .petSupplies
            ]
        case .homeAndFamily:
            return [
                .home, .chair, .key, .bed,
                .shower, .familyGroup, .childCare, .stroller,
                .babyChangingStation, .familyRestroom, .wc
            ]
        case .healthAndWellness:
            return [
                .localHospital, .medicalServices, .stethoscope, .dentistry,
                .localPharmacy, .pill, .vaccines, .radiology,
                .bloodtype, .physicalTherapy, .accessibleForward, .acupuncture,
                .psychology, .selfImprovement, .massage, .spa,
                .onsen, .bathOutdoor, .sauna, .hotTub,
                .contentCut, .healthAndBeauty, .eyeglasses
            ]
        case .places:
            return [
                .apartment, .locationCity, .castle, .fort,
                .localSee, .church, .templeBuddhist, .templeHindu,
                .mosque, .stadium, .accountBalance,
                .localPolice, .localFireDepartment, .warehouse, .factory,
                .construction, .foodBank
            ]
        case .personal:
            return [
                .person, .groups, .partnerHeart, .personHeart,
                .elderly, .volunteerActivism, .handshake, .thumbUp,
                .celebration, .sentimentSatisfied, .heartSmile, .sentimentExcited,
                .sentimentCalm, .sentimentDissatisfied, .heartBroken, .sentimentStressed,
                .sentimentWorried, .sick, .foldedHands, .candle
            ]
        case .markers:
            return [
                .star, .starShine, .favorite, .flag,
                .bookmark, .checkCircle, .verified, .warning,
                .emojiEvents, .workspacePremium, .diamond, .crown
            ]
        case .weather:
            return [
                .sunny, .partlyCloudyDay, .cloud, .rainyLight,
                .rainy, .rainyHeavy, .thunderstorm, .rainySnow,
                .weatherSnowy, .snowingHeavy, .weatherHail, .foggy,
                .air, .wbTwilight, .nightlight, .partlyCloudyNight,
                .moonStars, .tornado, .cyclone, .flood
            ]
        }
    }
}
