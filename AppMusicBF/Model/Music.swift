//
//  Music.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 09/01/23.
//

import Foundation

struct Music {
    var id: String
    var name: String
    var duration: Int
    var imageName: String?
    var albumName: String?
    var singerName: String?
    var generalRelevance: Int?
    var gender: Gender?
}

enum Gender {
    case internationalPop
    case samba
    case brazilianPop
    case country
    case mpb
    case trap
    case rap
    case reggae
    case celebration
    case pagoda
}

var MusicData = [

    Music(
        id: "0123",
        name: "The Official World Cup Qatar Intro",
        duration: 122, imageName: "fifa_world_cup_qatar_intro",
        albumName: nil,
        singerName: "FIFA",
        generalRelevance: 100,
        gender: .celebration
    ),
    
    Music(
        id: "0124",
        name: "Photograph",
        duration: 189, imageName: "photograph_ed_sheeran",
        albumName: "photograph",
        singerName: "Ed Sheeran",
        generalRelevance: 10000,
        gender: .internationalPop
    ),
    
    Music(
        id: "0125",
        name: "Deixa pra amanhã (Ao Vivo)",
        duration: 209,
        imageName: "deixa_pra_amanha_dilsinho",
        albumName: "Dilsinho",
        singerName: "Dilsinho",
        generalRelevance: 5000,
        gender: .pagoda
    ),
    
    Music(
        id: "0126",
        name: "Photograph",
        duration: 189,
        imageName: "photograph_ed_sheeran",
        albumName: "photograph",
        singerName: "Ed Sheeran",
        generalRelevance: 10000,
        gender: .internationalPop
    ),
    
    Music(
        id: "0127",
        name: "Photograph",
        duration: 189,
        imageName: "photograph_ed_sheeran",
        albumName: "photograph",
        singerName: "Ed Sheeran",
        generalRelevance: 10000,
        gender: .internationalPop
    ),
    
    
]
