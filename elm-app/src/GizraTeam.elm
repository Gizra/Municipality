module GizraTeam exposing (..)

import Attribute.Model exposing (..)
import DictList exposing (DictList)
import People.Model exposing (..)


people : DictList GitHubName Person
people =
    [ ( "amitaibu"
      , { name = "Amitai Burstein"
        , image = "amitaibu.jpg"
        , socialNetworks =
            [ Email "amitai"
            , Twitter "amitaibu"
            , Github "amitaibu"
            , Drupal "amitaibu"
            ]
        , title = "CTO, Co-Owner"
        , attributes =
            [ DoingSports
            , FamilyAttr Kids
            , FamilyAttr Married
            , FoodAttr Pescetarian
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LanguageAttr French
            , LanguageAttr Spanish
            , LivedAbroad
            , NationalityAttr Israel
            , MusicWhileWorking
            , PreferedWorkHoursAttr NineToFive
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr Drama
            , TvAndMovieGenereAttr SciFi
            ]
        }
      )
    , ( "bricel"
      , { name = "Brice Lenfant"
        , image = "bricel.jpg"
        , socialNetworks =
            [ Email "brice"
            , Twitter "bricel"
            , Github "bricel"
            , Drupal "bricel"
            ]
        , title = "CEO, Co-Owner"
        , attributes =
            [ DoingSports
            , FamilyAttr Kids
            , FamilyAttr Married
            , FoodAttr Paleo
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LanguageAttr French
            , LivedAbroad
            , MusicWhileWorking
            , NationalityAttr Israel
            , PreferedWorkHoursAttr EarlyRise
            , PreferedWorkHoursAttr NineToFive
            , SportAttr CrossFit
            , TvAndMovieGenereAttr Drama
            ]
        }
      )
    , ( "OritiMG"
      , { name = "Orit Geron"
        , image = "OritGeron.jpg"
        , socialNetworks =
            [ Email "orit@gizra.com"
            , Twitter "OritiMG"
            , Github "OritGeron"
            ]
        , title = "Operations Manager"
        , attributes =
            [ FamilyAttr Kids
            , FamilyAttr Married
            , GenderAttr Female
            , LanguageAttr Hebrew
            , LanguageAttr English
            , MusicWhileWorking
            , NationalityAttr Israel
            , PreferedWorkHoursAttr EarlyRise
            , Tattoo
            , TvAndMovieGenereAttr Action
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr Drama
            , TvAndMovieGenereAttr SciFi
            ]
        }
      )
    , ( "IshaDakota"
      , { name = "Adam Stewart"
        , image = "ishadakota.jpg"
        , socialNetworks =
            [ Email "adam@gizra.com"
            , Twitter "adamhstewart"
            , Github "IshaDakota"
            , Drupal "IshaDakota"
            ]
        , title = "USA CTO"
        , attributes =
            [ DoingSports
            , FamilyAttr Kids
            , FamilyAttr Married
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LivedAbroad
            , NationalityAttr USA
            , PreferedWorkHoursAttr EarlyRise
            , SportAttr Baseball
            , TvAndMovieGenereAttr Comedy
            ]
        }
      )
    , ( "RachelBaram"
      , { name = "Rachel Baram"
        , image = "RachelBaram.jpg"
        , socialNetworks =
            [ Email "rachel@gizra.com"
            , Twitter "RachelBaram"
            , Github "RachelBaram"
            ]
        , title = "Business Development"
        , attributes =
            [ DoingSports
            , FamilyAttr Kids
            , FamilyAttr Married
            , FoodAttr Paleo
            , GenderAttr Female
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LivedAbroad
            , NationalityAttr USA
            , NationalityAttr Israel
            , Pet
            , PreferedWorkHoursAttr EarlyRise
            , PreferedWorkHoursAttr NineToFive
            , PreferedWorkHoursAttr NightOwl
            , SportAttr CrossFit
            , Tattoo
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr Drama
            , TvAndMovieGenereAttr SciFi
            , WorkingRemote
            ]
        }
      )
    , ( "LiatSadeSaadon"
      , { name = "Liat Sade Saadon"
        , image = "liatsade.jpg"
        , socialNetworks =
            [ Email "liat@gizra.com"
            , Twitter "Liat_Sade"
            , Github "liatsade"
            , Drupal "liats75"
            ]
        , title = "Employee Training & Development"
        , attributes =
            [ DoingSports
            , FamilyAttr Kids
            , FamilyAttr Married
            , GenderAttr Female
            , LanguageAttr Hebrew
            , LanguageAttr English
            , NationalityAttr Israel
            , PreferedWorkHoursAttr NineToFive
            , SportAttr Pilates
            , TvAndMovieGenereAttr Drama
            , WorkingRemote
            ]
        }
      )
    , ( "RoySegall"
      , { name = "Roy Segall"
        , image = "RoySegall.jpg"
        , socialNetworks =
            [ Email "roy.segall@gizra.com"
            , Github "RoySegall"
            , Drupal "RoySegall"
            ]
        , title = "Team Lead"
        , attributes =
            [ DoingSports
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , NationalityAttr Israel
            , MusicAttr PlayingInstrument
            , MusicWhileWorking
            , NationalityAttr Israel
            , PreferedWorkHoursAttr EarlyRise
            , SportAttr CrossFit
            , TvAndMovieGenereAttr Action
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr Drama
            , TvAndMovieGenereAttr SciFi
            ]
        }
      )
    , ( "NaderSafadi"
      , { name = "Nader Safadi"
        , image = "nader77.jpg"
        , socialNetworks =
            [ Email "nader@gizra.com"
            , Github "nader77"
            , Drupal "nader77"
            ]
        , title = "Team Lead"
        , attributes =
            [ DoingSports
            , GenderAttr Male
            , LanguageAttr Arabic
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LivedAbroad
            , MusicWhileWorking
            , NationalityAttr Israel
            , PreferedWorkHoursAttr EarlyRise
            , PreferedWorkHoursAttr NightOwl
            , SportAttr CrossFit
            , Tattoo
            , TvAndMovieGenereAttr Action
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr SciFi
            ]
        }
      )
    , ( "bitamar"
      , { name = "Itamar Bar-Lev"
        , image = "bitamar.jpg"
        , socialNetworks =
            [ Email "itamar@gizra.com"
            , Github "bitamar"
            , Drupal "itamar"
            ]
        , title = "Team Lead"
        , attributes =
            [ FamilyAttr Kids
            , FamilyAttr Married
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LanguageAttr German
            , LivedAbroad
            , MusicAttr PlayingInstrument
            , MusicAttr Sing
            , MusicWhileWorking
            , NationalityAttr Israel
            , PreferedWorkHoursAttr NineToFive
            , TvAndMovieGenereAttr Drama
            , WorkingRemote
            ]
        }
      )
    , ( "ordavidil"
      , { name = "Or David"
        , image = "ordavidil.jpg"
        , socialNetworks =
            [ Email "or@gizra.com"
            , Github "ordavidil"
            , Drupal "ordavidil"
            ]
        , title = "Team Lead"
        , attributes =
            [ DoingSports
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LivedAbroad
            , MusicAttr PlayingInstrument
            , MusicWhileWorking
            , NationalityAttr Israel
            , PreferedWorkHoursAttr NightOwl
            , SportAttr Volleyball
            , TvAndMovieGenereAttr Action
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr Drama
            , TvAndMovieGenereAttr Horror
            , TvAndMovieGenereAttr SciFi
            ]
        }
      )
    , ( "efratn"
      , { name = "Efrat Nitzan"
        , image = "efratn.jpg"
        , socialNetworks =
            [ Email "efrat@gizra.com"
            , Github "efratn"
            ]
        , title = "Account Manager"
        , attributes =
            [ DoingSports
            , FamilyAttr Kids
            , FoodAttr Kosher
            , GenderAttr Female
            , LanguageAttr Hebrew
            , LanguageAttr English
            , MusicWhileWorking
            , NationalityAttr Israel
            , Pet
            , PreferedWorkHoursAttr NineToFive
            , SportAttr Pilates
            ]
        }
      )
    , ( "Pavel"
      , { name = "Pavel Pirozhenko"
        , image = "Pavel.jpg"
        , socialNetworks =
            [ Email "pavel@gizra.com"
            , Github "ppavels"
            ]
        , title = "Developer"
        , attributes =
            [ DoingSports
            , FamilyAttr Kids
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LanguageAttr Russian
            , LanguageAttr Ukrainian
            , LivedAbroad
            , MusicWhileWorking
            , NationalityAttr Israel
            , Pet
            , PreferedWorkHoursAttr NightOwl
            , SportAttr Soccer
            , SportAttr Volleyball
            , TvAndMovieGenereAttr Action
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr Horror
            , TvAndMovieGenereAttr SciFi
            ]
        }
      )
    , ( "anvmn"
      , { name = "Anatoly Vaitsman"
        , image = "anvmn.jpg"
        , socialNetworks =
            [ Email "anatoly@gizra.com"
            , Github "anvmn"
            ]
        , title = "Developer"
        , attributes =
            [ DoingSports
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LanguageAttr Russian
            , LivedAbroad
            , NationalityAttr Israel
            , PreferedWorkHoursAttr NightOwl
            , SportAttr CrossFit
            , Tattoo
            , TvAndMovieGenereAttr Action
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr Drama
            , TvAndMovieGenereAttr Horror
            , TvAndMovieGenereAttr SciFi
            ]
        }
      )
    , ( "SavyonCohen"
      , { name = "Savyon Cohen"
        , image = "savyoncohen.jpg"
        , socialNetworks =
            [ Email "savyon@gizra.com"
            , Github "savyoncohen"
            ]
        , title = "Developer"
        , attributes =
            [ DoingSports
            , FamilyAttr Kids
            , FamilyAttr Married
            , FoodAttr Kosher
            , GenderAttr Female
            , LanguageAttr Hebrew
            , LanguageAttr English
            , MusicAttr Sing
            , MusicWhileWorking
            , NationalityAttr Israel
            , PreferedWorkHoursAttr EarlyRise
            , TvAndMovieGenereAttr Action
            , TvAndMovieGenereAttr Comedy
            ]
        }
      )
    , ( "ybaras"
      , { name = "Yoav Baras"
        , image = "ybaras.jpg"
        , socialNetworks =
            [ Email "yoav@gizra.com"
            , Github "ybaras"
            ]
        , title = "Developer"
        , attributes =
            [ DoingSports
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LivedAbroad
            , MusicWhileWorking
            , NationalityAttr Israel
            , Pet
            , PreferedWorkHoursAttr NineToFive
            , Tattoo
            , TvAndMovieGenereAttr Comedy
            ]
        }
      )
    , ( "DavidBronfen"
      , { name = "David Bronfen"
        , image = "DavidBronfen.jpg"
        , socialNetworks =
            [ Email "davidb@gizra.com"
            , Github "DavidBronfen"
            ]
        , title = "Developer"
        , attributes =
            [ DoingSports
            , FoodAttr Vegetarian
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr Italian
            , LanguageAttr English
            , LanguageAttr Russian
            , NationalityAttr Israel
            , MusicAttr Sing
            , MusicWhileWorking
            , Pet
            , PreferedWorkHoursAttr EarlyRise
            , SportAttr CrossFit
            , Tattoo
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr Drama
            ]
        }
      )
    , ( "ItamarGronich"
      , { name = "Itamar Gronich"
        , image = "ItamarGronich.jpg"
        , socialNetworks =
            [ Email "itamargronich@gizra.com"
            , Github "ItamarGronich"
            ]
        , title = "Developer"
        , attributes =
            [ DoingSports
            , GenderAttr Male
            , LanguageAttr Hebrew
            , LanguageAttr English
            , LivedAbroad
            , MusicAttr PlayingInstrument
            , MusicWhileWorking
            , NationalityAttr Israel
            , Pet
            , PreferedWorkHoursAttr EarlyRise
            , SportAttr CrossFit
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr Drama
            ]
        }
      )
    , ( "DavidHernandez"
      , { name = "David Hernandez"
        , image = "DavidHernandez.jpg"
        , socialNetworks =
            [ Email "david.hernandez@gizra.com"
            , Github "DavidHernandez"
            , Drupal "david-hernández"
            ]
        , title = "Developer"
        , attributes =
            [ FoodAttr Vegan
            , GenderAttr Male
            , LanguageAttr Catalonian
            , LanguageAttr English
            , LanguageAttr Spanish
            , LivedAbroad
            , MusicWhileWorking
            , NationalityAttr Spain
            , Pet
            , PreferedWorkHoursAttr EarlyRise
            , PreferedWorkHoursAttr NineToFive
            , PreferedWorkHoursAttr NightOwl
            , Tattoo
            , TvAndMovieGenereAttr SciFi
            , WorkingRemote
            ]
        }
      )
    , ( "RyanRempel"
      , { name = "Ryan Rempel"
        , image = "RyanRempel.jpg"
        , socialNetworks =
            [ Email "ryan@gizra.com"
            , Github "rgrempel"
            ]
        , title = "Developer"
        , attributes =
            [ DoingSports
            , FamilyAttr Married
            , FamilyAttr Kids
            , LanguageAttr English
            , MusicAttr Sing
            , NationalityAttr Canada
            , Pet
            , PreferedWorkHoursAttr NineToFive
            , PreferedWorkHoursAttr NightOwl
            , Tattoo
            , TvAndMovieGenereAttr Comedy
            , TvAndMovieGenereAttr SciFi
            , WorkingRemote
            ]
        }
      )
    , ( "AronNovak"
      , { name = "Aron Novak"
        , image = "AronNovak.jpg"
        , socialNetworks =
            [ Email "aron@gizra.com"
            , Github "AronNovak"
            , Drupal "aron-novak"
            ]
        , title = "Developer"
        , attributes =
            [ DoingSports
            , FamilyAttr Married
            , FamilyAttr Kids
            , LanguageAttr English
            , LanguageAttr Hungarian
            , MusicWhileWorking
            , NationalityAttr Hungary
            , PreferedWorkHoursAttr NineToFive
            , Tattoo
            , TvAndMovieGenereAttr SciFi
            , WorkingRemote
            ]
        }
      )
    ]
        |> DictList.fromList
