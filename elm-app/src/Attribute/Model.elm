module Attribute.Model exposing (..)


type Attribute
    = DoingSports
    | FamilyAttr Family
    | FoodAttr Food
    | GenderAttr Gender
    | LanguageAttr Language
    | LivedAbroad
    | MusicAttr Music
    | MusicWhileWorking
    | NationalityAttr Nationality
    | Pet
    | PreferedWorkHoursAttr PreferedWorkHours
    | SportAttr Sport
    | Tattoo
    | TvAndMovieGenereAttr TvAndMovieGenere
    | WorkingRemote


type Family
    = Kids
    | Married


type Food
    = Kosher
    | Paleo
    | Pescetarian
    | Vegetarian
    | Vegan


type Language
    = Arabic
    | Catalonian
    | English
    | Hebrew
    | Hungarian
    | Italian
    | German
    | Spanish
    | French
    | Russian
    | Ukrainian


type Gender
    = Female
    | Male


type Music
    = Sing
    | PlayingInstrument


type Nationality
    = Austria
    | Canada
    | Hungary
    | Israel
    | Spain
    | UK
    | USA


type PreferedWorkHours
    = EarlyRise
    | NineToFive
    | NightOwl


type Sport
    = Baseball
    | CrossFit
    | Pilates
    | Soccer
    | Yoga
    | Volleyball


type TvAndMovieGenere
    = Action
    | Comedy
    | Drama
    | Horror
    | SciFi
