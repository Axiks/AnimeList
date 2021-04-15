import 'package:anime_list_app/models/user.dart';

import 'anime.dart';
import 'dub.dart';
class Data{
  User adrian = User("Adrian", "https://www.goha.ru/s/A:NX/Xj/utWvPIbVmY.jpg", "https://cdn.iz.ru/sites/default/files/styles/900x506/public/article-2020-06/34434.jpg");

  User getUser(){
    List<Anime> allanime;
    List<Anime> favanime = [];
    allanime = getAnime();
    favanime.add(allanime[1]);
    favanime.add(allanime[3]);
    favanime.add(allanime[2]);
    adrian.setFavoriteAnimeList(favanime);
    return adrian;
  }

  List<Anime> getAnime(){
    Anime reZero = Anime();
    reZero.malId = 31240;
    reZero.title = 'Re:Zero kara Hajimeru Isekai Seikatsu';
    var alternativeTitles = <String, String>{
      'en': 'Re:ZERO -Starting Life in Another World-',
      'jp': 'Re：ゼロから始める異世界生活',
      'ua': 'Переродження: Життя з нуля в іншому світі'
    };
    reZero.mainPicture = "https://nyaa.shikimori.one/system/animes/original/31240.jpg";
    reZero.alternativeTitles = alternativeTitles;
    reZero.synopsis =
    "Продовження другого сезону пригод потраплянця, який хоче врятувати всіх за будь-яку ціну. Мешканці маєтку Розвааля досі ув'язнені в так званому Святилищі, а нашим героям протистоїть воля старовинної книги. Емілія досі намагається пройти випробування, аби звільнити всіх, але відкриваються все нові сюжетні повороти, які як тільки можуть ускладнюють життя нашим героям. ";
    reZero.startDate = DateTime(2016, 04, 04);
    reZero.endDate = DateTime(2016, 12, 28);
    reZero.createdAt = DateTime.now();
    reZero.updatedAt = DateTime.now();
    reZero.mediaType = 'tv';
    reZero.status = 'finished_airing';
    reZero.arts = [
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_1920x1080_john.doe_713836.jpg&url=https://files.yande.re/image/477dac9da5506921aaaf063b5a45f9ef/yande.re%20713836%20animal_ears%20halloween%20maid%20nekomimi%20pantyhose%20ram_%28re_zero%29%20re_zero_kara_hajimeru_isekai_seikatsu%20rem_%28re_zero%29%20tagme%20tail%20wallpaper.jpg',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_1200x1687_hiroimo2_728231.png&url=https://files.yande.re/image/b70769fd95b7d3d6dc3eed5032499489/yande.re%20728231%20maid%20re_zero_kara_hajimeru_isekai_seikatsu%20rem_%28re_zero%29%20skirt_lift%20stockings%20thighhighs%20twinbox.png',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_2894x4093_whitespace1_741177.jpg&url=https://files.yande.re/image/15f3797931b638129070a1f275a92b5d/yande.re%20741177%20dress%20emilia_%28re_zero%29%20neko%20pack_%28re_zero%29%20pointy_ears%20re_zero_kara_hajimeru_isekai_seikatsu%20thighhighs%20tomaco.jpg',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_2717x3843_whitespace1_740819.jpg&url=https://files.yande.re/image/6638c4c07ba22ade407c63da216a1d3c/yande.re%20740819%20cleavage%20maid%20re_zero_kara_hajimeru_isekai_seikatsu%20rem_%28re_zero%29%20seozo.jpg',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_1200x1843_BattlequeenYume_739545.jpg&url=https://files.yande.re/image/bd05656fc6942eb7435cbc740b446258/yande.re%20739545%20ass%20dress%20emilia_%28re_zero%29%20pointy_ears%20re_zero_kara_hajimeru_isekai_seikatsu%20tagme.jpg',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_3888x5500_BattlequeenYume_716331.jpg&url=https://files.yande.re/image/756eea6f4dd27963bce8589ed8e5e47f/yande.re%20716331%20breast_hold%20gaou_%28matsulatte%29%20maid%20no_bra%20re_zero_kara_hajimeru_isekai_seikatsu%20rem_%28re_zero%29%20thighhighs.jpg',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_1260x2048_john.doe_713838.jpg&url=https://files.yande.re/image/93dc8e3674aa81285c8ae948c8860054/yande.re%20713838%20animal_ears%20dress%20felix_argyle%20nekomimi%20pantyhose%20re_zero_kara_hajimeru_isekai_seikatsu%20tagme%20tail%20trap.jpg',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_3826x2551_BattlequeenYume_699062.png&url=https://files.yande.re/image/9cdef98a67a205172362fbc85b3550fb/yande.re%20699062%20llatteowo%20maid%20re_zero_kara_hajimeru_isekai_seikatsu%20rem_%28re_zero%29%20stockings%20thighhighs.png',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_2000x3064_Mr_GT_698717.jpg&url=https://files.yande.re/image/e34af3bc31855d85ddfe16fed206868c/yande.re%20698717%20echiru%20emilia_%28re_zero%29%20pantsu%20pointy_ears%20re_zero_kara_hajimeru_isekai_seikatsu%20seifuku%20skirt_lift%20thighhighs.jpg',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_3000x5033_Mr_GT_693257.png&url=https://files.yande.re/image/4fa44e5a5852d9eaa0b7f8a9bfca62d5/yande.re%20693257%20echidna_%28re_zero%29%20re_zero_kara_hajimeru_isekai_seikatsu%20seifuku%20shaffelli.png',
      'https://camo-v2.shikimori.one/?filename=re_zero_kara_hajimeru_isekai_seikatsu_1800x3400_Mr_GT_684284.png&url=https://files.yande.re/image/d286f0d77a6e95d04f58b3eaa4a2a96c/yande.re%20684284%20animal_ears%20happycloud%20re_zero_kara_hajimeru_isekai_seikatsu%20rem_%28re_zero%29%20seifuku%20tail%20thighhighs.png',
    ];
    reZero.genres = [
      'Психологічне',
      'Драма',
      'Триллер',
      'Фентезі',
    ];
    Dub reZero1 = Dub();
    reZero1.dubId = 1;
    reZero1.siteName = "anitube.in.ua";
    reZero1.href = "https://anitube.in.ua/2405-rezero.html";
    reZero1.allSeriesCount = 25;
    reZero1.turnedOutSeriesCount = 25;

    Dub reZero2 = Dub();
    reZero2.dubId = 2;
    reZero2.siteName = "eneyida.tv";
    reZero2.href = "https://eneyida.tv/4118-pererodzhennya-zhyttya-z-nulya-v-inshomu-sviti.html";
    reZero2.allSeriesCount = 25;
    reZero2.turnedOutSeriesCount = 25;
    reZero.dubs = [
      reZero1,
      reZero2
    ];

    Anime haiyore = Anime();
    haiyore.malId = 11785;
    haiyore.title = 'Haiyore! Nyaruko-san';
    alternativeTitles = <String, String>{
      'en': 'Haiyore! Nyaruko-san ',
      'jp': '這いよれ！ニャル子さん',
      'ua': 'Повзучий Хаос! Ньяруко '
    };
    haiyore.mainPicture = "https://nyaa.shikimori.one/system/animes/original/11785.jpg";
    haiyore.alternativeTitles = alternativeTitles;
    haiyore.synopsis =
    "Чи є людство єдиною розумно расою у всесвіті? Що ховає від нас холодна безодня космічного простору? Чи може прибульці вже тут і ховаються в тінях, виконуючи свої справи? Люди вигадали багато варіантів відповідей, багато теорій. Але, реальність виявилася іншою, ближчою до творчості Лавкрафта. Ясака Махіро, звичайний хлопець з холодним розумом та логічним мисленням, однієї ночі стає жертвою спроби викрадення прибульцями для їхніх сумнівних цілей. Чи може він вижити, зберігши психічне здоров'я і яке місце займає Земля у всесвіті? Так чи інакше, тепер йому доведеться жити з таємничою дівчиною, чия екстравагантна поведінка призведе до багатьох особливих ситуацій, і яку він постійно тикає виделкою.";
    haiyore.startDate = DateTime(2012, 05, 10);
    haiyore.endDate = DateTime(2016, 07, 10);
    haiyore.createdAt = DateTime.now();
    haiyore.updatedAt = DateTime.now();
    haiyore.mediaType = 'tv';
    haiyore.status = 'finished_airing';
    haiyore.arts = [
      'https://camo-v2.shikimori.one/?filename=haiyore!_nyaruko-san_1600x900_opai_160139.jpg&url=https://konachan.com/image/726c79d691a63da61fa53cab1234dfc2/Konachan.com%20-%20160139%20chibi%20green_eyes%20haiyore%21_nyaruko-san%20kilias%20kuuko%20nyaruko%20skirt%20tagme%20thighhighs%20yasaka_mahiro.jpg',
      'https://camo-v2.shikimori.one/?filename=haiyore!_nyaruko-san_1168x2048_Raynare_3938118.jpg&url=https://danbooru.donmai.us/data/55553ed9822c06f050570ed3f57e65c1.jpg',
      'https://camo-v2.shikimori.one/?filename=haiyore!_nyaruko-san_2000x1298_Wiresetc_159090.jpg&url=https://konachan.com/image/af5f626406e1261502a9845eb46dc08f/Konachan.com%20-%20159090%20haiyore%21_nyaruko-san%20nyaruko%20sw%20thighhighs.jpg',
      'https://camo-v2.shikimori.one/?filename=haiyore!_nyaruko-san_2000x1125_gnarf1975_158527.jpg&url=https://konachan.com/image/36c8d287d4d3dd7bdce652a623e2906e/Konachan.com%20-%20158527%20blush%20gray_hair%20green_eyes%20haiyore%21_nyaruko-san%20long_hair%20nyaruko%20saku_%28kudrove%29%20thighhighs%20tie.jpg',
      'https://camo-v2.shikimori.one/?filename=haiyore!_nyaruko-san_1920x1080_kaosu_137886.png&url=https://konachan.com/image/575f2fe4d1c15e47059719b5091f0f35/Konachan.com%20-%20137886%20close%20haiyore%21_nyaruko-san%20kuuko%20red_eyes%20red_hair%20transparent%20vector.png',
      'https://camo-v2.shikimori.one/?filename=haiyore!_nyaruko-san_1127x905_gnarf1975_136170.jpg&url=https://konachan.com/image/6cfad450c7f4727e038da0497193f4f9/Konachan.com%20-%20136170%20gray_hair%20green_eyes%20haiyore%21_nyaruko-san%20nyaruko%20school_uniform%20shantak-kun.jpg',
      'https://camo-v2.shikimori.one/?filename=haiyore!_nyaruko-san_1280x720_opai_134564.png&url=https://konachan.com/image/1f287fee2bd23312f998b3a879db297d/Konachan.com%20-%20134564%20aqua_eyes%20chibi%20gray_hair%20group%20hasuta%20kuuko%20long_hair%20nauribon%20nyaruko%20shantak-kun%20skirt%20thighhighs%20tie%20twintails%20wings%20wink%20yasaka_mahiro.png',
      'https://camo-v2.shikimori.one/?filename=haiyore!_nyaruko-san_1600x1200_opai_133523.jpg&url=https://konachan.com/image/0a827de407e437112dc1d144bcf1b30b/Konachan.com%20-%20133523%20gray_hair%20haiyore%21_nyaruko-san%20nyaruko%20poker-face-008%20tagme.jpg',
      'https://camo-v2.shikimori.one/?filename=haiyore!_nyaruko-san_1480x1090_opai_133218.png&url=https://konachan.com/image/c3d133ae83d9e0d680e93ec19b4ee156/Konachan.com%20-%20133218%20green_eyes%20haiyore%21_nyaruko-san%20k10k%20long_hair%20nyaruko%20panties%20school_uniform%20striped_panties%20thighhighs%20underwear.png',
    ];
    haiyore.genres = [
      'Фантастика',
      'Комедія',
      'Пародія',
    ];
    Dub haiyore1 = Dub();
    haiyore1.dubId = 3;
    haiyore1.siteName = "anitube.in.ua";
    haiyore1.href = "https://anitube.in.ua/3346-haiyore-nyaruko-san.html";
    haiyore1.allSeriesCount = 27;
    haiyore1.turnedOutSeriesCount = 27;

    Dub haiyore2 = Dub();
    haiyore2.dubId = 4;
    haiyore2.siteName = "animego.cc";
    haiyore2.href = "https://animego.cc/738-polzuchiy-haos-nyaruko-san-1-sezon.html";
    haiyore2.allSeriesCount = 12;
    haiyore2.turnedOutSeriesCount = 12;

    haiyore.dubs = [
      haiyore1,
      haiyore2
    ];

    Anime wonderEgg = Anime();
    wonderEgg.malId = 43299;
    wonderEgg.title = 'Wonder Egg Priority';
    alternativeTitles = <String, String>{
      'en': 'Wonder Egg Priority',
      'jp': 'ワンダーエッグ・プライオリティ',
      'ua': 'Пріоритет диво-яйця'
    };
    wonderEgg.alternativeTitles = alternativeTitles;
    wonderEgg..mainPicture = "https://dere.shikimori.one/system/animes/original/43299.jpg";
    wonderEgg.synopsis =
    "За настановою таємничого голосу під час північної прогулянки 14-річна дівчинка Ай Ото підбирає яйце. Голос вмовляє її: “Якщо хочеш змінити майбутнє, потрібно лише наважитись зробити вибір. Тепер повір у себе і розбий яйце”. ";
    wonderEgg.startDate = DateTime(2021, 02, 13);
    wonderEgg.endDate = null;
    wonderEgg.createdAt = DateTime.now();
    wonderEgg.updatedAt = DateTime.now();
    wonderEgg.mediaType = 'tv';
    wonderEgg.status = 'currently_airing';
    wonderEgg..arts = [
      'https://camo-v2.shikimori.one/?filename=wonder_egg_priority_3000x3000_Dreista_736922.png&url=https://files.yande.re/image/005149a1b7b3c10d28cc5f051dbd7588/yande.re%20736922%20aonuma_neiru%20dress%20heterochromia%20kawai_rika%20ohto_ai%20sawaki_momoe%20sweater%20wonder_egg_priority.png',
      'https://camo-v2.shikimori.one/?filename=wonder_egg_priority_822x848_feintnickolas_4326520.png&url=https://danbooru.donmai.us/data/7cf443e016d7276aacb2ef43210be401.png',
      'https://camo-v2.shikimori.one/?filename=wonder_egg_priority_1627x2300_Mysticus_4310211.jpg&url=https://danbooru.donmai.us/data/e27b16f18adcd30f63d54acfb42b1389.jpg',
    ];
    wonderEgg.genres = [
      'Психологічне',
      'Драма',
      'Фентезі',
    ];

    Anime biyori = Anime();
    biyori.malId = 39808;
    biyori.title = 'Non Non Biyori Nonstop';
    alternativeTitles = <String, String>{
      'en': 'Non Non Biyori Nonstop',
      'jp': 'のんのんびより のんすとっぷ',
      'ua': 'Безтурботні часи: Нонстоп'
    };
    biyori.alternativeTitles = alternativeTitles;
    biyori.mainPicture = "https://dere.shikimori.one/system/animes/original/17549.jpg";
    biyori.synopsis = 'Третій сезон пригод дівчат із глибинки. ';
    biyori.startDate = DateTime(2021, 02, 11);
    biyori.endDate = null;
    biyori.createdAt = DateTime.now();
    biyori.updatedAt = DateTime.now();
    biyori.mediaType = 'tv';
    biyori.status = 'currently_airing';
    biyori.arts = [
      'https://camo-v2.shikimori.one/?filename=non_non_biyori_1920x1080_FormX_170601.jpg&url=https://konachan.com/image/5114f5c16bf63b624253e76eca3df8a5/Konachan.com%20-%20170601%20blue_eyes%20blue_hair%20boat%20brown_eyes%20brown_hair%20chipika%20clouds%20fang%20flute%20group%20hat%20instrument%20landscape%20lighthouse%20parody%20scenic%20skirt%20sky%20water.jpg',
      'https://camo-v2.shikimori.one/?filename=non_non_biyori_1448x2048_Soundtracker_3707574.jpg&url=https://danbooru.donmai.us/data/c63f39332208c2121e0aecdc4864241b.jpg',
      'https://camo-v2.shikimori.one/?filename=non_non_biyori_1680x1050_Flandre93_174267.png&url=https://konachan.com/image/5c891ff0e385da509ac52ab8689bb7c7/Konachan.com%20-%20174267%20autumn%20black_hair%20brown_eyes%20brown_hair%20fang%20green_eyes%20ichijou_hotaru%20kneehighs%20leaves%20long_hair%20purple_hair%20ribbons%20skirt%20swordsouls%20tree%20twintails.png',
      'https://camo-v2.shikimori.one/?filename=non_non_biyori_1484x1419_Unbreakable_4015467.jpg&url=https://danbooru.donmai.us/data/c5d39a11686676c94c848d0a6aaade0e.jpg',
      'https://camo-v2.shikimori.one/?filename=non_non_biyori_830x1200_Strobe_Red_4047810.jpg&url=https://danbooru.donmai.us/data/0e51dce25199ff5e7bbda2441ccbc0c6.jpg',
      'https://camo-v2.shikimori.one/?filename=non_non_biyori_4083x5944_drop_274251.jpg&url=https://files.yande.re/image/9f755b9a9c4acf71f821501e48298a77/yande.re%20274251%20furukawa_hideki%20ichijou_hotaru%20koshigaya_komari%20koshigaya_natsumi%20miyauchi_renge%20non_non_biyori.jpg',
      'https://camo-v2.shikimori.one/?filename=non_non_biyori_4087x5798_drop_325729.jpg&url=https://files.yande.re/image/40674659ecc66093ca132f57edf71bff/yande.re%20325729%20furukawa_hideki%20ichijou_hotaru%20koshigaya_komari%20koshigaya_natsumi%20miyauchi_renge%20non_non_biyori%20yukata.jpg',
    ];
    biyori.genres = [
      'Комедія',
      'Школа',
      'Сьонен',
      'Повсякденність',
    ];

    Anime horimiya = Anime();
    horimiya.malId = 42897;
    horimiya.title = 'Horimiya';
    alternativeTitles = <String, String>{
      'en': 'Horimiya ',
      'jp': 'ホリミヤ ',
      'ua': 'Хорімія'
    };
    horimiya.alternativeTitles = alternativeTitles;
    horimiya.mainPicture = "https://moe.shikimori.one/system/animes/original/42897.jpg";
    horimiya.synopsis =
    'Старшокласницею Кьоко Хорі захоплюються за її товариськість і здібності до навчання, однак вона приховує інший бік себе. Через те, що батьки дівчини часто затримуються на роботі, їй доводиться піклуватися про молодшого братика, а решту часу займає навчання, тому в неї не лишається шансів на спілкування з іншими поза стінами школи. Тим часом Ідзумі Міямуру сприймають як похмурого отаку в окулярах. Однак, насправді, він м’яка людина, не здатна вчитися. Ба більше, в нього 9 пірсингів, схованих за довгим волоссям і татуювання вздовж спини і лівого плеча. Випадково шляхи Хорі і Міямури перетинаються. Ці, здавалося б, протилежності стають друзями і показують одне одному свій потаємний бік. ';
    horimiya.startDate = DateTime(2021, 02, 10);
    horimiya.endDate = null;
    horimiya.createdAt = DateTime.now();
    horimiya.updatedAt = DateTime.now();
    horimiya.mediaType = 'tv';
    horimiya.status = 'currently_airing';
    horimiya.arts = [
      'https://camo-v2.shikimori.one/?filename=horimiya_912x1117_pikuchan_1640473.png&url=https://cdn.donmai.us/original/c7/d1/c7d19a31f4e56f2a31b96106c0e92ad1.png',
      'https://camo-v2.shikimori.one/?filename=horimiya_2000x1050_pikuchan_1680605.jpg&url=https://cdn.donmai.us/original/88/5a/885aa2a9fd6d8f4a5897780236debcda.jpg',
      'https://camo-v2.shikimori.one/?filename=horimiya_1183x1750_%E3%81%8D%E3%82%8A%E3%81%95%E3%81%8D%E3%81%82%E3%81%8D%E3%81%8A_398955.jpg&url=https://files.yande.re/image/0e7b98bf3ccfd7726d1fa45014684ede/yande.re%20398955%20cream%20hagiwara_daisuke%20hori-san_to_miyamura-kun%20hori_kyouko%20miyamura_izumi%20seifuku%20thighhighs.jpg',
      'https://camo-v2.shikimori.one/?filename=horimiya_2000x3000_Gtttt_739609.jpg&url=https://files.yande.re/image/85bcd00bf8d9df752ac0269d2851f743/yande.re%20739609%20ani_%20hori-san_to_miyamura-kun%20miyamura_izumi.jpg',
      'https://camo-v2.shikimori.one/?filename=horimiya_2000x4000_Gtttt_739610.jpg&url=https://files.yande.re/image/159810887f181e9b3c48166498bcf0d2/yande.re%20739610%20ani_%20hori-san_to_miyamura-kun%20hori_kyouko%20sweater%20thighhighs.jpg',
      'https://camo-v2.shikimori.one/?filename=horimiya_4091x5787_saemonnokami_745327.jpg&url=https://files.yande.re/image/3ea18a0f85fd0a99796e4a347c6ad156/yande.re%20745327%20hori-san_to_miyamura-kun%20hori_kyouko%20miyamura_izumi%20seifuku%20sweater%20tagme.jpg',
      'https://camo-v2.shikimori.one/?filename=horimiya_2960x3816_Mr_GT_739955.png&url=https://files.yande.re/image/db6c59d80e352a1c551cd9a6e6c14e4c/yande.re%20739955%20hori-san_to_miyamura-kun%20hori_kyouko%20kanniiepan%20miyamura_izumi%20seifuku%20skirt_lift%20sweater.png',
    ];
    horimiya.genres = [
      'Повсякденність',
      'Комедія',
      'Романтика',
      'Школа',
      'Cенен',
    ];

    Anime sky = Anime();
    sky.malId = 39569;
    sky.title = 'Sora no Aosa wo Shiru Hito yo ';
    alternativeTitles = <String, String>{
      'en': 'Her Blue Sky',
      'jp': '空の青さを知る人よ  ',
      'ua': 'Вона пізнала неба блакить'
    };
    sky.alternativeTitles = alternativeTitles;
    sky.mainPicture = "https://cdn.myanimelist.net/images/anime/1468/102527.jpg";
    sky.synopsis =
    'Аой Айой ходить до старшої школи та живе разом зі старшою сестрою Акане. Вони живуть самі після трагічної події, що забрала їх батьків 13 років тому. Відтоді Акане піклується про молодшу сестру самотужки, тому після закінчення школи Аой збирається поїхати до Токіо, щоб полегшити життя своїй сестрі та побудувати музичну кар\'єру, на яку її надихнув колишній хлопець Акане - Шінносуке "Шінно" Канамуро. Шінно був частиною місцевої групи до тих пір, поки не поїхав до Токіо, щоб стати професійним гітаристом. ';
    sky.startDate = DateTime(2019, 11, 11);
    sky.endDate = null;
    sky.createdAt = DateTime.now();
    sky.updatedAt = DateTime.now();
    sky.mediaType = 'movie';
    sky.status = 'finished_airing';
    sky.genres = [
      'Драма',
    ];
    sky.arts = [
      'https://pbs.twimg.com/media/EgWgLGkXsAMH_5t.jpg'
    ];

    List<Anime> myAnime = [reZero, haiyore, wonderEgg, biyori, horimiya, sky];
    return myAnime;
  }
}

