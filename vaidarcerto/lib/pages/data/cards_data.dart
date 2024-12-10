// PÁGINA FEITA POR GABRIEL OLIVEIRA

class YouTubeCardInfo {
  final String imageUrl;
  final String avatarImageUrl;
  final String title;
  final String channelName;
  final String views;
  final String videoCode;
  final String category;

  YouTubeCardInfo({
    required this.imageUrl,
    required this.avatarImageUrl,
    required this.title,
    required this.channelName,
    required this.views,
    required this.videoCode,
    required this.category,
  });
}

class ProfileCardInfo {
  final String name;
  final String followers;
  final String profileImageUrl;
  final List<String> tags;

  ProfileCardInfo({
    required this.name,
    required this.followers,
    required this.profileImageUrl,
    this.tags = const [],
    
  });

}

final List<ProfileCardInfo> profileCards = [
  ProfileCardInfo(
    name: 'COREANO',
    followers: '170 mil de seguidores',
    profileImageUrl: 'assets/coreano.jpg',
    tags: ['valorant'], // Certifique-se de que tags é uma lista
  ),
  ProfileCardInfo(
    name: 'Viniccius13',
    followers: '6,22 mi de seguidores',
    profileImageUrl: 'assets/viniccius13.jpg',
    // Se não houver tags, não passar nada, e o valor padrão será usado
  ),
];



List<YouTubeCardInfo> cardsData = [
  YouTubeCardInfo(//1                                 Minecraft
    imageUrl: 'assets/tsunamiautomatico.jpg',
    avatarImageUrl:'assets/viniccius13.jpg',
    title: 'TSUNAMI AUTOMÁTICO - Minecraft Em busca da casa automática #308',
    channelName: 'Viniccius13',
    views:'3,7 mi de views',
    videoCode:'',
    category:'Minecraft'
  ),
  YouTubeCardInfo(//2
    imageUrl: 'assets/farmdemadeira.jpg',
    avatarImageUrl:'assets/viniccius13.jpg',
    title: 'Farm de Madeira 100% Automática - Minecraft Em busca da casa automática #342',
    channelName: 'Viniccius13',
    views:'3,8 mi de views',
    videoCode:'',
    category:'Minecraft'
  ),
  YouTubeCardInfo(//3                                  Valorant
    imageUrl: 'assets/valorantaovivo.jpg',
    avatarImageUrl:'assets/eigames.jpg',
    title: 'VALORANT AO VIVO! - O NOVO JOGO DO MOMENTO?',
    channelName: 'Ei Games',
    views:'15 mil de views',
    videoCode:'3nX7BHiSzFo',
    category:'Valorant'
  ),
    YouTubeCardInfo(//4
    imageUrl: 'assets/valorant.jpg',
    avatarImageUrl:'assets/valorantcanal.jpg',
    title: 'The Round // Gameplay Preview - VALORANT',
    channelName: 'VALORANT',
    views:'3,6 mi de views',
    videoCode:'',
    category:'Valorant' 
  ),
  YouTubeCardInfo(//5
    imageUrl: 'assets/valorant2.jpg',
    avatarImageUrl:'assets/b13game.jpg',
    title: '🔥LIVE AO VIVO VALORANT 🔥 🔥',
    channelName: 'B13 Game',
    views:'203 de views',
    videoCode:'',
    category:'Valorant'
  ),
  YouTubeCardInfo(//6
    imageUrl: 'assets/valorant1.jpg',
    avatarImageUrl:'assets/throneful.jpg',
    title: 'VALORANT Gameplay (PC HD) [1080p60FPS]',
    channelName: 'Throneful',
    views:'3,39 mi de views',
    videoCode:'',
    category:'Valorant'
  ),
  YouTubeCardInfo(//7
    imageUrl: 'assets/coreano1.avif',
    avatarImageUrl:'assets/coreano.jpg',
    title: 'Cypher está MUITO ROUBADO em de ABYSS?!',
    channelName: 'Coreano',
    views:'9,9 mil de views',
    videoCode:'',
    category:'Valorant'
  ),             
  YouTubeCardInfo(//8
    imageUrl: 'assets/coreano2.avif',
    avatarImageUrl:'assets/coreano.jpg',
    title: 'CONTRA ELES É SEMPRE VITÓRIA rs - VALORANT',
    channelName: 'Coreano',
    views:'13 mil de views',
    videoCode:'',
    category:'Valorant'
  ),             
  YouTubeCardInfo(//9
    imageUrl: 'assets/coreano3.avif',
    avatarImageUrl:'assets/coreano.jpg',
    title: 'Aulas de como se jogar de Omen em Lotus 😎',
    channelName: 'Coreano',
    views:'11 mil de views',
    videoCode:'',
    category:'Valorant'
  ),
  YouTubeCardInfo(//10
    imageUrl: 'assets/valoranthistorico.jpg',
    avatarImageUrl:'assets/takehistorico.jfif',
    title: 'VALORANT RUMO A PRATA!!!! (FloridoGM) (Ao Vivo)',
    channelName: 'TAKES E-SPORTS',
    views:'5,4 mil de views',
    videoCode:'',
    category:'Valorant'
  ),                                    // Live
   YouTubeCardInfo(//11
    imageUrl: 'assets/coreanolive.avif',
    avatarImageUrl:'assets/coreano.jpg',
    title: 'Valorant, (talvez) Enigma do Medo, Marvel Rivals lançamento global 17h e Watchparty 19h',
    channelName: 'Coreano',
    views:'6,3 mil views ',
    videoCode:'',
    category:'Valorant_live'
  ), 
                                                              
  YouTubeCardInfo(//12                            Futebol
    imageUrl: 'assets/realmadrid.jpg',
    avatarImageUrl:'assets/litoralnews.jpg',
    title: 'MANCHESTER CITY X REAL MADRID TRANSMISSÃO AO VIVO DIRETO DO ETIHAD STADIUM - CHAMPIONS LEAGUE 2023',
    channelName: 'Litoral News',
    views:'1 mi de views',
    videoCode:'',
    category:'Futebol'
  ),

  YouTubeCardInfo(//13                           
    imageUrl: 'assets/fifahistorico.jpg',
    avatarImageUrl:'assets/df1historico.jpg',
    title: 'FUTEBOL AO VIVO 1º Campeonato Brasileiro online de FIFA Soccer 11 Here comes a new challenger!',
    channelName: 'DICASF1 CLUBE DE PILOTOS',
    views:'30,8 mil de views',
    videoCode:'',
    category:'Futebol'
  ),
  YouTubeCardInfo(//14                        csgo                          
    imageUrl: 'assets/cs2historico.jpg',
    avatarImageUrl:'assets/dnxhistorico.jpg',
    title: 'CS:GO Source 2 Beta AO VIVO - Explorando o NOVO CS2 🔥 + Doando SKINS',
    channelName: 'DNX - CSGO',
    views:'36,9 mil de views',
    videoCode:'',
    category:'Futebol'
  ),
  
];
