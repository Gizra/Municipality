module Attribute.Utils
    exposing
        ( attributeToString
        )

import Attribute.Model exposing (..)


attributeToString : Attribute -> String
attributeToString attribute =
    case attribute of
        DoingSports ->
            "Playing Sports"

        FamilyAttr family ->
            toString family

        FoodAttr food ->
            toString food

        GenderAttr gender ->
            toString gender

        LanguageAttr language ->
            toString language

        LivedAbroad ->
            "Lived abroad"

        MusicAttr music ->
            case music of
                Sing ->
                    "Sing"

                PlayingInstrument ->
                    "Playing music"

        MusicWhileWorking ->
            "Music at work"

        NationalityAttr nationality ->
            toString nationality

        Pet ->
            "Pet"

        PreferedWorkHoursAttr workHours ->
            case workHours of
                EarlyRise ->
                    "Early riser"

                NineToFive ->
                    "9 to 5"

                NightOwl ->
                    "Night Owl"

        SportAttr sport ->
            case sport of
                Baseball ->
                    "Baseball"

                CrossFit ->
                    "Cross Fit"

                Pilates ->
                    "Pilates"

                Soccer ->
                    "Soccer"

                Yoga ->
                    "Yoga"

                Volleyball ->
                    "Volleyball"

        Tattoo ->
            "Tattoo"

        TvAndMovieGenereAttr tvAndMovieGenere ->
            case tvAndMovieGenere of
                Action ->
                    "Action"

                Comedy ->
                    "Comedy"

                Drama ->
                    "Drama"

                Horror ->
                    "Horror"

                SciFi ->
                    "Sci-Fi"

        WorkingRemote ->
            "Work remote"
