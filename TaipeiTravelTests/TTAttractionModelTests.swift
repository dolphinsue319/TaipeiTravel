//
//  TTAttractionModelTests.swift
//  TaipeiTravelTests
//
//  Created by Kedia on 2024/12/27.
//

import Testing
import Foundation

struct TTAttractionModelTests {

    @Test func parseModels() async throws {
        let models = try JSONDecoder().decode([TTAttractionModelImpl].self, from: jsonString.data(using: .utf8)!)
        #expect(models.count == 30)
        for model in models {
            #expect(model.id > 0)
            #expect(model.name.count > 0)
            for imageString in model.imageURLStringArray ?? [] {
                #expect(imageString.count > 0)
            }
        }
    }

    private let jsonString =
"""
[
  {
    "id": 218,
    "name": "臺北製糖所文化園區",
    "name_zh": null,
    "open_status": 1,
    "introduction": "歷史簡介\r\n1764年(乾隆29年)台灣彰化以北開始有產糖紀錄，艋舺大理街附近地區在清朝是私人糖廍組織盛行、遍地栽植甘蔗的地貌，日治時期設立「台北製糖株式會社」後，地景大幅轉變，成為以製糖工廠、交通輸送軌道為主的產業區域，週邊居民多依賴糖業或週邊產業生活。\r\n\r\n光復後，都市計畫沿用日據時土地混合使用的概念，附近劃設為工業區。糖廠由台糖公司接收後不久即停止製糖，轉為倉儲使用，但附近以糖業剩餘產能為中心的相關產業如化學、化工、食品加工、紙業等中小型工廠仍然盛行。四O年代中國時報社的前身「徵信新聞」接收台糖倉庫展開報頁，吸引了週邊印刷產業的聚集。\r\n\r\n六、七O年代起鐵路運輸之便吸引了成衣批發業者的聚集。在台北的發展歷史中，大理街附近區域一直扮演著生產的角色，直到近年來產業環境改變、城市發展東移，一度繁盛的「會社尾」生活圈及工業地景逐步沒落，實質環境品質也因人口聚居、建物密集興建後逐漸降低，公共設施無法服務居民的生活機能，而逐漸成為城市發展的邊緣。\r\n\r\n\r\n在大理街社區居民抗爭反對療養院設立，到爭取鄰里公園，保存台灣最北的製糖遺構之臺北糖廠建物，古蹟本體倉庫由紅磚疊砌，拱門、梯形柱及大跨距構架為其特色，民國92年9月23日公告指定市定為106號古蹟。\r\n\r\n願景與未來\r\n三棟市定古蹟糖倉A、B、C ，位處萬華區大理街，所在範圍包含 C1 街廓(公二公園)、C2街廓，面積約1.092公頃，其中C1區域，除古蹟本體外，其他區域目前為公園與地下停車場。歷經多年努力，保存糖倉古蹟且無償取得公園土地，文化局續爭取中央擴大內需修繕經費。修復三棟糖倉古蹟，臺北製糖所文化園區開園營運以來，園區內3棟市定古蹟臺糖倉庫，分別規劃作為糖業文化展示館(糖廍Ａ倉)ヽ萬座曉劇場(糖廍Ｂ倉)與臺糖公司提供民間單位進駐使用(糖廍Ｃ倉)。其中由本局自行營運的糖業文化展示館，設置「糖倉開門」常設展，以北區糖業發展為主題，運用參與式工作坊的集體創作產出，包含歷史資料收集、口述歷史訪查、參與創作工作坊，提供藝術家據以完成作品進行設置。並善用社區居民資源，招募志工隊協助展場服務與導覽解說，開園迄今已成為重要的鄉土教育場域。\r\n\r\n糖倉古蹟再利用規劃\r\nA倉規劃「糖倉開門」糖業文化特展，彰顯糖倉保存意義。介紹台北糖廠的歷史故事及城西產業發展軌跡。以及糖藝教室，開放作為文化、多元社區文化活動空間使用。文化局自管，免費開放參觀。\r\n\r\n糖廍Ｂ倉由曉劇場入駐，透過自辦節目、專業策展同時開放演藝團隊租借使用，以萬華為據點培養在地觀眾並與學校、社會團體合作推廣表演藝術；並藉由舉辦艋舺國際舞蹈節、曉劇場藝術進駐計畫等資源連結國內外網絡平台，使臺北製糖所文化園區展現豐富多元的表演藝術生態。\r\n\r\n(資料來源：臺北市文化局)",
    "open_time": "",
    "zipcode": "108",
    "distric": "萬華區",
    "address": "108 臺北市萬華區大理街132之10號",
    "tel": "+886-2-23067975",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.0332,
    "elong": 121.49506,
    "official_site": "",
    "facebook": "",
    "ticket": "免費參觀。\r\n文化局自管，採北投溫泉博物館模式以公民共治管理方式共組A倉義務經營管理委員會，免費開放參觀。",
    "remind": "周一休園\r\n每周二至日上午10：00至下午5：00，如有團體導覽需求，請先電洽（02）2720-8889分機3523 江小姐，以協助安排導覽人員。",
    "staytime": "",
    "modified": "2024-12-23 17:44:35 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/218",
    "category": [
      {
        "id": 13,
        "name": "歷史建築"
      },
      {
        "id": 15,
        "name": "藝文館所"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/64617",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64618",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64619",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64622",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64623",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64625",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64627",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64629",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64612",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64614",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64616",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1810,
    "name": "龍山文創基地",
    "name_zh": null,
    "open_status": 1,
    "introduction": "體驗式學習行文創基地\r\n\r\n萬華本身具豐富內涵與文化，無論是文字、視覺、聲音、表演、工藝甚至氣味與食物等，在在散發獨特的風貌，龍山文創基地以「培養在地設計師、藝術家、創作者」為主軸，發展在地品牌，以導覽、藝文表演、互動工作坊等讓民眾參與及體驗，讓旅客於此體驗，發掘萬華的文化與文創能量。\r\n\r\n從B2認識艋舺美與善\r\n\r\n重新塑造目前龍山文創基地給人的既定形象，從文創品、飲食、街景與服務皆彰顯萬華在地美與善的形象與特色，並將過去常民生活展示於此，讓到萬華的旅客以此為出發點，進而認識艋舺。",
    "open_time": "週二至週日 11:00 - 21:00　\r\n週一 休館日\r\n*遇國定假日或連續假日延後一日休館",
    "zipcode": "108",
    "distric": "萬華區",
    "address": "108 臺北市萬華區西園路一段145號B2 龍山寺地下街B2(龍山寺捷運站1號出口)",
    "tel": "+886-2-23021598",
    "fax": "",
    "email": "monga.longshan.b2@gmail.com",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.03607428455674,
    "elong": 121.49962395429611,
    "official_site": "https://longshan-b2.taipei/home/zh-tw",
    "facebook": "https://www.facebook.com/mongaB2/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-12-22 05:02:30 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1810",
    "category": [
      {
        "id": 15,
        "name": "藝文館所"
      }
    ],
    "target": [],
    "service": [],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/176830",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176831",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176832",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176833",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176834",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176835",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176837",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176838",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176839",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176840",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176841",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176842",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176843",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176844",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176826",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176827",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176828",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176829",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 23,
    "name": "國立中正紀念堂",
    "name_zh": null,
    "open_status": 1,
    "introduction": "中正紀念堂是為了紀念中華民國第一任總統蔣介石，他於1975年逝世，次年行政院就破土開建中正紀念堂，設計師是設計圓山大飯店的楊卓成。\r\n\r\n紀念堂原址是陸軍總部，當時是臺北市區內最大的軍區，據說從大陸運過來的黃金，就曾經存放在這個地方。紀念堂採用的藍白兩色，是國旗上面主要的顏色，紀念堂頂部天穹的裝飾是青天白日12道光芒，銅像朝西面對總統府和中國大陸，其中都有特殊的意義。隨著民主演進思想開放，紀念堂前的廣場已成了民主運動的集會場。\r\n\r\n位於中正紀念堂左右兩側的國家音樂廳與國家戲劇院。戲劇院為戲劇、舞蹈等表演活動的場地，經常舉辦大型的表演活動，包括京劇、戲劇、兒童節目等；音樂廳是臺灣最具水準的音樂展演空間，經常舉辦室內樂，交響樂等大型的音樂活動。而兩廳院前廣場也會不定時舉辦戲劇、音樂活動，吸引眾多遊客前往欣賞。\r\n\r\n白牆藍瓦，70公尺高聳立在紀念公園的中央，不論從哪個角度看過去，都很宏偉。國外觀光客來到臺灣，不論行程如何排，都一定會到這裡來參觀一下。紀念堂的下方有陳列和展覽，也有紀念品販售。\r\n",
    "open_time": "紀念堂開放時間：am09:00-pm06:00（星期一不休館）\r\n紀念公園開放時間：am05:00-pm12:00\r\n(休館日：除年度機電保養日、二二八紀念日、春節除夕及大年初一休館外，幾乎全年不休館)",
    "zipcode": "100",
    "distric": "中正區",
    "address": "100 臺北市中正區中山南路21號",
    "tel": "+886-2-23431100",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.03619,
    "elong": 121.51868,
    "official_site": "http://www.cksmh.gov.tw/",
    "facebook": "https://www.facebook.com/cksmhfb/?locale=zh_TW",
    "ticket": "",
    "remind": "升降旗時間：\r\n夏令時間：4/1~9/30\r\n*升旗：6:00AM    降旗：6:10 PM\r\n冬令時間：10/1~3/31\r\n*升旗：6:30AM    降旗：5:10 PM\r\n \r\n※國軍儀隊禮兵巡查及訓練展示（自113年7月15日實施)：\r\n1.每日上午9點至下午5點，每逢整點實施1次，每天9次(每次約15分鐘)：\r\n上午：9:00、10:00、11:00、12:00\r\n下午：1:00、2:00、3:00、4:00、5:00\r\n2.訓練展示地點：主堂體戶外正面階梯下方之民主大道。\r\n3.如遇雨天則不實施。",
    "staytime": "",
    "modified": "2024-12-22 05:02:04 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/23",
    "category": [
      {
        "id": 13,
        "name": "歷史建築"
      },
      {
        "id": 15,
        "name": "藝文館所"
      },
      {
        "id": 25,
        "name": "無障礙旅遊推薦景點"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      },
      {
        "id": 62,
        "name": "校外教學"
      },
      {
        "id": 65,
        "name": "賞鳥族"
      }
    ],
    "service": [
      {
        "id": 141,
        "name": "無障礙設施"
      },
      {
        "id": 143,
        "name": "場地租用"
      },
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      },
      {
        "id": 146,
        "name": "公廁"
      },
      {
        "id": 147,
        "name": "停車場"
      },
      {
        "id": 148,
        "name": "失物招領"
      },
      {
        "id": 149,
        "name": "廣播服務"
      },
      {
        "id": 150,
        "name": "寄物櫃"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/222951",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/222952",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/222953",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/222954",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/222955",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/222956",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/222957",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/222958",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/222959",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/222960",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1580,
    "name": "龍山寺地下街",
    "name_zh": null,
    "open_status": 1,
    "introduction": "龍山寺地下街商場位處廣州街、西園路、和平西路及三水街間之艋舺公園正下方，係臺北市首座地下二層之地下街商場。\r\n\r\n龍山寺地下街位於萬華區龍山寺對面，艋舺公園正下方，在地面層公園有7個出入口可通商場，商場有出入口與捷運龍山寺站相互連通，藉由流暢方便的行走動線，民眾可由捷運站直接進入經由商場通往龍山寺商圈。",
    "open_time": "上午11時至下午9時30分",
    "zipcode": "108",
    "distric": "萬華區",
    "address": "108 臺北市萬華區西園路一段145號B1、B2",
    "tel": "+886-2-23065988#24",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.03607,
    "elong": 121.49989,
    "official_site": "https://www.tcma.gov.taipei/News_Content.aspx?n=0D4E37187A7154F0&sms=42464882E656FEC0&s=E1D54780FDD052EC",
    "facebook": "",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-12-22 05:01:51 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1580",
    "category": [
      {
        "id": 24,
        "name": "主題商街"
      }
    ],
    "target": [],
    "service": [],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/176806",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176807",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176808",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176809",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176810",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176811",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176812",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176813",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/176814",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 101,
    "name": "圓山大飯店",
    "name_zh": null,
    "open_status": 1,
    "introduction": "圓山大飯店創立於民國41年（西元1952年），十四層宮殿式大樓，巍峨高聳於圓山之腰，前臨基隆河、後倚陽明山、東望松山、西眺淡水。飯店紅柱金瓦氣勢宏偉的外觀，襯托富麗堂皇的古典氣氛，傳達了中國的藝術之美，是台北市的代表地標之ㄧ，聞名世界。是中外人士觀光住宿或商務會議的最佳選擇。\r\n\r\n圓山的美，在於中國式的雄偉建築和富麗堂皇的古典氣派，圓山的神秘，在於傳奇性的歷史色彩和祕道傳說，圓山的寧靜清幽，在於它的遠離塵囂和鄰近閒情雅緻的風景線。\r\n\r\n百年金龍\r\n原本只是設置於台灣神社前的銅龍，在圓山飯店增建廳舍時特別保留原貌，完美呈現於金龍餐廳中，並在七十六年整修時，鍍上24K金，特別的是這條蟠龍只有三爪，和中國傳統的四爪或五爪龍不同。\r\n\r\n梅花藻井\r\n圓山大飯店大廳中央天花板有一口梅花造型的藻井，梅花中央五條金龍環繞一顆龍珠，意味「五福臨門」：藻井內周圍雖有23條金龍、16隻鳳凰，取其「3」諧音「升」意指步步高升，「16」伴隨大梅花「發」，則有一路發之意，梅花藻井象徵龍鳳呈祥，意義深遠。\r\n\r\n飛簷斗拱\r\n屋頂的飛簷與斗拱，道出中國的古老文明。垂脊上方一排蹲獸，盤據在挑出的飛簷之上，在正脊、垂脊間安置的鴟尾，是一種瓦製的獸型飾物；而屋頂下方，華麗但精緻有力的斗拱結構，這是中國建築最令人稱奇的堂奧。大廳落地玻璃門圓山大飯店正門的大型落地玻璃窗，典雅端正，但仔細觀察門上所繪紋路，就會發現其中暗藏六個古字「中華民國萬歲」，回溯重建圓山飯店時的時空背景，可以看出時空背景的轉換，及設計師創作時的巧思。\r\n\r\n石敢當\r\n牌樓前石階入口所豎立的大石塊石碑上，刻有于右任先生親筆所題的草書，龍飛鳳舞，筆力遒勁的四個大字『劍潭勝跡』，經過多方查證，這四個字表達出整個圓山就是聖地的意思，也因為如此，維繫了圓山百年人氣不墜的崇高地位。",
    "open_time": "全天開放",
    "zipcode": "104",
    "distric": "中山區",
    "address": "104 臺北市中山區中山北路四段1號",
    "tel": "+886-2-28868888",
    "fax": "+886-2-28852885",
    "email": "grand@grand-hotel.org",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.07861,
    "elong": 121.52629,
    "official_site": "https://www.grand-hotel.org/TW/index.aspx",
    "facebook": "",
    "ticket": "",
    "remind": "※本景點為【士林北藝-無圍牆博物館】景點範圍",
    "staytime": "",
    "modified": "2024-12-22 05:01:41 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/101",
    "category": [
      {
        "id": 13,
        "name": "歷史建築"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      }
    ],
    "service": [
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 146,
        "name": "公廁"
      },
      {
        "id": 147,
        "name": "停車場"
      },
      {
        "id": 151,
        "name": "住宿服務"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/64181",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64182",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182763",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182765",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182766",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182768",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1536,
    "name": "士林觀光夜市",
    "name_zh": null,
    "open_status": 1,
    "introduction": "士林夜市是臺北市範圍最大的夜市，也是國外觀光客造訪臺北必遊的觀光夜市。鄰近捷運劍潭站，佔地十分寬廣，可分為兩個主要範圍，一個是傳統陽明戲院周邊的街道，包括大南路慈諴宮一帶；另一邊則是基河路101號重新營運的士林市場。\r\n\r\n來逛夜市的人大都以美食與購物為主，這裡有各式各樣新奇好玩的商品與美食，吸引大批的人潮。這樣特殊的夜市文化，是臺北夜生活不可缺少的一部份。\r\n\r\n最為著名的莫過於多樣的美食小吃，可說是臺灣美食大集合，像金黃色的超大雞排，香噴噴的「豪大大雞排」外脆內嫩； 吃上癮的「串烤」；香氣四溢的「士林大香腸」；會噴湯汁的「上海生煎包」；包著滿滿紅燒肉、蛋酥的「潤餅捲」；甜甜鹹鹹的「大餅包小餅」嚼勁十足；熱騰騰的「藥膳排骨湯」補補身子；特有的生炒花枝、青蛙下蛋、三兄弟豆花、蔥油餅、涼麵等，都是令人直吞口水的美食小吃，讓人駐足不前、流連忘返。",
    "open_time": "",
    "zipcode": "111",
    "distric": "士林區",
    "address": "111 臺北市士林區大東路、大南路、文林路、基河路間與週邊",
    "tel": "+886-2-25505220",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.08787,
    "elong": 121.52408,
    "official_site": "https://www.tcma.gov.taipei/News_Content.aspx?n=FAC14AD2DE4E01A4&sms=32F7BA052C5CA548&s=AF2DC775A3AA076A",
    "facebook": "",
    "ticket": "",
    "remind": "※本景點為【士林北藝-無圍牆博物館】景點範圍\r\n\r\n※友善廁所：\r\n\r\n1.瑞成棉被店\r\n開放時間：11:00-23:30\r\n\r\n2.ISPO+士林旗艦店\r\n開放時間：14:00-22:00\r\n\r\n3.臺北市農會陽明堆集場\r\n開放時間：10:00-22:00\r\n\r\n4.台北市士林夜市商圈聯合會\r\n開放時間：17:00-23:00\r\n\r\n5.統一超商(7-11)文林門市\r\n開放時間：24小時\r\n\r\n6.士林市場\r\n開放時間：24小時\r\n\r\n友善廁所資料來源：臺北市市場處",
    "staytime": "",
    "modified": "2024-12-20 16:35:09 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1536",
    "category": [
      {
        "id": 23,
        "name": "觀光夜市"
      }
    ],
    "target": [],
    "service": [],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/221601",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221602",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221603",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221604",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221605",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221606",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221607",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221608",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221609",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221610",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 61,
    "name": "大龍峒保安宮",
    "name_zh": null,
    "open_status": 1,
    "introduction": "大龍峒保安宮，肇建於1742年，1805年重建，主祀保生大帝，俗稱「大浪泵宮」或「大道公廟」，為國定古蹟。每年農曆3月15日，為慶祝保生大帝聖誕，特別舉辦為期2個月，結合宗教祭祀、民俗技藝、古蹟導覽、藝文研習、美學競賽、家姓戲、遶境踩街、過火、健康關懷與學術研討會的「保生文化祭」活動；是北臺灣最盛大、最熱鬧，人氣最旺的廟會活動，也使大龍峒成為北臺灣重要的文化重鎮。\r\n\r\n\r\n大龍峒保安宮廟宇的裝飾藝術，如石獅、龍柱、花鳥、剪黏、泥塑、交趾陶、木雕、彩繪壁畫等，這些遠近馳名的藝術瑰寶，每一件都具有歷史及藝術的價值。保安宮在興建時，就聘請郭塔及陳應彬兩位匠師，各自創作木雕，這種良性競爭就是當時流行的對場作。因此欣賞保安宮的裝飾藝術時，可同時欣賞左右兩邊，不同匠師的作品。正殿迴廊的7幅壁畫，是國寶級彩繪大師潘麗水的作品，吸引國內外的遊客流連忘返，讚嘆不已。\r\n\r\n\r\n大龍峒保安宮已從地方宮廟，轉型為集宗教、文化、教育、藝術於一身的廟宇，對於臺北市大同區地方文化的活化，產生深遠的影響。特別是古蹟建築與修復更是深受國內外矚目。保安宮重建以來雖經過多次整修增建，但由於建造年代已久，更遭風吹、日曬、蟲噬，嚴重影響建築本體，不復昔日丰采，更有安全之虞。為了維護文化資產，1995年，保安宮進行重建以來規模最大的修復工程，保安宮自力籌措全部經費，並自行統籌、監造，成為全國首宗民間籌資主導古蹟修復的案例；修復工程更於2003年獲得聯合國教科文組織「2003年亞太文化資產保存獎」，並於民國108指定為國定古蹟。\r\n\r\n\r\n四十四坎街\r\n\r\n\r\n位於保安宮前以西的哈密街，嘉慶七年(1802)創建，次年落成。當時大隆同王智記、陳蘭記等業戸，合資立「金同成」商號，於本街建造閩南式連棟店鋪南北各二十二間。因河洛話稱店一間為一坎，故稱四十四坎。每間店鋪大小相同，闊一丈七七尺半，縱深各為一進三落帶過水(天井)，而亭仔脚(騎樓)相互連通，形成整齊劃一之街面。\r\n\r\n\r\n東西各設有一隘門以防盗,東書「小邑絃歌」，西書「大隆同」。其後因市面繁榮，又逐漸往西發展至「内土地公」(和安宮)，因此，原四十四坎街稱為「頂街」，新的街肆稱為「下街」。\r\n\r\n\r\n延伸閱讀\r\n\r\n四十四坎街周邊介紹&mdash;台北畫刊615期(大龍峒街區散策 找尋老街巷裡的燦爛時光)",
    "open_time": "每日06:00~22:00",
    "zipcode": "103",
    "distric": "大同區",
    "address": "103 臺北市大同區哈密街61號",
    "tel": "+886-2-25951676",
    "fax": "+886-2-25982576",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.07321,
    "elong": 121.51554,
    "official_site": "http://www.baoan.org.tw/",
    "facebook": "https://www.facebook.com/baoantw/",
    "ticket": "",
    "remind": "導覽時間\r\n1. 非假日時段：請利用網路或電洽大龍峒保安宮完成預約，電話+886-2-2595-1676轉圖書館。\r\n受理導覽服務時間：上午9：00~11：30，下午13：30~16：30\r\n*請詳填導覽時間：解說時間以30分或1小時為1場次　\r\n\r\n2. 假日時段：大龍峒保安宮在每週六、日固定安排史蹟解說老師免費為您進行導覽服務，無需預約。\r\n共分兩時段，上午9:00~11:30，下午2:00~4:30。\r\n\r\n註：人數達五人之團體，如欲參加假日時段導覽，敬請預先來電或完成線上預約，以利本宮安排史蹟解說老師，以維護您的導覽品質。\r\n\r\n預約須知\r\n1.請於導覽前二週完成預約。\r\n2.請詳填您的聯絡資料於官網預約表單，表單送出後，我們將主動與您聯絡確認並儘快安排解說老師。確定老師後我們也將以電子郵件及電話通知您。\r\n3.導覽二天前我們將再致電與您確認。若您的行程有所變動，請務必以電話知會我們。\r\n4.導覽雖為免費服務性質，請勿完成導覽約定後無故缺席，敬請大家共同珍惜資源。",
    "staytime": "",
    "modified": "2024-12-19 11:47:57 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/61",
    "category": [
      {
        "id": 13,
        "name": "歷史建築"
      },
      {
        "id": 14,
        "name": "宗教信仰"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      }
    ],
    "service": [
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/63868",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63869",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63871",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63875",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63880",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 2666,
    "name": "佛光山台北道場",
    "name_zh": null,
    "open_status": 1,
    "introduction": "佛光山台北道場座落在台北松山火車站旁，是現代佛教弘法道場的新指標。每層功能多元化，有佛堂、禪堂、齋堂、會議廳、佛光緣美術館等。",
    "open_time": "",
    "zipcode": "110",
    "distric": "信義區",
    "address": "110 臺北市信義區松隆路327號",
    "tel": "+886-2-27620112轉2407",
    "fax": "",
    "email": "tpevihara@ecp.fgs.org.tw",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.048453061626361,
    "elong": 121.5791192650795,
    "official_site": "https://www.fgs.org.tw/tpevihara/",
    "facebook": "https://www.facebook.com/foguangshan/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-12-19 10:16:17 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/2666",
    "category": [
      {
        "id": 14,
        "name": "宗教信仰"
      }
    ],
    "target": [],
    "service": [],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/373623",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1560,
    "name": "寧夏觀光夜市",
    "name_zh": null,
    "open_status": 1,
    "introduction": "以「千歲宴」打響國際名聲，且獲得眾多美食雜誌和網路爭相報導的寧夏觀光夜市，包含民生西路、南京西路與重慶北路中間的路段，以臺灣傳統小吃為主，其中以大同區圓環附近令人懷念的古早味，最讓老臺北人津津樂道。\r\n\r\n夜市首先將人車分道，方便民眾吃飯與購物，貼心的服務，而隨著科技進步，許多攤販及店家也開始轉型，能夠使用悠遊卡及行動支付，遊客們帶著手機就能吃遍夜市美食。\r\n\r\n知名的「千歲宴」由2010年開始舉辦，名稱由來是因寧夏夜市攤販大多都已超過50年，加起來超過千歲，故取名為千歲宴。如要一嚐寧夏夜市美食「千歲宴」可電話預約或至官網預訂，建議人數7-10人，利用辦桌合菜的方式，讓遊客可以輕鬆享用20道臺灣在地小吃。\r\n\r\n寧夏夜市的小吃充滿濃濃的臺灣味，香噴噴的滷肉飯和雞肉飯、清甜鮮美的蚵仔煎和大腸蚵仔麵線、現炒入味的沙茶牛肉、滋補養顏的豬肝湯、來自府城的臺南碗粿、吳郭魚湯、蛋黃芋餅等等，都讓人忍不住食指大動。夜市另一邊的攤販，以新奇好玩的雜貨和玩具為主，販售的商品頗具流行感，價格不貴，在飽嚐美食之餘，不妨也來走走逛逛。",
    "open_time": "每日18:00~24:00",
    "zipcode": "103",
    "distric": "大同區",
    "address": "103 臺北市大同區寧夏路(位於南京西路與民生西路間)",
    "tel": "+886-2-25505220",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.056681195005559,
    "elong": 121.51536382734776,
    "official_site": "https://www.tcma.gov.taipei/News_Content.aspx?n=FAC14AD2DE4E01A4&sms=32F7BA052C5CA548&s=0C985156C3DB7335",
    "facebook": "https://www.facebook.com/pages/category/Food-Stand/%E5%AF%A7%E5%A4%8F%E8%A7%80%E5%85%89%E5%A4%9C%E5%B8%82-170921516284146/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-12-15 05:02:01 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1560",
    "category": [
      {
        "id": 23,
        "name": "觀光夜市"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/221821",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221822",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221813",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221814",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221815",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221816",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221817",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221818",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221819",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221820",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 394,
    "name": "三創生活",
    "name_zh": null,
    "open_status": 1,
    "introduction": "「三創生活」坐落於市民大道三段與金山北路交界，佔地2,687坪，建築外觀呈現前瞻氣勢，立面設計詮釋產業特性，結合鄰近綠帶的視野，實踐自然與科技共生的設計理念。\r\n\r\n空間規劃導入科技生活、潮流影音、子親娛樂、動漫文化、探索體驗、創作育成及藝術展演等多元概念，結合園區內隨處可見的數位視屏，讓影像的多元樣貌，觸動對生活的無限想像。\r\n\r\n園區以人為核心，打造實踐未來的生活平台。期待能藉由互動、分享、探索、學習與創作，帶領大眾重新建構科技、文化與生活的連結。\r\n\r\n園區共12層樓，緊鄰光華數位新天地，提供選購3C產品的更多選擇。\r\n\r\n\r\n\r\n",
    "open_time": "週日至週四 11:00-21:30／週五至週六及國定假日前夕 11:00-22:00",
    "zipcode": "100",
    "distric": "中正區",
    "address": "100 臺北市中正區市民大道三段2號",
    "tel": "+886-809-093300",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.04535,
    "elong": 121.53111,
    "official_site": "https://www.syntrend.com.tw/",
    "facebook": "https://www.facebook.com/syntrend/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-12-15 05:01:53 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/394",
    "category": [
      {
        "id": 19,
        "name": "親子共遊"
      },
      {
        "id": 24,
        "name": "主題商街"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      },
      {
        "id": 146,
        "name": "公廁"
      },
      {
        "id": 147,
        "name": "停車場"
      },
      {
        "id": 148,
        "name": "失物招領"
      },
      {
        "id": 149,
        "name": "廣播服務"
      },
      {
        "id": 150,
        "name": "寄物櫃"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/65876",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65877",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65879",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65880",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65883",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65884",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65885",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65886",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65891",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65874",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65875",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1794,
    "name": "MAJI集食行樂_圓山花博爭豔館",
    "name_zh": null,
    "open_status": 1,
    "introduction": "「MAJI2集食行樂」鄰近台北市立美術館，隱身在台北花博公園圓山園區一角，於2013年6月正式營運。由歌手哈林庾澄慶與知名設計師葉裕清精心規劃，在大自然中運用貨櫃、原木穀倉，巧妙包覆住美食、原創商品、音樂、藝術等元素，打造出具有異國氛圍的生活市集空間：一座城市遊樂園。\r\n\r\nMAJI2包含六大區域：神農市場、寰宇小吃街、創意市集、異國美食餐廳、特色商店街及多功能展演空間。\r\n\r\n【神農市場】\r\n為愛吃愛做菜的人把好吃、安心、天然、無毒食材通通集合再一起的神農市場，精心挑選全國各精緻小農的作物產品，其中為數不少是獲得農業部神農獎章的好農商品，以及一般超市難見的優質小品牌調味醬料，並引進南門市場的傳統食材，與帶入華人口味的熟菜食堂，讓顧客可以直接帶回家。\r\n\r\n【寰宇小吃街】\r\n以貨櫃排列，搭配復古桌椅，營造出獨特用餐空間。無論是臺灣味小吃，還是東西方美食匯串，都在異國小吃街。\r\n\r\n【創意市集】\r\n創意市集聚集手工皮革包、原創服飾、特色飾品，以及各類生活設計小物，讓你目不暇給，隨處發現驚喜。\r\n\r\n(部分資料來源：財團法人臺北市會展產業發展基金會)",
    "open_time": "*神農市場*\r\n星期一～星期五\r\nPM12:00-PM19:30\r\n\r\n*寰宇小吃攤*\r\n星期一~星期四 11:30~20:30\r\n星期五 11:30~21:30\r\n星期六~星期日 10:30~21:30\r\n(含例假日)",
    "zipcode": "104",
    "distric": "中山區",
    "address": "104 臺北市中山區玉門街1號",
    "tel": "+886-2-25977112",
    "fax": "",
    "email": "marketing@majisquare.com",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.06966,
    "elong": 121.52173,
    "official_site": "http://www.majisquare.com/",
    "facebook": "https://www.facebook.com/majisquare/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-12-15 05:01:36 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1794",
    "category": [
      {
        "id": 15,
        "name": "藝文館所"
      },
      {
        "id": 18,
        "name": "公共藝術"
      },
      {
        "id": 24,
        "name": "主題商街"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 145,
        "name": "購物"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/184759",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184760",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184761",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184762",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184763",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184764",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184765",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184766",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184767",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184768",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184755",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184756",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184757",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/184758",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1591,
    "name": "台北地下街",
    "name_zh": null,
    "open_status": 1,
    "introduction": "台北地下街位於臺北市中正區，屬於臺北車站地下街系統的重要組成部分，連接臺北車站、臺北捷運以及周邊商圈，是臺灣具有相當規模的地下街之一。作為臺北市的交通樞紐，它不僅是旅客的必經之地，還是集購物、休閒與娛樂於一身的多功能場所，深受遊客們喜愛。\r\n\r\n地下街的店鋪琳瑯滿目，涵蓋時尚服飾、電子產品、文創商品、手工藝品等多樣商品。對於動漫迷來說，台北地下街更是必訪聖地，擁有眾多動漫周邊專賣店，吸引大批粉絲前來尋找珍貴的收藏品或最新的動漫周邊商品。\r\n\r\n每年八月，台北地下街會舉辦「浴衣祭」，帶來濃厚的日本風情。場地特別布置成日式主題場景，讓遊客可以體驗穿浴衣的樂趣，還有各式日式元素可供拍照打卡，成為夏季人氣極高的活動之一。\r\n\r\n除了購物，台北地下街也設有豐富的娛樂設施，包括遊戲機台和扭蛋機等，成為親子同遊的理想場所。",
    "open_time": "星期一~五  11:00-21:30\r\n星期六~日  11:00-22:00",
    "zipcode": "100",
    "distric": "中正區",
    "address": "100 臺北市中正區市民大道一段100號B1",
    "tel": "+886-2-25594566",
    "fax": "",
    "email": "welcometcm@gmail.com",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.04956,
    "elong": 121.51389,
    "official_site": "http://www.taipeimall.com.tw/zh-TW",
    "facebook": "https://www.facebook.com/TaipeiCityMall/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-29 16:10:57 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1591",
    "category": [
      {
        "id": 24,
        "name": "主題商街"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 143,
        "name": "場地租用"
      },
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      },
      {
        "id": 146,
        "name": "公廁"
      },
      {
        "id": 147,
        "name": "停車場"
      },
      {
        "id": 148,
        "name": "失物招領"
      },
      {
        "id": 149,
        "name": "廣播服務"
      },
      {
        "id": 150,
        "name": "寄物櫃"
      }
    ],
    "friendly": [],
    "images": [],
    "files": [],
    "links": []
  },
  {
    "id": 404,
    "name": "法鼓山_農禪寺",
    "name_zh": null,
    "open_status": 1,
    "introduction": "法鼓山是由東初老人創建的「中華佛教文化館」與「農禪寺」發展而來。1955年，東初老人於北投興建中華佛教文化館，以推動佛教文化、開辦冬令救濟。1971年，並帶領弟子於關渡平原整地開墾，於1975年一棟農舍落成啟用，東初老人以「禪修為主，務農為生」將此處命名為「農禪寺」。\r\n\r\n1977年，東初老人無疾坐化，囑付聖嚴法師繼承法業，接任中華佛教文化館、農禪寺住持，致力弘揚佛法與禪修推廣工作。由於信眾日增，為了要尋找一個具有長久性、安定性和未來性的道場建築用地，1989年7月，聖嚴法師正式宣佈將金山的新道場命名為「法鼓山」，並為道場未來的建設勾勒出清晰的藍圖─發揮教育、文化、弘法的功能，為一般信眾提供一個修行佛法、淨化身心的良好環境，運用佛法來安定人心、安定社會。\r\n(資料來源：法鼓山_農禪寺 官方網站)\r\n\r\n建築特色\r\n法鼓山農禪寺的建築融合了傳統禪宗寺院的元素與現代設計，並巧妙地與周圍的自然環境相融合。整體建築風格簡潔、樸實，注重空間的開放性與自然光的引入，旨在創造一個和諧、寧靜的修行與生活空間。",
    "open_time": "",
    "zipcode": "112",
    "distric": "北投區",
    "address": "112 臺北市北投區大業路65巷89號",
    "tel": "+886-2-28933161",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.12255,
    "elong": 121.49538,
    "official_site": "https://ncm.ddm.org.tw/",
    "facebook": "https://www.facebook.com/ncm.ddm",
    "ticket": "",
    "remind": "農禪寺為清靜的佛教寺院，入寺遊客務必遵守入寺須知。",
    "staytime": "",
    "modified": "2024-11-29 16:00:34 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/404",
    "category": [
      {
        "id": 14,
        "name": "宗教信仰"
      },
      {
        "id": 15,
        "name": "藝文館所"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/492022",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492023",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65950",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65951",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65952",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65955",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/65958",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492014",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492015",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492016",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492017",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492018",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492019",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492020",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492021",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": [
      {
        "src": "https://ncm.ddm.org.tw/default-ncm/xchome?xsmsid=0K316649827104701077",
        "subject": "預約參訪"
      },
      {
        "src": "https://ncm.ddm.org.tw/default-ncm/xchome?xsmsid=0K316649383480509078",
        "subject": "入寺須知"
      }
    ]
  },
  {
    "id": 1585,
    "name": "永樂布業商場_永樂市場",
    "name_zh": null,
    "open_status": 1,
    "introduction": "永樂布業商場，坐落於歷史悠久的迪化街，是臺北販售布料與手作材料集中地。商場以其獨具特色的紅磚牆為建築風格，展現濃厚的復古氛圍，見證大稻埕昔日繁華的布業發展。如今則轉型為文創與時尚的交流中心，保留了傳統與創新的融合氛圍。\r\n\r\n一樓設有生鮮超市，提供新鮮的蔬果、肉品以及各式各樣的本地食材，滿足你的需求。此外，還有小吃攤位匯聚充滿臺灣味的美食，包括香濃的油飯、手工包子及現切生魚片，讓人食慾大開！\r\n\r\n二樓至三樓是布料愛好者的天堂，這裡提供棉布、絲綢、亞麻等多種布料，無論是衣物製作、居家裝飾還是創意手作，都能找到理想材料。除了布料，還有販售裁縫工具、花邊、拉鍊等的專門店鋪，並提供客製化服務，是設計師及手作愛好者必訪之地。\r\n\r\n四樓為時尚實驗基地，展示著新銳設計師的創作，成為時尚愛好者交流靈感的重要平台。在這裡，你能欣賞到設計師打造的獨特服飾，也能參與相關的工作坊或活動，親身感受時尚文化的魅力。\r\n\r\n八樓與九樓是「大稻埕戲苑」的所在地，這裡展出傳統戲曲舞台道具、布袋戲偶與皮影戲藏品，讓人深入了解臺灣的傳統藝術。戲苑內還設有小型劇場，定期舉辦戲劇演出、音樂會及文化講座，是欣賞臺灣傳統戲曲文化的絕佳場域。\r\n\r\n永樂布業商場不僅是一個購物地標，還結合了美食與文化體驗。無論是漫步於迪化街的懷舊氣氛中，還是深入探索這座建築內的多元魅力，都能讓你感受到大稻埕獨有的迷人風情。",
    "open_time": "*一樓(永樂市場)：08:00-16:00，週一休市\r\n*二三樓(永樂布業商場)：9:00-18:00，週日休市",
    "zipcode": "103",
    "distric": "大同區",
    "address": "103 臺北市大同區迪化街一段21號",
    "tel": "+886-2-25588846",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.05505,
    "elong": 121.5105,
    "official_site": "",
    "facebook": "",
    "ticket": "",
    "remind": "*一樓(永樂市場)：08:00-16:00，週一休市\r\n*二三樓(永樂布業商場)：9:00-18:00，週日休市",
    "staytime": "",
    "modified": "2024-11-29 15:44:31 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1585",
    "category": [
      {
        "id": 24,
        "name": "主題商街"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/491967",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491968",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491969",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491970",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491971",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491972",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491963",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491964",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491965",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491966",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1981,
    "name": "東區商圈",
    "name_zh": null,
    "open_status": 1,
    "introduction": "東區商圈是臺北市的時尚與夜生活中心，以「五夜城」概念，提供多元的夜間活動。擁有便捷交通、豐富商店與娛樂設施，這裡融合餐廳、酒吧和精品店，無論白天還是夜晚，都展現出獨特的都市魅力。\r\n\r\n五夜城的多樣魅力\r\n&bull; 夜食：東區的巷弄內隱藏著無數創意料理店，從傳統的台灣小吃到世界各地的國際美食，滿足你各種口味需求。\r\n\r\n&bull; 夜遊：隨著夜色降臨，東區的商店和咖啡館依然熱鬧，讓你邊逛邊享受城市的夜景，這裡還有眾多精品酒店，無論是遊客還是當地人，都能在這裡度過一個難忘的夜晚。\r\n\r\n&bull; 夜享：對於喜愛夜生活的人來說，東區的酒吧和夜店在週末格外熱鬧，充滿年輕人和上班族的身影，這裡的夜生活充滿了多元和活力，適合放鬆心情，享受音樂與舞蹈的節奏。\r\n\r\n&bull; 夜時尚：東區匯聚了國際品牌和高端精品，無論是設計師品牌、限量商品，還是新興獨立品牌，都是時尚愛好者的購物天堂。\r\n\r\n&bull; 夜讀：對於愛好文藝的人，東區也有許多充滿藝術氛圍的酒吧和咖啡館，為你的夜晚增添一份靜謐與藝術氣息。\r\n\r\n東區商圈不僅是時尚購物的熱點，也是美食和夜生活的重鎮，無論白天還是夜晚，都能在這裡找到屬於自己的樂趣與驚喜。從時尚的街頭巷尾到充滿活力的夜晚場景，這裡是臺北最具魅力的地區之一，是每個來訪者都不容錯過的熱點。",
    "open_time": "約10：00~22：00 依各商家而定",
    "zipcode": "106",
    "distric": "大安區",
    "address": "106 臺北市大安區東區商圈",
    "tel": "+886-2-87716300",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.041794824854762,
    "elong": 121.54656797647476,
    "official_site": "https://www.eastdistrictplus.com/?fbclid=IwAR06OUCabbw7vKFk-BFk1tyiA8wo4c3lPL6LjXTEwGhhmmMqa0zQmk_rICU",
    "facebook": "https://www.facebook.com/eastdistrictplus/",
    "ticket": "",
    "remind": "大約為復興南路、市民大道四段、復興南路、仁愛路所圍成之區域",
    "staytime": "",
    "modified": "2024-11-29 15:37:38 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1981",
    "category": [
      {
        "id": 24,
        "name": "主題商街"
      },
      {
        "id": 25,
        "name": "無障礙旅遊推薦景點"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 141,
        "name": "無障礙設施"
      },
      {
        "id": 143,
        "name": "場地租用"
      },
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      },
      {
        "id": 146,
        "name": "公廁"
      },
      {
        "id": 147,
        "name": "停車場"
      },
      {
        "id": 148,
        "name": "失物招領"
      },
      {
        "id": 149,
        "name": "廣播服務"
      },
      {
        "id": 150,
        "name": "寄物櫃"
      },
      {
        "id": 151,
        "name": "住宿服務"
      },
      {
        "id": 152,
        "name": "育嬰服務"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/492044",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492045",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492046",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492047",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492048",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492049",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492050",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492051",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492052",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492053",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1574,
    "name": "台北市建國假日玉市",
    "name_zh": null,
    "open_status": 1,
    "introduction": "建國假日玉市位於建國高架橋下，東南亞具有相當規模的玉石市場之一，也是臺灣玉石收藏家的朝聖地。這裡的前身為光華假日玉市，位於舊光華商場旁，1989年遷至現址後，繼續承載著豐富的文化與商業價值。\r\n\r\n市場內展售的商品種類繁多，包括具有歷史價值的中國古玉、晶瑩剔透的水晶、出自臺灣東海岸的特色臺灣玉，以及宗教文物和裝飾品。還有廣受歡迎的珍珠、瑪瑙等珠寶飾品，讓遊客無論是購物還是欣賞，都能滿足需求。\r\n\r\n建國假日玉市就像一座開放式的玉石博物館，充滿文化內涵與藝術氛圍。每件玉器和文物背後都有獨特的故事，不僅展示玉石工藝的精湛技術，還傳遞東方文化中對玉的深厚情感與象徵意義。\r\n\r\n週末來到建國假日玉市，無論是尋找一件心儀的收藏品，還是僅僅欣賞玉石的細膩之美，這裡都能帶給你一段充實而愉快的文化體驗。如果你熱愛藝術、文物或收藏，這裡是臺北旅遊不可錯過的一站！",
    "open_time": "星期日: 09:00 – 18:00\r\n星期一: 休息\r\n星期二: 休息\r\n星期三: 休息\r\n星期四: 休息\r\n星期五: 休息\r\n星期六: 09:00 – 20:00",
    "zipcode": "106",
    "distric": "大安區",
    "address": "106 臺北市大安區建國南路、仁愛路高架橋下",
    "tel": "+886-2-27085931",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.03836,
    "elong": 121.53788,
    "official_site": "https://www.tcma.gov.taipei/News_Content.aspx?n=FAC14AD2DE4E01A4&sms=32F7BA052C5CA548&s=0890E203237B99DC",
    "facebook": "https://www.facebook.com/%E5%BB%BA%E5%9C%8B%E5%81%87%E6%97%A5%E8%A7%80%E5%85%89%E7%8E%89%E5%B8%82-347730085634408/",
    "ticket": "",
    "remind": "備註事項：仁愛路至106大安區濟南路段之建國南路高架橋下",
    "staytime": "",
    "modified": "2024-11-29 15:30:44 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1574",
    "category": [
      {
        "id": 24,
        "name": "主題商街"
      }
    ],
    "target": [],
    "service": [],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/491983",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491984",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491985",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491986",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491987",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491988",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491989",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491990",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491991",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491992",
        "subject": "",
        "ext": ".png"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 396,
    "name": "幾米月亮公車",
    "name_zh": null,
    "open_status": 1,
    "introduction": "幾米月亮公車是臺北市一個結合藝術與交通的特色景點，為響應臺北市政府推動的「2016 世界設計之都」計畫，房仲企業與插畫家幾米合作，並以幾米的繪本《月亮忘記了》為主題設計而成，讓人一眼就能感受到濃厚的幾米風格。\r\n\r\n公車的外觀呈現出溫馨的夢幻色彩，車頂上站著一位可愛的藍色小童，舉著微笑的黃月亮，彷彿在安撫每一位乘客的心靈。車廂內則由熊熊司機引領，載著小男孩和圓月，並且裝飾著五顏六色的魔法書與可愛的小角色，營造出濃濃的童話氛圍。\r\n\r\n幾米月亮公車位於臺北101附近，交通便捷，周邊景點繁多，吸引了大量遊客來此參觀。無論白天或夜晚，這輛奇幻的公車都為臺北市增添了一份夢幻與藝術感，成為當地的熱門新景點。\r\n\r\n幾米月亮公車的存在，為臺北市增添了一份藝術與創意，無論是愛好藝術的遊客還是當地居民，都能在這裡找到一份溫暖與心靈的慰藉。",
    "open_time": "每天9：00-21：00，每週一為清潔日不開放",
    "zipcode": "110",
    "distric": "信義區",
    "address": "110 臺北市信義區信義路五段100號",
    "tel": "+886-2-27292000",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.032759456882289,
    "elong": 121.56573504209518,
    "official_site": "",
    "facebook": "",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-29 15:21:17 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/396",
    "category": [
      {
        "id": 15,
        "name": "藝文館所"
      },
      {
        "id": 18,
        "name": "公共藝術"
      },
      {
        "id": 19,
        "name": "親子共遊"
      }
    ],
    "target": [],
    "service": [],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/492055",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492056",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492057",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492058",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492059",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492060",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492061",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492062",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492063",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492054",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1541,
    "name": "迪化街年貨大街",
    "name_zh": null,
    "open_status": 1,
    "introduction": "迪化街位於大稻埕地區，是臺北傳統市場文化的縮影，也是臺灣商業歷史的重要地標。這條街道以南北乾貨、中藥材、布匹與茶葉的批發零售聞名，至今仍保留著傳統市場的熱鬧與人情味。 &nbsp;\r\n\r\n迪化街的建築風格以巴洛克式為主，多數建於清末及日治時期，巧妙地將歐洲華麗設計融入臺灣當地建材，展現獨特的東西合璧美感。街道兩旁的紅磚建築上布滿細緻雕花、優雅拱門與繁複裝飾，讓人彷彿置身於百年前的繁榮市集。 &nbsp;\r\n\r\n農曆新年期間，迪化街更搖身一變成為「年貨大街」。商家沿街設攤，售賣年節必需品，包括糖果零食、伴手禮及年菜食材。紅燈籠高掛，街道充滿喜慶氛圍，熱鬧的叫賣聲與熙來攘往的人群交織成充滿臺灣味的過年場景。 &nbsp;\r\n\r\n即便平日，迪化街仍是吸引人的旅遊景點。傳統建築中穿插著別出心裁的文創小店和咖啡館，成為年輕人流連的潮流熱點。這裡不僅提供古早味的商品與美食，更成為結合古今中外的文化交流平台。 &nbsp;\r\n\r\n無論是為了探索歷史建築，體驗在地市集，還是拍下絕美照片，迪化街都會帶給你豐富多元的感官享受，是臺北旅行的必訪之地！",
    "open_time": "11:00~22:00  (詳細營業時間以各店家公告為主)",
    "zipcode": "103",
    "distric": "大同區",
    "address": "103 臺北市大同區迪化街一段",
    "tel": "+886-935-113-256",
    "fax": "",
    "email": "",
    "months": "01,02,12",
    "nlat": 25.05491,
    "elong": 121.51032,
    "official_site": "",
    "facebook": "https://www.facebook.com/DihuaHerbalStreet/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-29 15:06:48 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1541",
    "category": [
      {
        "id": 24,
        "name": "主題商街"
      }
    ],
    "target": [],
    "service": [],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/182533",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491953",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491954",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491955",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491956",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491957",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491958",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491959",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491960",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491961",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/491962",
        "subject": "",
        "ext": ".png"
      },
      {
        "src": "https://www.travel.taipei/image/182530",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 381,
    "name": "松山奉天宮",
    "name_zh": null,
    "open_status": 1,
    "introduction": "民國42年，松山地方仕紳及耆老溫金波、劉永浩等籌資搭建竹屋，供奉玉皇上帝為主神，並命名「松山奉天宮」。民國48年，永吉路開安宮自雲林褒忠鄉馬鳴山鎮安宮分靈「五年千歲」，因香火鼎盛，地方人士乃共議合併兩宮供奉之神祇，並籌畫於現址擴建。\r\n\r\n松山奉天宮坐落於四獸山中的虎山，緊鄰市政府、信義商圈，遠眺大屯、七星、紗帽、觀音等山峰。四獸山虎山步道位於奉天宮，是市民登山必經之地，人潮匯聚，形成熱鬧的市集，滿足登山客、附近居民衣食等民生需求，居高臨下，壯觀市容、美景盡收眼底。鬧中取靜，是市民爬山休閒、沉澱心靈的好去處。\r\n(資料來源：松山奉天宮 官方網站)",
    "open_time": "",
    "zipcode": "110",
    "distric": "信義區",
    "address": "110 臺北市信義區福德街221巷12號",
    "tel": "+886-2-27279765",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.03739,
    "elong": 121.58467,
    "official_site": "http://www.ftg.org.tw/",
    "facebook": "https://www.facebook.com/ftg27279765?fref=ts",
    "ticket": "",
    "remind": "特殊節日服務時間請來電洽詢。",
    "staytime": "",
    "modified": "2024-11-29 15:05:21 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/381",
    "category": [
      {
        "id": 14,
        "name": "宗教信仰"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/492064",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492065",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492066",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492067",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492068",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492069",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492070",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492071",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492072",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492073",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1590,
    "name": "臺北魚市",
    "name_zh": null,
    "open_status": 1,
    "introduction": "臺北魚市位於臺北濱江果菜市場後方，店內展售多項通過國際認證及國內產銷履歷之水產品，除了有實體門市，也有官方網路購物平台。賣場明亮潔淨，佈滿來自全國各地最新鮮的冷凍魚貨。除配合中央及市政府衛生局不定期抽驗作業外，每月亦針對展售之各項水產品加強提送SGS公證單位檢驗，讓民眾買的安心，吃的放心！\r\n\r\n每逢週六、日上午時段(上午7點開始至完售)，定期於臺北魚市門市外舉辦「假日魚市」活動，在中庭提供來自萬大批發市場的新鮮現撈魚貨，有深受民眾喜愛的臺灣鯛、虱目魚、午仔、金目鱸，或是蝦子、螃蟹、文蛤等琳瑯滿目。現場也提供殺魚處理及包裝的服務，推薦給偏愛「現流」漁貨的消費者。\r\n(資料來源：臺北魚市 官方網站)",
    "open_time": "【台北魚市 營業時間】\r\n周一              上午10：00~下午06：00\r\n周二至周日  上午07：00~晚上08：00",
    "zipcode": "104",
    "distric": "中山區",
    "address": "104 臺北市中山區民族東路410巷2弄20號",
    "tel": "+886-800-021-521",
    "fax": "+886-2-25099484",
    "email": "service.tpfish@gmail.com",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.06667,
    "elong": 121.53673,
    "official_site": "https://e-mart.tpfish.com.tw/",
    "facebook": "https://www.facebook.com/taipeifishmarket/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-29 14:22:14 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1590",
    "category": [
      {
        "id": 24,
        "name": "主題商街"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/492035",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492036",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492037",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492038",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492039",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492040",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492041",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492042",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492043",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492034",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 2168,
    "name": "貓空樟樹步道",
    "name_zh": null,
    "open_status": 1,
    "introduction": "樟樹步道位於臺北貓空地區，前身為重要的保甲路線之一，現在已成為深受遊客喜愛的健行景點。步道規劃平緩且開闊，適合各年齡層的遊客來此健行或休憩。步道兩旁是典型的農村景致，設有相思炭窯、茶園、穀倉等特色景點，讓你在享受大自然的同時，也能體會臺灣傳統農業與歷史文化的魅力。\r\n\r\n隨著四季變換，步道上的花卉景色總是讓人驚豔。春天，魯冰花如風鈴般搖曳，夏天大波斯菊為炎熱的季節增添清新感，秋天的向日葵金黃燦爛，為登山之旅增添不少愉悅氛圍。\r\n\r\n在健行的途中，當你感到疲憊時，步道旁的茶坊是個理想的休息場所。這些茶坊提供貓空高山茶，以清新的茶香與山間的清風，為遊客提供了一個悠閒放鬆的空間，讓你在品茶的同時，也能享受周圍的大自然景色，輕鬆恢復體力。\r\n\r\n貓空樟樹步道是一條兼具自然美景和人文歷史的健行路線，無論是全家大小或是獨自探險，這裡都能帶給你愉快而療癒的旅行體驗。",
    "open_time": "",
    "zipcode": "116",
    "distric": "文山區",
    "address": "116 臺北市文山區樟樹步道",
    "tel": "+886-2-27593001",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 24.967288770445748,
    "elong": 121.58740125596523,
    "official_site": "",
    "facebook": "",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-29 14:14:03 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/2168",
    "category": [
      {
        "id": 16,
        "name": "戶外踏青"
      },
      {
        "id": 19,
        "name": "親子共遊"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      },
      {
        "id": 66,
        "name": "健行族"
      }
    ],
    "service": [],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/492028",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492029",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492030",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492031",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492032",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492033",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492024",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492025",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492026",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492027",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 229,
    "name": "松山文創園區",
    "name_zh": null,
    "open_status": 1,
    "introduction": "松山文創園區位於臺北市信義區，是一座著名的文化地標。其前身為1937年建成的臺灣總督府專賣局松山菸草工場，是臺灣首座專業捲菸廠，見證了臺灣現代化工業的起步與發展。\r\n\r\n園區內的建築風格以「日本初現代主義」為主，設計簡約卻不失精緻。面磚、琉璃與銅釘等高品質建材的運用，展現出當時高水準的建築工藝。儘管工廠於1998年停產，但在2001年被指定為市定古蹟後，這片歷史場域得以被妥善保存並轉型為當代文創集合園地。\r\n\r\n如今的松山文創園區已成為藝文展演與設計交流的核心地帶。園區內經常舉辦國內外展覽、手作工作坊、市集等多元活動，涵蓋藝術、設計、文創等領域。無論是欣賞國際知名的藝術展覽，還是發掘本地創作者的作品，都能在這裡找到靈感與樂趣。\r\n\r\n除了歷史與藝術，園區內的自然景觀也令人流連。巴洛克花園的幾何美感與生態景觀池的綠意盎然，為繁雜的信義區提供了一處鬧中取靜的休憩空間，是都市中難得的放鬆好去處。\r\n\r\n松山文創園區以文化再造的方式，讓歷史場域煥發新生命，成為臺北最具代表性的文創景點之一。不論是歷史迷、設計愛好者，還是單純想找個地方放鬆心靈的人，這裡都值得一再造訪！",
    "open_time": "【全園區】\r\n園區內-室內區域：9:00~18:00\r\n園區內-戶外區域：8:00~22:00\r\n園區生態景觀池周邊範圍：24小時開放\r\n\r\n【松菸小賣所】\r\n營業時間｜每日10:00-18:00\r\n營業地點｜東向製菸工廠1樓\r\n\r\n【服務中心】\r\n9:00~18:00。若租借相關器材或使用置物櫃，請於17:30前至服務中心歸還或提領。",
    "zipcode": "110",
    "distric": "信義區",
    "address": "110 臺北市信義區光復南路133號",
    "tel": "+886-2-27651388",
    "fax": "+886-2-27671823",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.04369,
    "elong": 121.56063,
    "official_site": "http://www.songshanculturalpark.org/",
    "facebook": "https://www.facebook.com/SCCPTaipei/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-29 13:48:48 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/229",
    "category": [
      {
        "id": 13,
        "name": "歷史建築"
      },
      {
        "id": 15,
        "name": "藝文館所"
      },
      {
        "id": 18,
        "name": "公共藝術"
      }
    ],
    "target": [],
    "service": [
      {
        "id": 143,
        "name": "場地租用"
      },
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      },
      {
        "id": 146,
        "name": "公廁"
      },
      {
        "id": 149,
        "name": "廣播服務"
      },
      {
        "id": 150,
        "name": "寄物櫃"
      }
    ],
    "friendly": [],
    "images": [],
    "files": [],
    "links": []
  },
  {
    "id": 2173,
    "name": "東三水街市場_新富市場",
    "name_zh": null,
    "open_status": 1,
    "introduction": "東三水街市場與新富市場位於臺北市萬華區，是該區具代表性的市場群之一，見證了萬華區的發展與歷史變遷。這條街區有三個主要市場：東三水街攤販集中場（俗稱東三水市場）、新富市場與新富町文化市場，每個市場都有獨特的風貌和魅力。\r\n\r\n東三水街攤販集中場（東三水市場）\r\n雖是一座傳統市場，但在2017年進行的市場店家微改造後，展現出全新的面貌。市場內環境明亮、舒適，營造出適合親子、觀光友善的市場空間。這裡不僅有新鮮的生鮮食材和各式日常用品，還擁有眾多傳統小吃攤位，從烤鴨、滷味到手工甜點等在地美味，讓你在購物之餘，還能品嚐到地道的臺灣風味，體驗獨具特色的市場魅力。\r\n\r\n新富市場\r\n原新富市場歷史悠久，周邊攤位延續傳統，主要販售生鮮熟食與日用品。市場內的人氣小吃如生魚片、油飯、手工水餃等，經濟實惠又美味，深受當地居民與饕客的喜愛。\r\n\r\n新富町文化市場\r\n新富町文化市場的前身是昭和十年（1935年）建成的綠町食料品小賣市場，其馬蹄形建築風格典型，為日治時期現代化市場的代表。如今，這裡被指定為市定古蹟，並成為一個融合文化、歷史與現代文創的場所。市場內有不定期會有展覽活動，吸引遊客來此慢遊與打卡。\r\n\r\n無論是尋求地道美食，還是想要體驗臺灣傳統市場的風情，這裡都能讓你感受到萬華區的獨特魅力，是探索臺北歷史與文化的好地方。",
    "open_time": "東三水街市場：上午7時至中午12時 \r\n新富市場：週一 休市，上午8時至下午3時",
    "zipcode": "108",
    "distric": "萬華區",
    "address": "108 臺北市萬華區三水街70號",
    "tel": "+886-2-23081558",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.03602,
    "elong": 121.5019,
    "official_site": "",
    "facebook": "",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-29 11:44:12 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/2173",
    "category": [
      {
        "id": 24,
        "name": "主題商街"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      }
    ],
    "service": [],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/492003",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492004",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492005",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492006",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492007",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492008",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492009",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492010",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492011",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492012",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/492013",
        "subject": "",
        "ext": ".png"
      }
    ],
    "files": [],
    "links": [
      {
        "src": "https://www.tcma.gov.taipei/News_Content.aspx?n=FAC14AD2DE4E01A4&sms=32F7BA052C5CA548&s=0D229E3F22691D88",
        "subject": "東三水街攤販集中場"
      },
      {
        "src": "https://www.tcma.gov.taipei/News_Content.aspx?n=1A4C7120ABFD0F9F&sms=26C5BF03E7963F4E&s=326936CE8DE9E940",
        "subject": "臺北市公有新富市場"
      }
    ]
  },
  {
    "id": 2,
    "name": "關渡碼頭",
    "name_zh": null,
    "open_status": 1,
    "introduction": "關渡原名甘豆門，因背倚觀音山和大屯山，面向淡水河，成為一處地勢險要的港口，早年先民由關渡碼頭進入移居臺灣北部開墾，因此關渡的開發甚早，後因兩河(基隆河、淡水河)河口泥沙淤積，水運才逐漸沒落。\r\n\r\n關渡碼頭位於關渡自然公園及關渡宮旁，每當假日或夜晚均可見遊客駐足關渡碼頭週邊散步休息，亦有許多單車族由八里經關渡大橋前來，或由淡水前來，沿途風光明媚，是一處極佳的賞景地點。\r\n\r\n\r\n\r\n\r\n\r\n\r\n",
    "open_time": "開放空間",
    "zipcode": "112",
    "distric": "北投區",
    "address": "112 臺北市北投區關渡碼頭",
    "tel": "+886-2-27208889",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.120870809229285,
    "elong": 121.4619791507721,
    "official_site": "",
    "facebook": "",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-08 10:45:56 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/2",
    "category": [
      {
        "id": 17,
        "name": "藍色水路"
      }
    ],
    "target": [
      {
        "id": 62,
        "name": "校外教學"
      }
    ],
    "service": [
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/63313",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63315",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63318",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63319",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63320",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63322",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63323",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 424,
    "name": "竹子湖海芋季",
    "name_zh": null,
    "open_status": 1,
    "introduction": "海芋原產於南非，因為它的苞片盛開時有如倒立的馬蹄，而植株又如同蓮花般生長在水中因此被稱為「馬蹄蓮」。目前竹子湖海芋花田生產總面積約有十三公頃，占全臺海芋產量百分之八十以上；海芋花期自每年元月至五月，花量最盛期在三至四月。竹子湖海芋以白色海芋為主，白色部分形姿優雅的「佛焰苞」並非其花，苞片中央黃色的肉穗花序上開滿了許多毫不起眼的小花，雌雄分隔，井然有序。\r\n\r\n海芋季期間，逢假日(含週休二日)，竹子湖地區湖田橋西經海芋大道方向實施順時針單向行駛交通輸導措施，海芋大道單行管制至往中正山叉路口止；另湖田橋往東湖路段採雙向通行，頂湖段採單向通行且禁止迴轉，疏導由新闢石板路往陽金公路離開。竹子湖地區交通管制實施時段為例假日自上午9時至下午6時，視實際車流量彈性調整\r\n\r\n因竹子湖地區路幅有限，建議欲前往民眾多多利用公眾運輸系統，搭乘捷運、公車前往，相關公眾運輸資訊請上臺北市交通局網站查詢。\r\n\r\n6條海芋步道 不同風情等您領略\r\n想活動一下筋骨，臺北市大地工程處推薦竹子湖的6條溪畔步道，想欣賞大片海芋花田、小油坑壯闊景緻、白鷺鷥和小梯田，可前往頂湖區的「頂湖環狀步道」，路徑平緩易走，老少皆宜，步行時間約20分鐘，如果對早期農家的水車及生態池感興趣，可到下湖區的「海芋環狀步道」，步行時間亦約20分鐘。\r\n\r\n若想觀瀑玩石、欣賞小山丘及梯田景致，水尾區的「文學步道」頗為適合，步行時間僅約10分鐘；想登高遠眺山坡海芋梯田，建議可到「湖底環狀步道」，步行時間約15分鐘。\r\n\r\n至於最長的「竹子湖環狀步道」，由湖田橋進入東湖、頂湖、水尾及下湖，步行時間大約50分鐘，沿路可享受景色怡人的竹子湖風情臺另外還有「芋戀道」，步行時間約15分鐘，3~5月看海芋花、4~6月賞愛情花，5~8月則有繡球花，不同的季節有不同的驚喜。\r\n\r\n提醒上山賞花的民眾，海芋季期間的例假日(含兒童節連假)，竹子湖周邊地區實施交通管制，建議民眾搭乘大眾運輸工具上山。詳細活動及交通資訊可至竹子湖海芋季網站查詢。\r\n\r\n(文：北投區農會)",
    "open_time": "海芋季期間（以官方網站公告為主），逢假日（含週休二日）",
    "zipcode": "112",
    "distric": "北投區",
    "address": "112 臺北市北投區竹子湖",
    "tel": "+886-2-28924185",
    "fax": "",
    "email": "",
    "months": "02,03,04",
    "nlat": 25.1755,
    "elong": 121.53678,
    "official_site": "http://www.callalily.com.tw/index.html",
    "facebook": "https://www.facebook.com/p/%E6%B5%B7%E8%8A%8B%E7%B9%A1%E7%90%83%E7%AB%B9%E5%AD%90%E6%B9%96-100076303840884/",
    "ticket": "",
    "remind": "海芋季期間（以官方網站公告為主），逢假日（含週休二日），仰德大道實施例假日管制；竹子湖地區湖田橋西經海芋大道方向實施順時針單向行駛交通輸導措施，海芋大道單行管制至往中正山叉路口止；另湖田橋往東湖路段採雙向通行，頂湖段採單向通行且禁止迴轉，疏導由新闢石板路往陽金公路離開。竹子湖地區交通管制實施時段為例假日自上午9時至下午6時，視實際車流量彈性調整。因竹子湖地區路幅有限，建議欲前往民眾多多利用公眾運輸系統，搭乘捷運、公車前往，相關公眾運輸資訊請上臺北市交通局網站查詢。",
    "staytime": "",
    "modified": "2024-11-08 10:30:15 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/424",
    "category": [
      {
        "id": 16,
        "name": "戶外踏青"
      },
      {
        "id": 19,
        "name": "親子共遊"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      },
      {
        "id": 62,
        "name": "校外教學"
      }
    ],
    "service": [
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/181607",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/181610",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/181611",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/181612",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/181613",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/181614",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/181617",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 76,
    "name": "財團法人台北市關渡宮",
    "name_zh": null,
    "open_status": 1,
    "introduction": "<!--\r\n關渡宮是臺灣北部最古老的媽袓廟，其歷史背景可以追朔到清順治年間，由開山石興和尚自福建奉請聖母來臺，當時名稱為「天妃廟」，其後乾隆、道光、光緒年間多次整修，於第5次重修並遷建現址，自石興和尚來臺已有340年以上的歷史。\r\n關渡宮殿內、殿外的石牆、石柱、石獅，都雕滿了歷史故事，作品細膩壯觀。關渡宮的祭典是每年農曆3月23，元宵節和中元節普渡也是年度大事，來自各地參拜的人潮絡繹不絕。由於香火鼎盛，關渡宮不斷擴建，除聖母殿、觀音殿、文昌殿外並有古佛洞，廣渡寺、鼓樓、鐘樓等，面積廣大。\r\n\r\n另外每年元宵節，關渡宮一定會有電動花燈展出，從山下廟宇到山上後花園，大大小小的燈籠及各方精製的花燈，充滿了年節氣息，難怪每年到了這時候，滿滿都是人潮，大人帶著小孩來這裡賞燈並求平安，希望未來一年都可以順順利利。\r\n\r\n\r\n\r\n-->台北市關渡宮擁有三百多年歷史，主祀天上聖母媽祖，是北台灣地區最早的媽祖廟，而除了參拜天上聖母媽祖與諸神明外，來到這裡還可以觀賞許多珍貴的古蹟文物以及豐富的宮廟建築藝術。由於位居大屯、觀音二山的餘脈相交，臨淡水河與基隆河的滙流，風光景緻一覽無遺，每當落日餘暉，宏偉壯闊的景觀，更是令人驚嘆。\r\n\r\n\r\n\r\n\r\n  \r\n  \r\n  \r\n  &nbsp;\r\n\r\n&nbsp;\r\n\r\n  \r\n  \r\n\r\n附近行程推薦:推薦行程\r\n",
    "open_time": "全年無休，每日6:00 - 21:00",
    "zipcode": "112",
    "distric": "北投區",
    "address": "112 臺北市北投區知行路360號",
    "tel": "+886-2-28581281",
    "fax": "",
    "email": "kuantu.eng@msa.hinet.net",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.1177,
    "elong": 121.46395,
    "official_site": "http://www.kuantu.org.tw/",
    "facebook": "https://www.facebook.com/kuantubobi?fref=nf",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-08 10:25:30 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/76",
    "category": [
      {
        "id": 13,
        "name": "歷史建築"
      },
      {
        "id": 14,
        "name": "宗教信仰"
      },
      {
        "id": 22,
        "name": "借問站"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      }
    ],
    "service": [
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/64043",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64045",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64046",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64049",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64054",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/64062",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 5,
    "name": "關渡_金色水岸_八里左岸自行車道",
    "name_zh": null,
    "open_status": 1,
    "introduction": "基隆河匯入淡水河之前，繞著社子島轉出一個美麗的弧彎，在其北岸與磺港溪以西地帶，保留了都會臺北極其珍貴的稻香田園，連結起河口紅樹林自然保護區，讓人得以在很短的距離內隔絕塵囂嘈雜，單車踩踏其間，尤其能夠體會早年農村氛圍的樸素簡單、踏實自在。夕照裡堤道漫步，河風微微、鳥鳴吱吱，關渡自然保護區生機盎然中，獨有浪漫閒適的野趣滿點。\r\n\r\n穿越關渡平原的自行車道，是全線非封閉性的路徑，西側端點為關渡宮，往東沿著關渡防潮堤至八仙福德祠，轉90度往北穿越關渡平原，直到北投中央北路捷運軌道南側，穿出去便是政戰學校西邊的稻香路。 無法自行攜帶單車的遊人，以關渡宮為起點較方便，一則靠近捷運站，再者可於該處租到自行車或雙人協力車。 關渡宮沿河堤段原有的攤販已完全撤離，改成好走的人行步道，跨越中港河小橋旁停泊的漁船也外移至淡水河邊，雖然少了扁舟停泊的漁港懷舊味，水域卻也另有清爽的風貌。",
    "open_time": "開放空間",
    "zipcode": "112",
    "distric": "北投區",
    "address": "112 臺北市北投區關渡水岸腳踏車道",
    "tel": "+886-2-27258149",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.11382,
    "elong": 121.48003,
    "official_site": "",
    "facebook": "",
    "ticket": "",
    "remind": "1.長度：11.9公里，其中貴子坑溪自行車道約5公里 \r\n2.騎乘時間：約40分鐘",
    "staytime": "",
    "modified": "2024-11-04 17:38:21 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/5",
    "category": [
      {
        "id": 12,
        "name": "單車遊蹤"
      },
      {
        "id": 16,
        "name": "戶外踏青"
      },
      {
        "id": 17,
        "name": "藍色水路"
      },
      {
        "id": 19,
        "name": "親子共遊"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      },
      {
        "id": 62,
        "name": "校外教學"
      },
      {
        "id": 63,
        "name": "單車族"
      },
      {
        "id": 65,
        "name": "賞鳥族"
      },
      {
        "id": 66,
        "name": "健行族"
      }
    ],
    "service": [
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/63340",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63335",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63337",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63339",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  },
  {
    "id": 1,
    "name": "大稻埕碼頭_大稻埕碼頭貨櫃市集",
    "name_zh": null,
    "open_status": 1,
    "introduction": "大稻埕原是平埔族的居住地，因萬華（艋舺）同安人發生激烈的械鬥，造成族人移至大稻埕定居，開始大稻埕淡水河旁商店和房屋的興建，淡水港開放後，大稻埕在劉銘傳的治理下成為臺北城最繁華的物資集散中心，當中以茶葉、布料為主要貿易交易，當時的延平北路及貴德街一帶便是商業活動的重心，也讓大稻埕早年的歷史多采多姿、令人回味。\r\n\r\n",
    "open_time": "平常日以團體預約包船為主，例假日行駛固定航次，請洽詢各船公司。\r\n強烈季風、漲退潮水位差影響航行及靠泊安全，當日實際航班得由現場公告或網站預告調整。\r\n\r\n",
    "zipcode": "103",
    "distric": "大同區",
    "address": "103 臺北市大同區大稻埕碼頭",
    "tel": "+886-2-66057338",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.0564,
    "elong": 121.50761,
    "official_site": "",
    "facebook": "https://www.facebook.com/M.DaDaoCheng/",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-04 17:38:10 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/1",
    "category": [
      {
        "id": 12,
        "name": "單車遊蹤"
      },
      {
        "id": 17,
        "name": "藍色水路"
      },
      {
        "id": 19,
        "name": "親子共遊"
      }
    ],
    "target": [
      {
        "id": 62,
        "name": "校外教學"
      }
    ],
    "service": [
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      },
      {
        "id": 146,
        "name": "公廁"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/182690",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182691",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182692",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182693",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182698",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182702",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182703",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/214149",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/223127",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/223128",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/223129",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/63302",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": [
      {
        "src": "https://river-fun.taipei/",
        "subject": "大稻埕古蹟航線 - 藍色水路微旅行"
      }
    ]
  },
  {
    "id": 19,
    "name": "國立故宮博物院",
    "name_zh": null,
    "open_status": 1,
    "introduction": "國立故宮博物院於1965年在外雙溪落成，中國宮殿式的建築，一至三樓為展覽陳列空間，四樓為休憩茶座「三希堂」。藏有全世界最多的中華藝術寶藏，收藏品主要承襲自宋、元、明、清四朝，幾乎涵蓋了整部五千年的中國歷史，數量近70萬件，使國立故宮博物院擁有「中華文化寶庫」的美名。\r\n\r\n故宮博物院內有兩種故宮三寶，一為藝術學界內的故宮三寶，三幅北宋巨碑式水墨畫，但因許多年才展出一次，鮮少人能親眼見到，便又分支出民間版的故宮三寶，也就是翠玉白菜、肉形石、毛公鼎。此三寶因像華人民間小吃「酸菜白肉鍋」，故被封為此稱號。\r\n\r\n國立故宮博物院院區左右側各有一座園林，左側為至善園，右側為至德園。至善園為仿宋代建築而建的庭園，除每周一休園，其餘時間皆可入園參觀，園內有兩座池、三處涼亭，還有許多魚及小動物，非常適合一家大小前來賞園。至德園位於至善路與故宮路交叉口，目前為免費參觀。園區面積不大，入口處是一個別緻的古典圓拱門，園內有一座蓮荷池，夏日來此可以看到大量的蓮花盛開。\r\n\r\n不想假日人擠人參觀故宮的話，故宮還提供了線上故宮的部分，可以透過展覽搶先看觀賞各展覽介紹；利用典藏賞析欣賞各個藏品的美麗樣貌；奇幻互動還能讓你有如進入書畫中，一起感受古人的作品；如果還不夠，可以一同走進故宮，利用720&deg; VR讓你彷彿置身於故宮裡，在虛擬實境空間探索各區域，並能隨時隨地觀看或聆聽展覽及藏品介紹，讓你在家猶如身在故宮。\r\n\r\n國立故宮博物院除了展覽品豐富以外，提供專業導覽，並定期舉辦各類文物研習課程、專題演講及巡迴展出活動，出版百種以上的刊物及專輯，實為世界的文化寶地，國立故宮博物院是來臺灣旅遊的必訪之地。\r\n\r\n(部分資料來源：國立故宮博物院)",
    "open_time": "國立故宮博物院北部院區自109年7月1日起延續開放時間調整措施：開放時間為每週二至週日09:00～17:00，每週一休館，取消每日及週末延長開館時間，同時暫停張大千紀念館對外開放。圖書文獻館自2020年10月19日(一)起至2021年1月底暫停對外開放。\r\n\r\n各項措施調整時間，將參考中央流行疫情指揮中心相關指示辦理，請隨時關注國立故宮博物院官網最新消息。造成您的不便，尚請見諒，感謝您的配合！",
    "zipcode": "111",
    "distric": "士林區",
    "address": "111 臺北市士林區至善路二段221號",
    "tel": "+886-2-28812021",
    "fax": "",
    "email": "service@npm.gov.tw",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.10236,
    "elong": 121.54849,
    "official_site": "https://www.npm.gov.tw/",
    "facebook": "https://www.facebook.com/npmgov/",
    "ticket": "門票及各展區開放時間依官方網站公告為主。",
    "remind": "※本景點為【士林北藝-無圍牆博物館】景點範圍\r\n＊每周一休館\r\n如有需要星期一可配合專場開放\r\n聯繫方式：賴先生\r\n02-28812021#2159\r\n＊免費參觀時間：1月1日元旦、元宵節、5月18日國際博物館日、9月27日世界觀光日、10月10日國慶日。\r\n\r\n＊配合連續假日，112年度週一開館日1/2、1/23、2/27、4/3、5/1、10/9、10/23、10/30、11/6、12/4。",
    "staytime": "2.5-3.5小時",
    "modified": "2024-11-04 17:37:58 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/19",
    "category": [
      {
        "id": 13,
        "name": "歷史建築"
      },
      {
        "id": 15,
        "name": "藝文館所"
      },
      {
        "id": 19,
        "name": "親子共遊"
      },
      {
        "id": 25,
        "name": "無障礙旅遊推薦景點"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      },
      {
        "id": 62,
        "name": "校外教學"
      }
    ],
    "service": [
      {
        "id": 141,
        "name": "無障礙設施"
      },
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      },
      {
        "id": 146,
        "name": "公廁"
      },
      {
        "id": 147,
        "name": "停車場"
      },
      {
        "id": 148,
        "name": "失物招領"
      },
      {
        "id": 149,
        "name": "廣播服務"
      },
      {
        "id": 150,
        "name": "寄物櫃"
      }
    ],
    "friendly": [
      {
        "id": 387,
        "name": "英語友善"
      },
      {
        "id": 388,
        "name": "日語友善"
      },
      {
        "id": 389,
        "name": "韓語友善"
      },
      {
        "id": 390,
        "name": "行動裝置充電"
      },
      {
        "id": 392,
        "name": "無障礙友善服務"
      },
      {
        "id": 393,
        "name": "性別友善"
      },
      {
        "id": 394,
        "name": "信用卡/悠遊卡/第三方支付服務"
      },
      {
        "id": 395,
        "name": "素食友善"
      },
      {
        "id": 396,
        "name": "友善廁所"
      },
      {
        "id": 398,
        "name": "WiFi友善"
      },
      {
        "id": 400,
        "name": "哺(集)乳友善"
      },
      {
        "id": 401,
        "name": "穆斯林友善"
      }
    ],
    "images": [
      {
        "src": "https://www.travel.taipei/image/221733",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221734",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221735",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221736",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221737",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221738",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221739",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221740",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221731",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/221732",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": [
      {
        "src": "https://www.npm.gov.tw/Article.aspx?sNo=02007001",
        "subject": "門票及開放時間"
      }
    ]
  },
  {
    "id": 217,
    "name": "台北101",
    "name_zh": null,
    "open_status": 1,
    "introduction": "台北101購物中心為地上5樓，地下1樓的購物空間，23000坪，是臺灣首座國際頂級購物中心。擁有許多精品旗艦店，如BALLY、LV、Prada、Gucci、Cartier、DIOR及FENDI等，消費者可以享受到最多樣的選擇，與全球流行零時差，輕鬆擁有愉悅的購物時刻。\r\n\r\n台北101購物中心有中式、西式、日式、美式等各國風味美食餐廳，而美食街擁有上千個座位，非常舒適的用餐環境。4樓都會廣場擁有完美的空間設計規劃，佔地500餘坪，挑高40米。採光自然，與四周的露天座椅融合為一體，散發著明亮開闊的現代氛圍。與世貿中心和ATT 4 FUN購物中心有空橋連接，近君悅飯店，交通十分方便。",
    "open_time": "",
    "zipcode": "110",
    "distric": "信義區",
    "address": "110 臺北市信義區信義路5段7號",
    "tel": "+886-2-81018800",
    "fax": "",
    "email": "",
    "months": "01,07,02,08,03,09,04,10,05,11,06,12",
    "nlat": 25.03361,
    "elong": 121.56476,
    "official_site": "https://www.taipei-101.com.tw/tw/",
    "facebook": "",
    "ticket": "",
    "remind": "",
    "staytime": "",
    "modified": "2024-11-04 17:37:51 +08:00",
    "url": "https://www.travel.taipei/zh-tw/attraction/details/217",
    "category": [
      {
        "id": 21,
        "name": "101亮點"
      },
      {
        "id": 25,
        "name": "無障礙旅遊推薦景點"
      }
    ],
    "target": [
      {
        "id": 61,
        "name": "親子共學"
      }
    ],
    "service": [
      {
        "id": 141,
        "name": "無障礙設施"
      },
      {
        "id": 143,
        "name": "場地租用"
      },
      {
        "id": 144,
        "name": "餐飲"
      },
      {
        "id": 145,
        "name": "購物"
      },
      {
        "id": 146,
        "name": "公廁"
      },
      {
        "id": 147,
        "name": "停車場"
      },
      {
        "id": 148,
        "name": "失物招領"
      },
      {
        "id": 149,
        "name": "廣播服務"
      },
      {
        "id": 150,
        "name": "寄物櫃"
      },
      {
        "id": 152,
        "name": "育嬰服務"
      }
    ],
    "friendly": [],
    "images": [
      {
        "src": "https://www.travel.taipei/image/64607",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182758",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182759",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182789",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182847",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182848",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182851",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182852",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182853",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182854",
        "subject": "",
        "ext": ".jpg"
      },
      {
        "src": "https://www.travel.taipei/image/182855",
        "subject": "",
        "ext": ".jpg"
      }
    ],
    "files": [],
    "links": []
  }
]
"""
}
