// Ionicons.swift
//
// Copyright (c) 2015 JIANG Peng
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import CoreText

private class FontLoader {
    class func loadFont(name: String) {
        let bundle  = NSBundle.mainBundle()
        let fontURL  = bundle.URLForResource(name, withExtension: "ttf")
            
        let data  = NSData(contentsOfURL: fontURL!)
        
        let provider  = CGDataProviderCreateWithCFData(data)
        let font  = CGFontCreateWithDataProvider(provider)!
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFStringRef  = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError  = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSInternalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}

public extension UIFont {
    public class func ioniconOfSize(fontSize: CGFloat) -> UIFont {
        struct Static {
            static var onceToken : dispatch_once_t = 0
        }
        
        let name  = "ionicons"
        if (UIFont.fontNamesForFamilyName(name).count == 0) {
            dispatch_once(&Static.onceToken) {
                FontLoader.loadFont(name)
            }
        }
        
        return UIFont(name: name, size: fontSize)!
    }
}

public enum Ionicon: String {
    case Alert   = "\u{f101}"
    case AlertCircled = "\u{f100}"
    case AndroidAdd = "\u{f2c7}"
    case AndroidAddCircle = "\u{f359}"
    case AndroidAlarmClock = "\u{f35a}"
    case AndroidAlert = "\u{f35b}"
    case AndroidApps = "\u{f35c}"
    case AndroidArchive = "\u{f2c9}"
    case AndroidArrowBack = "\u{f2ca}"
    case AndroidArrowDown = "\u{f35d}"
    case AndroidArrowDropdown = "\u{f35f}"
    case AndroidArrowDropdownCircle = "\u{f35e}"
    case AndroidArrowDropleft = "\u{f361}"
    case AndroidArrowDropleftCircle = "\u{f360}"
    case AndroidArrowDropright = "\u{f363}"
    case AndroidArrowDroprightCircle = "\u{f362}"
    case AndroidArrowDropup = "\u{f365}"
    case AndroidArrowDropupCircle = "\u{f364}"
    case AndroidArrowForward = "\u{f30f}"
    case AndroidArrowUp = "\u{f366}"
    case AndroidAttach = "\u{f367}"
    case AndroidBar = "\u{f368}"
    case AndroidBicycle = "\u{f369}"
    case AndroidBoat = "\u{f36a}"
    case AndroidBookmark = "\u{f36b}"
    case AndroidBulb = "\u{f36c}"
    case AndroidBus = "\u{f36d}"
    case AndroidCalendar = "\u{f2d1}"
    case AndroidCall = "\u{f2d2}"
    case AndroidCamera = "\u{f2d3}"
    case AndroidCancel = "\u{f36e}"
    case AndroidCar = "\u{f36f}"
    case AndroidCart = "\u{f370}"
    case AndroidChat = "\u{f2d4}"
    case AndroidCheckbox = "\u{f374}"
    case AndroidCheckboxBlank = "\u{f371}"
    case AndroidCheckboxOutline = "\u{f373}"
    case AndroidCheckboxOutlineBlank = "\u{f372}"
    case AndroidCheckmarkCircle = "\u{f375}"
    case AndroidClipboard = "\u{f376}"
    case AndroidClose = "\u{f2d7}"
    case AndroidCloud = "\u{f37a}"
    case AndroidCloudCircle = "\u{f377}"
    case AndroidCloudDone = "\u{f378}"
    case AndroidCloudOutline = "\u{f379}"
    case AndroidColorPalette = "\u{f37b}"
    case AndroidCompass = "\u{f37c}"
    case AndroidContact = "\u{f2d8}"
    case AndroidContacts = "\u{f2d9}"
    case AndroidContract = "\u{f37d}"
    case AndroidCreate = "\u{f37e}"
    case AndroidDelete = "\u{f37f}"
    case AndroidDesktop = "\u{f380}"
    case AndroidDocument = "\u{f381}"
    case AndroidDone = "\u{f383}"
    case AndroidDoneAll = "\u{f382}"
    case AndroidDownload = "\u{f2dd}"
    case AndroidDrafts = "\u{f384}"
    case AndroidExit = "\u{f385}"
    case AndroidExpand = "\u{f386}"
    case AndroidFavorite = "\u{f388}"
    case AndroidFavoriteOutline = "\u{f387}"
    case AndroidFilm = "\u{f389}"
    case AndroidFolder = "\u{f2e0}"
    case AndroidFolderOpen = "\u{f38a}"
    case AndroidFunnel = "\u{f38b}"
    case AndroidGlobe = "\u{f38c}"
    case AndroidHand = "\u{f2e3}"
    case AndroidHangout = "\u{f38d}"
    case AndroidHappy = "\u{f38e}"
    case AndroidHome = "\u{f38f}"
    case AndroidImage = "\u{f2e4}"
    case AndroidLaptop = "\u{f390}"
    case AndroidList = "\u{f391}"
    case AndroidLocate = "\u{f2e9}"
    case AndroidLock = "\u{f392}"
    case AndroidMail = "\u{f2eb}"
    case AndroidMap = "\u{f393}"
    case AndroidMenu = "\u{f394}"
    case AndroidMicrophone = "\u{f2ec}"
    case AndroidMicrophoneOff = "\u{f395}"
    case AndroidMoreHorizontal = "\u{f396}"
    case AndroidMoreVertical = "\u{f397}"
    case AndroidNavigate = "\u{f398}"
    case AndroidNotifications = "\u{f39b}"
    case AndroidNotificationsNone = "\u{f399}"
    case AndroidNotificationsOff = "\u{f39a}"
    case AndroidOpen = "\u{f39c}"
    case AndroidOptions = "\u{f39d}"
    case AndroidPeople = "\u{f39e}"
    case AndroidPerson = "\u{f3a0}"
    case AndroidPersonAdd = "\u{f39f}"
    case AndroidPhoneLandscape = "\u{f3a1}"
    case AndroidPhonePortrait = "\u{f3a2}"
    case AndroidPin = "\u{f3a3}"
    case AndroidPlane = "\u{f3a4}"
    case AndroidPlaystore = "\u{f2f0}"
    case AndroidPrint = "\u{f3a5}"
    case AndroidRadioButtonOff = "\u{f3a6}"
    case AndroidRadioButtonOn = "\u{f3a7}"
    case AndroidRefresh = "\u{f3a8}"
    case AndroidRemove = "\u{f2f4}"
    case AndroidRemoveCircle = "\u{f3a9}"
    case AndroidRestaurant = "\u{f3aa}"
    case AndroidSad = "\u{f3ab}"
    case AndroidSearch = "\u{f2f5}"
    case AndroidSend = "\u{f2f6}"
    case AndroidSettings = "\u{f2f7}"
    case AndroidShare = "\u{f2f8}"
    case AndroidShareAlt = "\u{f3ac}"
    case AndroidStar = "\u{f2fc}"
    case AndroidStarHalf = "\u{f3ad}"
    case AndroidStarOutline = "\u{f3ae}"
    case AndroidStopwatch = "\u{f2fd}"
    case AndroidSubway = "\u{f3af}"
    case AndroidSunny = "\u{f3b0}"
    case AndroidSync = "\u{f3b1}"
    case AndroidTextsms = "\u{f3b2}"
    case AndroidTime = "\u{f3b3}"
    case AndroidTrain = "\u{f3b4}"
    case AndroidUnlock = "\u{f3b5}"
    case AndroidUpload = "\u{f3b6}"
    case AndroidVolumeDown = "\u{f3b7}"
    case AndroidVolumeMute = "\u{f3b8}"
    case AndroidVolumeOff = "\u{f3b9}"
    case AndroidVolumeUp = "\u{f3ba}"
    case AndroidWalk = "\u{f3bb}"
    case AndroidWarning = "\u{f3bc}"
    case AndroidWatch = "\u{f3bd}"
    case AndroidWifi = "\u{f305}"
    case Aperture = "\u{f313}"
    case Archive = "\u{f102}"
    case ArrowDownA = "\u{f103}"
    case ArrowDownB = "\u{f104}"
    case ArrowDownC = "\u{f105}"
    case ArrowExpand = "\u{f25e}"
    case ArrowGraphDownLeft = "\u{f25f}"
    case ArrowGraphDownRight = "\u{f260}"
    case ArrowGraphUpLeft = "\u{f261}"
    case ArrowGraphUpRight = "\u{f262}"
    case ArrowLeftA = "\u{f106}"
    case ArrowLeftB = "\u{f107}"
    case ArrowLeftC = "\u{f108}"
    case ArrowMove = "\u{f263}"
    case ArrowResize = "\u{f264}"
    case ArrowReturnLeft = "\u{f265}"
    case ArrowReturnRight = "\u{f266}"
    case ArrowRightA = "\u{f109}"
    case ArrowRightB = "\u{f10a}"
    case ArrowRightC = "\u{f10b}"
    case ArrowShrink = "\u{f267}"
    case ArrowSwap = "\u{f268}"
    case ArrowUpA = "\u{f10c}"
    case ArrowUpB = "\u{f10d}"
    case ArrowUpC = "\u{f10e}"
    case Asterisk = "\u{f314}"
    case At = "\u{f10f}"
    case Backspace = "\u{f3bf}"
    case BackspaceOutline = "\u{f3be}"
    case Bag = "\u{f110}"
    case BatteryCharging = "\u{f111}"
    case BatteryEmpty = "\u{f112}"
    case BatteryFull = "\u{f113}"
    case BatteryHalf = "\u{f114}"
    case BatteryLow = "\u{f115}"
    case Beaker = "\u{f269}"
    case Beer = "\u{f26a}"
    case Bluetooth = "\u{f116}"
    case Bonfire = "\u{f315}"
    case Bookmark = "\u{f26b}"
    case Bowtie = "\u{f3c0}"
    case Briefcase = "\u{f26c}"
    case Bug = "\u{f2be}"
    case Calculator = "\u{f26d}"
    case Calendar = "\u{f117}"
    case Camera = "\u{f118}"
    case Card = "\u{f119}"
    case Cash = "\u{f316}"
    case Chatbox = "\u{f11b}"
    case ChatboxWorking = "\u{f11a}"
    case Chatboxes = "\u{f11c}"
    case Chatbubble = "\u{f11e}"
    case ChatbubbleWorking = "\u{f11d}"
    case Chatbubbles = "\u{f11f}"
    case Checkmark = "\u{f122}"
    case CheckmarkCircled = "\u{f120}"
    case CheckmarkRound = "\u{f121}"
    case ChevronDown = "\u{f123}"
    case ChevronLeft = "\u{f124}"
    case ChevronRight = "\u{f125}"
    case ChevronUp = "\u{f126}"
    case Clipboard = "\u{f127}"
    case Clock = "\u{f26e}"
    case Close = "\u{f12a}"
    case CloseCircled = "\u{f128}"
    case CloseRound = "\u{f129}"
    case ClosedCaptioning = "\u{f317}"
    case Cloud = "\u{f12b}"
    case Code = "\u{f271}"
    case CodeDownload = "\u{f26f}"
    case CodeWorking = "\u{f270}"
    case Coffee = "\u{f272}"
    case Compass = "\u{f273}"
    case Compose = "\u{f12c}"
    case ConnectionBars = "\u{f274}"
    case Contrast = "\u{f275}"
    case Crop = "\u{f3c1}"
    case Cube = "\u{f318}"
    case Disc = "\u{f12d}"
    case Document = "\u{f12f}"
    case DocumentText = "\u{f12e}"
    case Drag = "\u{f130}"
    case Earth = "\u{f276}"
    case Easel = "\u{f3c2}"
    case Edit = "\u{f2bf}"
    case Egg = "\u{f277}"
    case Eject = "\u{f131}"
    case Email = "\u{f132}"
    case EmailUnread = "\u{f3c3}"
    case ErlenmeyerFlask = "\u{f3c5}"
    case ErlenmeyerFlaskBubbles = "\u{f3c4}"
    case Eye = "\u{f133}"
    case EyeDisabled = "\u{f306}"
    case Female = "\u{f278}"
    case Filing = "\u{f134}"
    case FilmMarker = "\u{f135}"
    case Fireball = "\u{f319}"
    case Flag = "\u{f279}"
    case Flame = "\u{f31a}"
    case Flash = "\u{f137}"
    case FlashOff = "\u{f136}"
    case Folder = "\u{f139}"
    case Fork = "\u{f27a}"
    case ForkRepo = "\u{f2c0}"
    case Forward = "\u{f13a}"
    case Funnel = "\u{f31b}"
    case GearA = "\u{f13d}"
    case GearB = "\u{f13e}"
    case Grid = "\u{f13f}"
    case Hammer = "\u{f27b}"
    case Happy = "\u{f31c}"
    case HappyOutline = "\u{f3c6}"
    case Headphone = "\u{f140}"
    case Heart = "\u{f141}"
    case HeartBroken = "\u{f31d}"
    case Help = "\u{f143}"
    case HelpBuoy = "\u{f27c}"
    case HelpCircled = "\u{f142}"
    case Home = "\u{f144}"
    case Icecream = "\u{f27d}"
    case Image = "\u{f147}"
    case Images = "\u{f148}"
    case Information = "\u{f14a}"
    case InformationCircled = "\u{f149}"
    case Ionic = "\u{f14b}"
    case IosAlarm = "\u{f3c8}"
    case IosAlarmOutline = "\u{f3c7}"
    case IosAlbums = "\u{f3ca}"
    case IosAlbumsOutline = "\u{f3c9}"
    case IosAmericanfootball = "\u{f3cc}"
    case IosAmericanfootballOutline = "\u{f3cb}"
    case IosAnalytics = "\u{f3ce}"
    case IosAnalyticsOutline = "\u{f3cd}"
    case IosArrowBack = "\u{f3cf}"
    case IosArrowDown = "\u{f3d0}"
    case IosArrowForward = "\u{f3d1}"
    case IosArrowLeft = "\u{f3d2}"
    case IosArrowRight = "\u{f3d3}"
    case IosArrowThinDown = "\u{f3d4}"
    case IosArrowThinLeft = "\u{f3d5}"
    case IosArrowThinRight = "\u{f3d6}"
    case IosArrowThinUp = "\u{f3d7}"
    case IosArrowUp = "\u{f3d8}"
    case IosAt = "\u{f3da}"
    case IosAtOutline = "\u{f3d9}"
    case IosBarcode = "\u{f3dc}"
    case IosBarcodeOutline = "\u{f3db}"
    case IosBaseball = "\u{f3de}"
    case IosBaseballOutline = "\u{f3dd}"
    case IosBasketball = "\u{f3e0}"
    case IosBasketballOutline = "\u{f3df}"
    case IosBell = "\u{f3e2}"
    case IosBellOutline = "\u{f3e1}"
    case IosBody = "\u{f3e4}"
    case IosBodyOutline = "\u{f3e3}"
    case IosBolt = "\u{f3e6}"
    case IosBoltOutline = "\u{f3e5}"
    case IosBook = "\u{f3e8}"
    case IosBookOutline = "\u{f3e7}"
    case IosBookmarks = "\u{f3ea}"
    case IosBookmarksOutline = "\u{f3e9}"
    case IosBox = "\u{f3ec}"
    case IosBoxOutline = "\u{f3eb}"
    case IosBriefcase = "\u{f3ee}"
    case IosBriefcaseOutline = "\u{f3ed}"
    case IosBrowsers = "\u{f3f0}"
    case IosBrowsersOutline = "\u{f3ef}"
    case IosCalculator = "\u{f3f2}"
    case IosCalculatorOutline = "\u{f3f1}"
    case IosCalendar = "\u{f3f4}"
    case IosCalendarOutline = "\u{f3f3}"
    case IosCamera = "\u{f3f6}"
    case IosCameraOutline = "\u{f3f5}"
    case IosCart = "\u{f3f8}"
    case IosCartOutline = "\u{f3f7}"
    case IosChatboxes = "\u{f3fa}"
    case IosChatboxesOutline = "\u{f3f9}"
    case IosChatbubble = "\u{f3fc}"
    case IosChatbubbleOutline = "\u{f3fb}"
    case IosCheckmark = "\u{f3ff}"
    case IosCheckmarkEmpty = "\u{f3fd}"
    case IosCheckmarkOutline = "\u{f3fe}"
    case IosCircleFilled = "\u{f400}"
    case IosCircleOutline = "\u{f401}"
    case IosClock = "\u{f403}"
    case IosClockOutline = "\u{f402}"
    case IosClose = "\u{f406}"
    case IosCloseEmpty = "\u{f404}"
    case IosCloseOutline = "\u{f405}"
    case IosCloud = "\u{f40c}"
    case IosCloudDownload = "\u{f408}"
    case IosCloudDownloadOutline = "\u{f407}"
    case IosCloudOutline = "\u{f409}"
    case IosCloudUpload = "\u{f40b}"
    case IosCloudUploadOutline = "\u{f40a}"
    case IosCloudy = "\u{f410}"
    case IosCloudyNight = "\u{f40e}"
    case IosCloudyNightOutline = "\u{f40d}"
    case IosCloudyOutline = "\u{f40f}"
    case IosCog = "\u{f412}"
    case IosCogOutline = "\u{f411}"
    case IosColorFilter = "\u{f414}"
    case IosColorFilterOutline = "\u{f413}"
    case IosColorWand = "\u{f416}"
    case IosColorWandOutline = "\u{f415}"
    case IosCompose = "\u{f418}"
    case IosComposeOutline = "\u{f417}"
    case IosContact = "\u{f41a}"
    case IosContactOutline = "\u{f419}"
    case IosCopy = "\u{f41c}"
    case IosCopyOutline = "\u{f41b}"
    case IosCrop = "\u{f41e}"
    case IosCropStrong = "\u{f41d}"
    case IosDownload = "\u{f420}"
    case IosDownloadOutline = "\u{f41f}"
    case IosDrag = "\u{f421}"
    case IosEmail = "\u{f423}"
    case IosEmailOutline = "\u{f422}"
    case IosEye = "\u{f425}"
    case IosEyeOutline = "\u{f424}"
    case IosFastforward = "\u{f427}"
    case IosFastforwardOutline = "\u{f426}"
    case IosFiling = "\u{f429}"
    case IosFilingOutline = "\u{f428}"
    case IosFilm = "\u{f42b}"
    case IosFilmOutline = "\u{f42a}"
    case IosFlag = "\u{f42d}"
    case IosFlagOutline = "\u{f42c}"
    case IosFlame = "\u{f42f}"
    case IosFlameOutline = "\u{f42e}"
    case IosFlask = "\u{f431}"
    case IosFlaskOutline = "\u{f430}"
    case IosFlower = "\u{f433}"
    case IosFlowerOutline = "\u{f432}"
    case IosFolder = "\u{f435}"
    case IosFolderOutline = "\u{f434}"
    case IosFootball = "\u{f437}"
    case IosFootballOutline = "\u{f436}"
    case IosGameControllerA = "\u{f439}"
    case IosGameControllerAOutline = "\u{f438}"
    case IosGameControllerB = "\u{f43b}"
    case IosGameControllerBOutline = "\u{f43a}"
    case IosGear = "\u{f43d}"
    case IosGearOutline = "\u{f43c}"
    case IosGlasses = "\u{f43f}"
    case IosGlassesOutline = "\u{f43e}"
    case IosGridView = "\u{f441}"
    case IosGridViewOutline = "\u{f440}"
    case IosHeart = "\u{f443}"
    case IosHeartOutline = "\u{f442}"
    case IosHelp = "\u{f446}"
    case IosHelpEmpty = "\u{f444}"
    case IosHelpOutline = "\u{f445}"
    case IosHome = "\u{f448}"
    case IosHomeOutline = "\u{f447}"
    case IosInfinite = "\u{f44a}"
    case IosInfiniteOutline = "\u{f449}"
    case IosInformation = "\u{f44d}"
    case IosInformationEmpty = "\u{f44b}"
    case IosInformationOutline = "\u{f44c}"
    case IosIonicOutline = "\u{f44e}"
    case IosKeypad = "\u{f450}"
    case IosKeypadOutline = "\u{f44f}"
    case IosLightbulb = "\u{f452}"
    case IosLightbulbOutline = "\u{f451}"
    case IosList = "\u{f454}"
    case IosListOutline = "\u{f453}"
    case IosLocation = "\u{f456}"
    case IosLocationOutline = "\u{f455}"
    case IosLocked = "\u{f458}"
    case IosLockedOutline = "\u{f457}"
    case IosLoop = "\u{f45a}"
    case IosLoopStrong = "\u{f459}"
    case IosMedical = "\u{f45c}"
    case IosMedicalOutline = "\u{f45b}"
    case IosMedkit = "\u{f45e}"
    case IosMedkitOutline = "\u{f45d}"
    case IosMic = "\u{f461}"
    case IosMicOff = "\u{f45f}"
    case IosMicOutline = "\u{f460}"
    case IosMinus = "\u{f464}"
    case IosMinusEmpty = "\u{f462}"
    case IosMinusOutline = "\u{f463}"
    case IosMonitor = "\u{f466}"
    case IosMonitorOutline = "\u{f465}"
    case IosMoon = "\u{f468}"
    case IosMoonOutline = "\u{f467}"
    case IosMore = "\u{f46a}"
    case IosMoreOutline = "\u{f469}"
    case IosMusicalNote = "\u{f46b}"
    case IosMusicalNotes = "\u{f46c}"
    case IosNavigate = "\u{f46e}"
    case IosNavigateOutline = "\u{f46d}"
    case IosNutrition = "\u{f470}"
    case IosNutritionOutline = "\u{f46f}"
    case IosPaper = "\u{f472}"
    case IosPaperOutline = "\u{f471}"
    case IosPaperplane = "\u{f474}"
    case IosPaperplaneOutline = "\u{f473}"
    case IosPartlysunny = "\u{f476}"
    case IosPartlysunnyOutline = "\u{f475}"
    case IosPause = "\u{f478}"
    case IosPauseOutline = "\u{f477}"
    case IosPaw = "\u{f47a}"
    case IosPawOutline = "\u{f479}"
    case IosPeople = "\u{f47c}"
    case IosPeopleOutline = "\u{f47b}"
    case IosPerson = "\u{f47e}"
    case IosPersonOutline = "\u{f47d}"
    case IosPersonadd = "\u{f480}"
    case IosPersonaddOutline = "\u{f47f}"
    case IosPhotos = "\u{f482}"
    case IosPhotosOutline = "\u{f481}"
    case IosPie = "\u{f484}"
    case IosPieOutline = "\u{f483}"
    case IosPint = "\u{f486}"
    case IosPintOutline = "\u{f485}"
    case IosPlay = "\u{f488}"
    case IosPlayOutline = "\u{f487}"
    case IosPlus = "\u{f48b}"
    case IosPlusEmpty = "\u{f489}"
    case IosPlusOutline = "\u{f48a}"
    case IosPricetag = "\u{f48d}"
    case IosPricetagOutline = "\u{f48c}"
    case IosPricetags = "\u{f48f}"
    case IosPricetagsOutline = "\u{f48e}"
    case IosPrinter = "\u{f491}"
    case IosPrinterOutline = "\u{f490}"
    case IosPulse = "\u{f493}"
    case IosPulseStrong = "\u{f492}"
    case IosRainy = "\u{f495}"
    case IosRainyOutline = "\u{f494}"
    case IosRecording = "\u{f497}"
    case IosRecordingOutline = "\u{f496}"
    case IosRedo = "\u{f499}"
    case IosRedoOutline = "\u{f498}"
    case IosRefresh = "\u{f49c}"
    case IosRefreshEmpty = "\u{f49a}"
    case IosRefreshOutline = "\u{f49b}"
    case IosReload = "\u{f49d}"
    case IosReverseCamera = "\u{f49f}"
    case IosReverseCameraOutline = "\u{f49e}"
    case IosRewind = "\u{f4a1}"
    case IosRewindOutline = "\u{f4a0}"
    case IosRose = "\u{f4a3}"
    case IosRoseOutline = "\u{f4a2}"
    case IosSearch = "\u{f4a5}"
    case IosSearchStrong = "\u{f4a4}"
    case IosSettings = "\u{f4a7}"
    case IosSettingsStrong = "\u{f4a6}"
    case IosShuffle = "\u{f4a9}"
    case IosShuffleStrong = "\u{f4a8}"
    case IosSkipbackward = "\u{f4ab}"
    case IosSkipbackwardOutline = "\u{f4aa}"
    case IosSkipforward = "\u{f4ad}"
    case IosSkipforwardOutline = "\u{f4ac}"
    case IosSnowy = "\u{f4ae}"
    case IosSpeedometer = "\u{f4b0}"
    case IosSpeedometerOutline = "\u{f4af}"
    case IosStar = "\u{f4b3}"
    case IosStarHalf = "\u{f4b1}"
    case IosStarOutline = "\u{f4b2}"
    case IosStopwatch = "\u{f4b5}"
    case IosStopwatchOutline = "\u{f4b4}"
    case IosSunny = "\u{f4b7}"
    case IosSunnyOutline = "\u{f4b6}"
    case IosTelephone = "\u{f4b9}"
    case IosTelephoneOutline = "\u{f4b8}"
    case IosTennisball = "\u{f4bb}"
    case IosTennisballOutline = "\u{f4ba}"
    case IosThunderstorm = "\u{f4bd}"
    case IosThunderstormOutline = "\u{f4bc}"
    case IosTime = "\u{f4bf}"
    case IosTimeOutline = "\u{f4be}"
    case IosTimer = "\u{f4c1}"
    case IosTimerOutline = "\u{f4c0}"
    case IosToggle = "\u{f4c3}"
    case IosToggleOutline = "\u{f4c2}"
    case IosTrash = "\u{f4c5}"
    case IosTrashOutline = "\u{f4c4}"
    case IosUndo = "\u{f4c7}"
    case IosUndoOutline = "\u{f4c6}"
    case IosUnlocked = "\u{f4c9}"
    case IosUnlockedOutline = "\u{f4c8}"
    case IosUpload = "\u{f4cb}"
    case IosUploadOutline = "\u{f4ca}"
    case IosVideocam = "\u{f4cd}"
    case IosVideocamOutline = "\u{f4cc}"
    case IosVolumeHigh = "\u{f4ce}"
    case IosVolumeLow = "\u{f4cf}"
    case IosWineglass = "\u{f4d1}"
    case IosWineglassOutline = "\u{f4d0}"
    case IosWorld = "\u{f4d3}"
    case IosWorldOutline = "\u{f4d2}"
    case Ipad = "\u{f1f9}"
    case Iphone = "\u{f1fa}"
    case Ipod = "\u{f1fb}"
    case Jet = "\u{f295}"
    case Key = "\u{f296}"
    case Knife = "\u{f297}"
    case Laptop = "\u{f1fc}"
    case Leaf = "\u{f1fd}"
    case Levels = "\u{f298}"
    case Lightbulb = "\u{f299}"
    case Link = "\u{f1fe}"
    case LoadA = "\u{f29a}"
    case LoadB = "\u{f29b}"
    case LoadC = "\u{f29c}"
    case LoadD = "\u{f29d}"
    case Location = "\u{f1ff}"
    case LockCombination = "\u{f4d4}"
    case Locked = "\u{f200}"
    case LogIn = "\u{f29e}"
    case LogOut = "\u{f29f}"
    case Loop = "\u{f201}"
    case Magnet = "\u{f2a0}"
    case Male = "\u{f2a1}"
    case Man = "\u{f202}"
    case Map = "\u{f203}"
    case Medkit = "\u{f2a2}"
    case Merge = "\u{f33f}"
    case MicA = "\u{f204}"
    case MicB = "\u{f205}"
    case MicC = "\u{f206}"
    case Minus = "\u{f209}"
    case MinusCircled = "\u{f207}"
    case MinusRound = "\u{f208}"
    case ModelS = "\u{f2c1}"
    case Monitor = "\u{f20a}"
    case More = "\u{f20b}"
    case Mouse = "\u{f340}"
    case MusicNote = "\u{f20c}"
    case Navicon = "\u{f20e}"
    case NaviconRound = "\u{f20d}"
    case Navigate = "\u{f2a3}"
    case Network = "\u{f341}"
    case NoSmoking = "\u{f2c2}"
    case Nuclear = "\u{f2a4}"
    case Outlet = "\u{f342}"
    case Paintbrush = "\u{f4d5}"
    case Paintbucket = "\u{f4d6}"
    case PaperAirplane = "\u{f2c3}"
    case Paperclip = "\u{f20f}"
    case Pause = "\u{f210}"
    case Person = "\u{f213}"
    case PersonAdd = "\u{f211}"
    case PersonStalker = "\u{f212}"
    case PieGraph = "\u{f2a5}"
    case Pin = "\u{f2a6}"
    case Pinpoint = "\u{f2a7}"
    case Pizza = "\u{f2a8}"
    case Plane = "\u{f214}"
    case Planet = "\u{f343}"
    case Play = "\u{f215}"
    case Playstation = "\u{f30a}"
    case Plus = "\u{f218}"
    case PlusCircled = "\u{f216}"
    case PlusRound = "\u{f217}"
    case Podium = "\u{f344}"
    case Pound = "\u{f219}"
    case Power = "\u{f2a9}"
    case Pricetag = "\u{f2aa}"
    case Pricetags = "\u{f2ab}"
    case Printer = "\u{f21a}"
    case PullRequest = "\u{f345}"
    case QrScanner = "\u{f346}"
    case Quote = "\u{f347}"
    case RadioWaves = "\u{f2ac}"
    case Record = "\u{f21b}"
    case Refresh = "\u{f21c}"
    case Reply = "\u{f21e}"
    case ReplyAll = "\u{f21d}"
    case RibbonA = "\u{f348}"
    case RibbonB = "\u{f349}"
    case Sad = "\u{f34a}"
    case SadOutline = "\u{f4d7}"
    case Scissors = "\u{f34b}"
    case Search = "\u{f21f}"
    case Settings = "\u{f2ad}"
    case Share = "\u{f220}"
    case Shuffle = "\u{f221}"
    case SkipBackward = "\u{f222}"
    case SkipForward = "\u{f223}"
    case SocialAndroid = "\u{f225}"
    case SocialAndroidOutline = "\u{f224}"
    case SocialAngular = "\u{f4d9}"
    case SocialAngularOutline = "\u{f4d8}"
    case SocialApple = "\u{f227}"
    case SocialAppleOutline = "\u{f226}"
    case SocialBitcoin = "\u{f2af}"
    case SocialBitcoinOutline = "\u{f2ae}"
    case SocialBuffer = "\u{f229}"
    case SocialBufferOutline = "\u{f228}"
    case SocialChrome = "\u{f4db}"
    case SocialChromeOutline = "\u{f4da}"
    case SocialCodepen = "\u{f4dd}"
    case SocialCodepenOutline = "\u{f4dc}"
    case SocialCss3 = "\u{f4df}"
    case SocialCss3Outline = "\u{f4de}"
    case SocialDesignernews = "\u{f22b}"
    case SocialDesignernewsOutline = "\u{f22a}"
    case SocialDribbble = "\u{f22d}"
    case SocialDribbbleOutline = "\u{f22c}"
    case SocialDropbox = "\u{f22f}"
    case SocialDropboxOutline = "\u{f22e}"
    case SocialEuro = "\u{f4e1}"
    case SocialEuroOutline = "\u{f4e0}"
    case SocialFacebook = "\u{f231}"
    case SocialFacebookOutline = "\u{f230}"
    case SocialFoursquare = "\u{f34d}"
    case SocialFoursquareOutline = "\u{f34c}"
    case SocialFreebsdDevil = "\u{f2c4}"
    case SocialGithub = "\u{f233}"
    case SocialGithubOutline = "\u{f232}"
    case SocialGoogle = "\u{f34f}"
    case SocialGoogleOutline = "\u{f34e}"
    case SocialGoogleplus = "\u{f235}"
    case SocialGoogleplusOutline = "\u{f234}"
    case SocialHackernews = "\u{f237}"
    case SocialHackernewsOutline = "\u{f236}"
    case SocialHtml5 = "\u{f4e3}"
    case SocialHtml5Outline = "\u{f4e2}"
    case SocialInstagram = "\u{f351}"
    case SocialInstagramOutline = "\u{f350}"
    case SocialJavascript = "\u{f4e5}"
    case SocialJavascriptOutline = "\u{f4e4}"
    case SocialLinkedin = "\u{f239}"
    case SocialLinkedinOutline = "\u{f238}"
    case SocialMarkdown = "\u{f4e6}"
    case SocialNodejs = "\u{f4e7}"
    case SocialOctocat = "\u{f4e8}"
    case SocialPinterest = "\u{f2b1}"
    case SocialPinterestOutline = "\u{f2b0}"
    case SocialPython = "\u{f4e9}"
    case SocialReddit = "\u{f23b}"
    case SocialRedditOutline = "\u{f23a}"
    case SocialRss = "\u{f23d}"
    case SocialRssOutline = "\u{f23c}"
    case SocialSass = "\u{f4ea}"
    case SocialSkype = "\u{f23f}"
    case SocialSkypeOutline = "\u{f23e}"
    case SocialSnapchat = "\u{f4ec}"
    case SocialSnapchatOutline = "\u{f4eb}"
    case SocialTumblr = "\u{f241}"
    case SocialTumblrOutline = "\u{f240}"
    case SocialTux = "\u{f2c5}"
    case SocialTwitch = "\u{f4ee}"
    case SocialTwitchOutline = "\u{f4ed}"
    case SocialTwitter = "\u{f243}"
    case SocialTwitterOutline = "\u{f242}"
    case SocialUsd = "\u{f353}"
    case SocialUsdOutline = "\u{f352}"
    case SocialVimeo = "\u{f245}"
    case SocialVimeoOutline = "\u{f244}"
    case SocialWhatsapp = "\u{f4f0}"
    case SocialWhatsappOutline = "\u{f4ef}"
    case SocialWindows = "\u{f247}"
    case SocialWindowsOutline = "\u{f246}"
    case SocialWordpress = "\u{f249}"
    case SocialWordpressOutline = "\u{f248}"
    case SocialYahoo = "\u{f24b}"
    case SocialYahooOutline = "\u{f24a}"
    case SocialYen = "\u{f4f2}"
    case SocialYenOutline = "\u{f4f1}"
    case SocialYoutube = "\u{f24d}"
    case SocialYoutubeOutline = "\u{f24c}"
    case SoupCan = "\u{f4f4}"
    case SoupCanOutline = "\u{f4f3}"
    case Speakerphone = "\u{f2b2}"
    case Speedometer = "\u{f2b3}"
    case Spoon = "\u{f2b4}"
    case Star = "\u{f24e}"
    case StatsBars = "\u{f2b5}"
    case Steam = "\u{f30b}"
    case Stop = "\u{f24f}"
    case Thermometer = "\u{f2b6}"
    case Thumbsdown = "\u{f250}"
    case Thumbsup = "\u{f251}"
    case Toggle = "\u{f355}"
    case ToggleFilled = "\u{f354}"
    case Transgender = "\u{f4f5}"
    case TrashA = "\u{f252}"
    case TrashB = "\u{f253}"
    case Trophy = "\u{f356}"
    case Tshirt = "\u{f4f7}"
    case TshirtOutline = "\u{f4f6}"
    case Umbrella = "\u{f2b7}"
    case University = "\u{f357}"
    case Unlocked = "\u{f254}"
    case Upload = "\u{f255}"
    case Usb = "\u{f2b8}"
    case Videocamera = "\u{f256}"
    case VolumeHigh = "\u{f257}"
    case VolumeLow = "\u{f258}"
    case VolumeMedium = "\u{f259}"
    case VolumeMute = "\u{f25a}"
    case Wand = "\u{f358}"
    case Waterdrop = "\u{f25b}"
    case Wifi = "\u{f25c}"
    case Wineglass = "\u{f2b9}"
    case Woman = "\u{f25d}"
    case Wrench = "\u{f2ba}"
    case Xbox = "\u{f30c}"
}

public let ioniconClasses = [
    "ion-alert" : "\u{f101}",
    "ion-alert-circled" : "\u{f100}",
    "ion-android-add" : "\u{f2c7}",
    "ion-android-add-circle" : "\u{f359}",
    "ion-android-alarm-clock" : "\u{f35a}",
    "ion-android-alert" : "\u{f35b}",
    "ion-android-apps" : "\u{f35c}",
    "ion-android-archive" : "\u{f2c9}",
    "ion-android-arrow-back" : "\u{f2ca}",
    "ion-android-arrow-down" : "\u{f35d}",
    "ion-android-arrow-dropdown" : "\u{f35f}",
    "ion-android-arrow-dropdown-circle" : "\u{f35e}",
    "ion-android-arrow-dropleft" : "\u{f361}",
    "ion-android-arrow-dropleft-circle" : "\u{f360}",
    "ion-android-arrow-dropright" : "\u{f363}",
    "ion-android-arrow-dropright-circle" : "\u{f362}",
    "ion-android-arrow-dropup" : "\u{f365}",
    "ion-android-arrow-dropup-circle" : "\u{f364}",
    "ion-android-arrow-forward" : "\u{f30f}",
    "ion-android-arrow-up" : "\u{f366}",
    "ion-android-attach" : "\u{f367}",
    "ion-android-bar" : "\u{f368}",
    "ion-android-bicycle" : "\u{f369}",
    "ion-android-boat" : "\u{f36a}",
    "ion-android-bookmark" : "\u{f36b}",
    "ion-android-bulb" : "\u{f36c}",
    "ion-android-bus" : "\u{f36d}",
    "ion-android-calendar" : "\u{f2d1}",
    "ion-android-call" : "\u{f2d2}",
    "ion-android-camera" : "\u{f2d3}",
    "ion-android-cancel" : "\u{f36e}",
    "ion-android-car" : "\u{f36f}",
    "ion-android-cart" : "\u{f370}",
    "ion-android-chat" : "\u{f2d4}",
    "ion-android-checkbox" : "\u{f374}",
    "ion-android-checkbox-blank" : "\u{f371}",
    "ion-android-checkbox-outline" : "\u{f373}",
    "ion-android-checkbox-outline-blank" : "\u{f372}",
    "ion-android-checkmark-circle" : "\u{f375}",
    "ion-android-clipboard" : "\u{f376}",
    "ion-android-close" : "\u{f2d7}",
    "ion-android-cloud" : "\u{f37a}",
    "ion-android-cloud-circle" : "\u{f377}",
    "ion-android-cloud-done" : "\u{f378}",
    "ion-android-cloud-outline" : "\u{f379}",
    "ion-android-color-palette" : "\u{f37b}",
    "ion-android-compass" : "\u{f37c}",
    "ion-android-contact" : "\u{f2d8}",
    "ion-android-contacts" : "\u{f2d9}",
    "ion-android-contract" : "\u{f37d}",
    "ion-android-create" : "\u{f37e}",
    "ion-android-delete" : "\u{f37f}",
    "ion-android-desktop" : "\u{f380}",
    "ion-android-document" : "\u{f381}",
    "ion-android-done" : "\u{f383}",
    "ion-android-done-all" : "\u{f382}",
    "ion-android-download" : "\u{f2dd}",
    "ion-android-drafts" : "\u{f384}",
    "ion-android-exit" : "\u{f385}",
    "ion-android-expand" : "\u{f386}",
    "ion-android-favorite" : "\u{f388}",
    "ion-android-favorite-outline" : "\u{f387}",
    "ion-android-film" : "\u{f389}",
    "ion-android-folder" : "\u{f2e0}",
    "ion-android-folder-open" : "\u{f38a}",
    "ion-android-funnel" : "\u{f38b}",
    "ion-android-globe" : "\u{f38c}",
    "ion-android-hand" : "\u{f2e3}",
    "ion-android-hangout" : "\u{f38d}",
    "ion-android-happy" : "\u{f38e}",
    "ion-android-home" : "\u{f38f}",
    "ion-android-image" : "\u{f2e4}",
    "ion-android-laptop" : "\u{f390}",
    "ion-android-list" : "\u{f391}",
    "ion-android-locate" : "\u{f2e9}",
    "ion-android-lock" : "\u{f392}",
    "ion-android-mail" : "\u{f2eb}",
    "ion-android-map" : "\u{f393}",
    "ion-android-menu" : "\u{f394}",
    "ion-android-microphone" : "\u{f2ec}",
    "ion-android-microphone-off" : "\u{f395}",
    "ion-android-more-horizontal" : "\u{f396}",
    "ion-android-more-vertical" : "\u{f397}",
    "ion-android-navigate" : "\u{f398}",
    "ion-android-notifications" : "\u{f39b}",
    "ion-android-notifications-none" : "\u{f399}",
    "ion-android-notifications-off" : "\u{f39a}",
    "ion-android-open" : "\u{f39c}",
    "ion-android-options" : "\u{f39d}",
    "ion-android-people" : "\u{f39e}",
    "ion-android-person" : "\u{f3a0}",
    "ion-android-person-add" : "\u{f39f}",
    "ion-android-phone-landscape" : "\u{f3a1}",
    "ion-android-phone-portrait" : "\u{f3a2}",
    "ion-android-pin" : "\u{f3a3}",
    "ion-android-plane" : "\u{f3a4}",
    "ion-android-playstore" : "\u{f2f0}",
    "ion-android-print" : "\u{f3a5}",
    "ion-android-radio-button-off" : "\u{f3a6}",
    "ion-android-radio-button-on" : "\u{f3a7}",
    "ion-android-refresh" : "\u{f3a8}",
    "ion-android-remove" : "\u{f2f4}",
    "ion-android-remove-circle" : "\u{f3a9}",
    "ion-android-restaurant" : "\u{f3aa}",
    "ion-android-sad" : "\u{f3ab}",
    "ion-android-search" : "\u{f2f5}",
    "ion-android-send" : "\u{f2f6}",
    "ion-android-settings" : "\u{f2f7}",
    "ion-android-share" : "\u{f2f8}",
    "ion-android-share-alt" : "\u{f3ac}",
    "ion-android-star" : "\u{f2fc}",
    "ion-android-star-half" : "\u{f3ad}",
    "ion-android-star-outline" : "\u{f3ae}",
    "ion-android-stopwatch" : "\u{f2fd}",
    "ion-android-subway" : "\u{f3af}",
    "ion-android-sunny" : "\u{f3b0}",
    "ion-android-sync" : "\u{f3b1}",
    "ion-android-textsms" : "\u{f3b2}",
    "ion-android-time" : "\u{f3b3}",
    "ion-android-train" : "\u{f3b4}",
    "ion-android-unlock" : "\u{f3b5}",
    "ion-android-upload" : "\u{f3b6}",
    "ion-android-volume-down" : "\u{f3b7}",
    "ion-android-volume-mute" : "\u{f3b8}",
    "ion-android-volume-off" : "\u{f3b9}",
    "ion-android-volume-up" : "\u{f3ba}",
    "ion-android-walk" : "\u{f3bb}",
    "ion-android-warning" : "\u{f3bc}",
    "ion-android-watch" : "\u{f3bd}",
    "ion-android-wifi" : "\u{f305}",
    "ion-aperture" : "\u{f313}",
    "ion-archive" : "\u{f102}",
    "ion-arrow-down-a" : "\u{f103}",
    "ion-arrow-down-b" : "\u{f104}",
    "ion-arrow-down-c" : "\u{f105}",
    "ion-arrow-expand" : "\u{f25e}",
    "ion-arrow-graph-down-left" : "\u{f25f}",
    "ion-arrow-graph-down-right" : "\u{f260}",
    "ion-arrow-graph-up-left" : "\u{f261}",
    "ion-arrow-graph-up-right" : "\u{f262}",
    "ion-arrow-left-a" : "\u{f106}",
    "ion-arrow-left-b" : "\u{f107}",
    "ion-arrow-left-c" : "\u{f108}",
    "ion-arrow-move" : "\u{f263}",
    "ion-arrow-resize" : "\u{f264}",
    "ion-arrow-return-left" : "\u{f265}",
    "ion-arrow-return-right" : "\u{f266}",
    "ion-arrow-right-a" : "\u{f109}",
    "ion-arrow-right-b" : "\u{f10a}",
    "ion-arrow-right-c" : "\u{f10b}",
    "ion-arrow-shrink" : "\u{f267}",
    "ion-arrow-swap" : "\u{f268}",
    "ion-arrow-up-a" : "\u{f10c}",
    "ion-arrow-up-b" : "\u{f10d}",
    "ion-arrow-up-c" : "\u{f10e}",
    "ion-asterisk" : "\u{f314}",
    "ion-at" : "\u{f10f}",
    "ion-backspace" : "\u{f3bf}",
    "ion-backspace-outline" : "\u{f3be}",
    "ion-bag" : "\u{f110}",
    "ion-battery-charging" : "\u{f111}",
    "ion-battery-empty" : "\u{f112}",
    "ion-battery-full" : "\u{f113}",
    "ion-battery-half" : "\u{f114}",
    "ion-battery-low" : "\u{f115}",
    "ion-beaker" : "\u{f269}",
    "ion-beer" : "\u{f26a}",
    "ion-bluetooth" : "\u{f116}",
    "ion-bonfire" : "\u{f315}",
    "ion-bookmark" : "\u{f26b}",
    "ion-bowtie" : "\u{f3c0}",
    "ion-briefcase" : "\u{f26c}",
    "ion-bug" : "\u{f2be}",
    "ion-calculator" : "\u{f26d}",
    "ion-calendar" : "\u{f117}",
    "ion-camera" : "\u{f118}",
    "ion-card" : "\u{f119}",
    "ion-cash" : "\u{f316}",
    "ion-chatbox" : "\u{f11b}",
    "ion-chatbox-working" : "\u{f11a}",
    "ion-chatboxes" : "\u{f11c}",
    "ion-chatbubble" : "\u{f11e}",
    "ion-chatbubble-working" : "\u{f11d}",
    "ion-chatbubbles" : "\u{f11f}",
    "ion-checkmark" : "\u{f122}",
    "ion-checkmark-circled" : "\u{f120}",
    "ion-checkmark-round" : "\u{f121}",
    "ion-chevron-down" : "\u{f123}",
    "ion-chevron-left" : "\u{f124}",
    "ion-chevron-right" : "\u{f125}",
    "ion-chevron-up" : "\u{f126}",
    "ion-clipboard" : "\u{f127}",
    "ion-clock" : "\u{f26e}",
    "ion-close" : "\u{f12a}",
    "ion-close-circled" : "\u{f128}",
    "ion-close-round" : "\u{f129}",
    "ion-closed-captioning" : "\u{f317}",
    "ion-cloud" : "\u{f12b}",
    "ion-code" : "\u{f271}",
    "ion-code-download" : "\u{f26f}",
    "ion-code-working" : "\u{f270}",
    "ion-coffee" : "\u{f272}",
    "ion-compass" : "\u{f273}",
    "ion-compose" : "\u{f12c}",
    "ion-connection-bars" : "\u{f274}",
    "ion-contrast" : "\u{f275}",
    "ion-crop" : "\u{f3c1}",
    "ion-cube" : "\u{f318}",
    "ion-disc" : "\u{f12d}",
    "ion-document" : "\u{f12f}",
    "ion-document-text" : "\u{f12e}",
    "ion-drag" : "\u{f130}",
    "ion-earth" : "\u{f276}",
    "ion-easel" : "\u{f3c2}",
    "ion-edit" : "\u{f2bf}",
    "ion-egg" : "\u{f277}",
    "ion-eject" : "\u{f131}",
    "ion-email" : "\u{f132}",
    "ion-email-unread" : "\u{f3c3}",
    "ion-erlenmeyer-flask" : "\u{f3c5}",
    "ion-erlenmeyer-flask-bubbles" : "\u{f3c4}",
    "ion-eye" : "\u{f133}",
    "ion-eye-disabled" : "\u{f306}",
    "ion-female" : "\u{f278}",
    "ion-filing" : "\u{f134}",
    "ion-film-marker" : "\u{f135}",
    "ion-fireball" : "\u{f319}",
    "ion-flag" : "\u{f279}",
    "ion-flame" : "\u{f31a}",
    "ion-flash" : "\u{f137}",
    "ion-flash-off" : "\u{f136}",
    "ion-folder" : "\u{f139}",
    "ion-fork" : "\u{f27a}",
    "ion-fork-repo" : "\u{f2c0}",
    "ion-forward" : "\u{f13a}",
    "ion-funnel" : "\u{f31b}",
    "ion-gear-a" : "\u{f13d}",
    "ion-gear-b" : "\u{f13e}",
    "ion-grid" : "\u{f13f}",
    "ion-hammer" : "\u{f27b}",
    "ion-happy" : "\u{f31c}",
    "ion-happy-outline" : "\u{f3c6}",
    "ion-headphone" : "\u{f140}",
    "ion-heart" : "\u{f141}",
    "ion-heart-broken" : "\u{f31d}",
    "ion-help" : "\u{f143}",
    "ion-help-buoy" : "\u{f27c}",
    "ion-help-circled" : "\u{f142}",
    "ion-home" : "\u{f144}",
    "ion-icecream" : "\u{f27d}",
    "ion-image" : "\u{f147}",
    "ion-images" : "\u{f148}",
    "ion-information" : "\u{f14a}",
    "ion-information-circled" : "\u{f149}",
    "ion-ionic" : "\u{f14b}",
    "ion-ios-alarm" : "\u{f3c8}",
    "ion-ios-alarm-outline" : "\u{f3c7}",
    "ion-ios-albums" : "\u{f3ca}",
    "ion-ios-albums-outline" : "\u{f3c9}",
    "ion-ios-americanfootball" : "\u{f3cc}",
    "ion-ios-americanfootball-outline" : "\u{f3cb}",
    "ion-ios-analytics" : "\u{f3ce}",
    "ion-ios-analytics-outline" : "\u{f3cd}",
    "ion-ios-arrow-back" : "\u{f3cf}",
    "ion-ios-arrow-down" : "\u{f3d0}",
    "ion-ios-arrow-forward" : "\u{f3d1}",
    "ion-ios-arrow-left" : "\u{f3d2}",
    "ion-ios-arrow-right" : "\u{f3d3}",
    "ion-ios-arrow-thin-down" : "\u{f3d4}",
    "ion-ios-arrow-thin-left" : "\u{f3d5}",
    "ion-ios-arrow-thin-right" : "\u{f3d6}",
    "ion-ios-arrow-thin-up" : "\u{f3d7}",
    "ion-ios-arrow-up" : "\u{f3d8}",
    "ion-ios-at" : "\u{f3da}",
    "ion-ios-at-outline" : "\u{f3d9}",
    "ion-ios-barcode" : "\u{f3dc}",
    "ion-ios-barcode-outline" : "\u{f3db}",
    "ion-ios-baseball" : "\u{f3de}",
    "ion-ios-baseball-outline" : "\u{f3dd}",
    "ion-ios-basketball" : "\u{f3e0}",
    "ion-ios-basketball-outline" : "\u{f3df}",
    "ion-ios-bell" : "\u{f3e2}",
    "ion-ios-bell-outline" : "\u{f3e1}",
    "ion-ios-body" : "\u{f3e4}",
    "ion-ios-body-outline" : "\u{f3e3}",
    "ion-ios-bolt" : "\u{f3e6}",
    "ion-ios-bolt-outline" : "\u{f3e5}",
    "ion-ios-book" : "\u{f3e8}",
    "ion-ios-book-outline" : "\u{f3e7}",
    "ion-ios-bookmarks" : "\u{f3ea}",
    "ion-ios-bookmarks-outline" : "\u{f3e9}",
    "ion-ios-box" : "\u{f3ec}",
    "ion-ios-box-outline" : "\u{f3eb}",
    "ion-ios-briefcase" : "\u{f3ee}",
    "ion-ios-briefcase-outline" : "\u{f3ed}",
    "ion-ios-browsers" : "\u{f3f0}",
    "ion-ios-browsers-outline" : "\u{f3ef}",
    "ion-ios-calculator" : "\u{f3f2}",
    "ion-ios-calculator-outline" : "\u{f3f1}",
    "ion-ios-calendar" : "\u{f3f4}",
    "ion-ios-calendar-outline" : "\u{f3f3}",
    "ion-ios-camera" : "\u{f3f6}",
    "ion-ios-camera-outline" : "\u{f3f5}",
    "ion-ios-cart" : "\u{f3f8}",
    "ion-ios-cart-outline" : "\u{f3f7}",
    "ion-ios-chatboxes" : "\u{f3fa}",
    "ion-ios-chatboxes-outline" : "\u{f3f9}",
    "ion-ios-chatbubble" : "\u{f3fc}",
    "ion-ios-chatbubble-outline" : "\u{f3fb}",
    "ion-ios-checkmark" : "\u{f3ff}",
    "ion-ios-checkmark-empty" : "\u{f3fd}",
    "ion-ios-checkmark-outline" : "\u{f3fe}",
    "ion-ios-circle-filled" : "\u{f400}",
    "ion-ios-circle-outline" : "\u{f401}",
    "ion-ios-clock" : "\u{f403}",
    "ion-ios-clock-outline" : "\u{f402}",
    "ion-ios-close" : "\u{f406}",
    "ion-ios-close-empty" : "\u{f404}",
    "ion-ios-close-outline" : "\u{f405}",
    "ion-ios-cloud" : "\u{f40c}",
    "ion-ios-cloud-download" : "\u{f408}",
    "ion-ios-cloud-download-outline" : "\u{f407}",
    "ion-ios-cloud-outline" : "\u{f409}",
    "ion-ios-cloud-upload" : "\u{f40b}",
    "ion-ios-cloud-upload-outline" : "\u{f40a}",
    "ion-ios-cloudy" : "\u{f410}",
    "ion-ios-cloudy-night" : "\u{f40e}",
    "ion-ios-cloudy-night-outline" : "\u{f40d}",
    "ion-ios-cloudy-outline" : "\u{f40f}",
    "ion-ios-cog" : "\u{f412}",
    "ion-ios-cog-outline" : "\u{f411}",
    "ion-ios-color-filter" : "\u{f414}",
    "ion-ios-color-filter-outline" : "\u{f413}",
    "ion-ios-color-wand" : "\u{f416}",
    "ion-ios-color-wand-outline" : "\u{f415}",
    "ion-ios-compose" : "\u{f418}",
    "ion-ios-compose-outline" : "\u{f417}",
    "ion-ios-contact" : "\u{f41a}",
    "ion-ios-contact-outline" : "\u{f419}",
    "ion-ios-copy" : "\u{f41c}",
    "ion-ios-copy-outline" : "\u{f41b}",
    "ion-ios-crop" : "\u{f41e}",
    "ion-ios-crop-strong" : "\u{f41d}",
    "ion-ios-download" : "\u{f420}",
    "ion-ios-download-outline" : "\u{f41f}",
    "ion-ios-drag" : "\u{f421}",
    "ion-ios-email" : "\u{f423}",
    "ion-ios-email-outline" : "\u{f422}",
    "ion-ios-eye" : "\u{f425}",
    "ion-ios-eye-outline" : "\u{f424}",
    "ion-ios-fastforward" : "\u{f427}",
    "ion-ios-fastforward-outline" : "\u{f426}",
    "ion-ios-filing" : "\u{f429}",
    "ion-ios-filing-outline" : "\u{f428}",
    "ion-ios-film" : "\u{f42b}",
    "ion-ios-film-outline" : "\u{f42a}",
    "ion-ios-flag" : "\u{f42d}",
    "ion-ios-flag-outline" : "\u{f42c}",
    "ion-ios-flame" : "\u{f42f}",
    "ion-ios-flame-outline" : "\u{f42e}",
    "ion-ios-flask" : "\u{f431}",
    "ion-ios-flask-outline" : "\u{f430}",
    "ion-ios-flower" : "\u{f433}",
    "ion-ios-flower-outline" : "\u{f432}",
    "ion-ios-folder" : "\u{f435}",
    "ion-ios-folder-outline" : "\u{f434}",
    "ion-ios-football" : "\u{f437}",
    "ion-ios-football-outline" : "\u{f436}",
    "ion-ios-game-controller-a" : "\u{f439}",
    "ion-ios-game-controller-a-outline" : "\u{f438}",
    "ion-ios-game-controller-b" : "\u{f43b}",
    "ion-ios-game-controller-b-outline" : "\u{f43a}",
    "ion-ios-gear" : "\u{f43d}",
    "ion-ios-gear-outline" : "\u{f43c}",
    "ion-ios-glasses" : "\u{f43f}",
    "ion-ios-glasses-outline" : "\u{f43e}",
    "ion-ios-grid-view" : "\u{f441}",
    "ion-ios-grid-view-outline" : "\u{f440}",
    "ion-ios-heart" : "\u{f443}",
    "ion-ios-heart-outline" : "\u{f442}",
    "ion-ios-help" : "\u{f446}",
    "ion-ios-help-empty" : "\u{f444}",
    "ion-ios-help-outline" : "\u{f445}",
    "ion-ios-home" : "\u{f448}",
    "ion-ios-home-outline" : "\u{f447}",
    "ion-ios-infinite" : "\u{f44a}",
    "ion-ios-infinite-outline" : "\u{f449}",
    "ion-ios-information" : "\u{f44d}",
    "ion-ios-information-empty" : "\u{f44b}",
    "ion-ios-information-outline" : "\u{f44c}",
    "ion-ios-ionic-outline" : "\u{f44e}",
    "ion-ios-keypad" : "\u{f450}",
    "ion-ios-keypad-outline" : "\u{f44f}",
    "ion-ios-lightbulb" : "\u{f452}",
    "ion-ios-lightbulb-outline" : "\u{f451}",
    "ion-ios-list" : "\u{f454}",
    "ion-ios-list-outline" : "\u{f453}",
    "ion-ios-location" : "\u{f456}",
    "ion-ios-location-outline" : "\u{f455}",
    "ion-ios-locked" : "\u{f458}",
    "ion-ios-locked-outline" : "\u{f457}",
    "ion-ios-loop" : "\u{f45a}",
    "ion-ios-loop-strong" : "\u{f459}",
    "ion-ios-medical" : "\u{f45c}",
    "ion-ios-medical-outline" : "\u{f45b}",
    "ion-ios-medkit" : "\u{f45e}",
    "ion-ios-medkit-outline" : "\u{f45d}",
    "ion-ios-mic" : "\u{f461}",
    "ion-ios-mic-off" : "\u{f45f}",
    "ion-ios-mic-outline" : "\u{f460}",
    "ion-ios-minus" : "\u{f464}",
    "ion-ios-minus-empty" : "\u{f462}",
    "ion-ios-minus-outline" : "\u{f463}",
    "ion-ios-monitor" : "\u{f466}",
    "ion-ios-monitor-outline" : "\u{f465}",
    "ion-ios-moon" : "\u{f468}",
    "ion-ios-moon-outline" : "\u{f467}",
    "ion-ios-more" : "\u{f46a}",
    "ion-ios-more-outline" : "\u{f469}",
    "ion-ios-musical-note" : "\u{f46b}",
    "ion-ios-musical-notes" : "\u{f46c}",
    "ion-ios-navigate" : "\u{f46e}",
    "ion-ios-navigate-outline" : "\u{f46d}",
    "ion-ios-nutrition" : "\u{f470}",
    "ion-ios-nutrition-outline" : "\u{f46f}",
    "ion-ios-paper" : "\u{f472}",
    "ion-ios-paper-outline" : "\u{f471}",
    "ion-ios-paperplane" : "\u{f474}",
    "ion-ios-paperplane-outline" : "\u{f473}",
    "ion-ios-partlysunny" : "\u{f476}",
    "ion-ios-partlysunny-outline" : "\u{f475}",
    "ion-ios-pause" : "\u{f478}",
    "ion-ios-pause-outline" : "\u{f477}",
    "ion-ios-paw" : "\u{f47a}",
    "ion-ios-paw-outline" : "\u{f479}",
    "ion-ios-people" : "\u{f47c}",
    "ion-ios-people-outline" : "\u{f47b}",
    "ion-ios-person" : "\u{f47e}",
    "ion-ios-person-outline" : "\u{f47d}",
    "ion-ios-personadd" : "\u{f480}",
    "ion-ios-personadd-outline" : "\u{f47f}",
    "ion-ios-photos" : "\u{f482}",
    "ion-ios-photos-outline" : "\u{f481}",
    "ion-ios-pie" : "\u{f484}",
    "ion-ios-pie-outline" : "\u{f483}",
    "ion-ios-pint" : "\u{f486}",
    "ion-ios-pint-outline" : "\u{f485}",
    "ion-ios-play" : "\u{f488}",
    "ion-ios-play-outline" : "\u{f487}",
    "ion-ios-plus" : "\u{f48b}",
    "ion-ios-plus-empty" : "\u{f489}",
    "ion-ios-plus-outline" : "\u{f48a}",
    "ion-ios-pricetag" : "\u{f48d}",
    "ion-ios-pricetag-outline" : "\u{f48c}",
    "ion-ios-pricetags" : "\u{f48f}",
    "ion-ios-pricetags-outline" : "\u{f48e}",
    "ion-ios-printer" : "\u{f491}",
    "ion-ios-printer-outline" : "\u{f490}",
    "ion-ios-pulse" : "\u{f493}",
    "ion-ios-pulse-strong" : "\u{f492}",
    "ion-ios-rainy" : "\u{f495}",
    "ion-ios-rainy-outline" : "\u{f494}",
    "ion-ios-recording" : "\u{f497}",
    "ion-ios-recording-outline" : "\u{f496}",
    "ion-ios-redo" : "\u{f499}",
    "ion-ios-redo-outline" : "\u{f498}",
    "ion-ios-refresh" : "\u{f49c}",
    "ion-ios-refresh-empty" : "\u{f49a}",
    "ion-ios-refresh-outline" : "\u{f49b}",
    "ion-ios-reload" : "\u{f49d}",
    "ion-ios-reverse-camera" : "\u{f49f}",
    "ion-ios-reverse-camera-outline" : "\u{f49e}",
    "ion-ios-rewind" : "\u{f4a1}",
    "ion-ios-rewind-outline" : "\u{f4a0}",
    "ion-ios-rose" : "\u{f4a3}",
    "ion-ios-rose-outline" : "\u{f4a2}",
    "ion-ios-search" : "\u{f4a5}",
    "ion-ios-search-strong" : "\u{f4a4}",
    "ion-ios-settings" : "\u{f4a7}",
    "ion-ios-settings-strong" : "\u{f4a6}",
    "ion-ios-shuffle" : "\u{f4a9}",
    "ion-ios-shuffle-strong" : "\u{f4a8}",
    "ion-ios-skipbackward" : "\u{f4ab}",
    "ion-ios-skipbackward-outline" : "\u{f4aa}",
    "ion-ios-skipforward" : "\u{f4ad}",
    "ion-ios-skipforward-outline" : "\u{f4ac}",
    "ion-ios-snowy" : "\u{f4ae}",
    "ion-ios-speedometer" : "\u{f4b0}",
    "ion-ios-speedometer-outline" : "\u{f4af}",
    "ion-ios-star" : "\u{f4b3}",
    "ion-ios-star-half" : "\u{f4b1}",
    "ion-ios-star-outline" : "\u{f4b2}",
    "ion-ios-stopwatch" : "\u{f4b5}",
    "ion-ios-stopwatch-outline" : "\u{f4b4}",
    "ion-ios-sunny" : "\u{f4b7}",
    "ion-ios-sunny-outline" : "\u{f4b6}",
    "ion-ios-telephone" : "\u{f4b9}",
    "ion-ios-telephone-outline" : "\u{f4b8}",
    "ion-ios-tennisball" : "\u{f4bb}",
    "ion-ios-tennisball-outline" : "\u{f4ba}",
    "ion-ios-thunderstorm" : "\u{f4bd}",
    "ion-ios-thunderstorm-outline" : "\u{f4bc}",
    "ion-ios-time" : "\u{f4bf}",
    "ion-ios-time-outline" : "\u{f4be}",
    "ion-ios-timer" : "\u{f4c1}",
    "ion-ios-timer-outline" : "\u{f4c0}",
    "ion-ios-toggle" : "\u{f4c3}",
    "ion-ios-toggle-outline" : "\u{f4c2}",
    "ion-ios-trash" : "\u{f4c5}",
    "ion-ios-trash-outline" : "\u{f4c4}",
    "ion-ios-undo" : "\u{f4c7}",
    "ion-ios-undo-outline" : "\u{f4c6}",
    "ion-ios-unlocked" : "\u{f4c9}",
    "ion-ios-unlocked-outline" : "\u{f4c8}",
    "ion-ios-upload" : "\u{f4cb}",
    "ion-ios-upload-outline" : "\u{f4ca}",
    "ion-ios-videocam" : "\u{f4cd}",
    "ion-ios-videocam-outline" : "\u{f4cc}",
    "ion-ios-volume-high" : "\u{f4ce}",
    "ion-ios-volume-low" : "\u{f4cf}",
    "ion-ios-wineglass" : "\u{f4d1}",
    "ion-ios-wineglass-outline" : "\u{f4d0}",
    "ion-ios-world" : "\u{f4d3}",
    "ion-ios-world-outline" : "\u{f4d2}",
    "ion-ipad" : "\u{f1f9}",
    "ion-iphone" : "\u{f1fa}",
    "ion-ipod" : "\u{f1fb}",
    "ion-jet" : "\u{f295}",
    "ion-key" : "\u{f296}",
    "ion-knife" : "\u{f297}",
    "ion-laptop" : "\u{f1fc}",
    "ion-leaf" : "\u{f1fd}",
    "ion-levels" : "\u{f298}",
    "ion-lightbulb" : "\u{f299}",
    "ion-link" : "\u{f1fe}",
    "ion-load-a" : "\u{f29a}",
    "ion-load-b" : "\u{f29b}",
    "ion-load-c" : "\u{f29c}",
    "ion-load-d" : "\u{f29d}",
    "ion-location" : "\u{f1ff}",
    "ion-lock-combination" : "\u{f4d4}",
    "ion-locked" : "\u{f200}",
    "ion-log-in" : "\u{f29e}",
    "ion-log-out" : "\u{f29f}",
    "ion-loop" : "\u{f201}",
    "ion-magnet" : "\u{f2a0}",
    "ion-male" : "\u{f2a1}",
    "ion-man" : "\u{f202}",
    "ion-map" : "\u{f203}",
    "ion-medkit" : "\u{f2a2}",
    "ion-merge" : "\u{f33f}",
    "ion-mic-a" : "\u{f204}",
    "ion-mic-b" : "\u{f205}",
    "ion-mic-c" : "\u{f206}",
    "ion-minus" : "\u{f209}",
    "ion-minus-circled" : "\u{f207}",
    "ion-minus-round" : "\u{f208}",
    "ion-model-s" : "\u{f2c1}",
    "ion-monitor" : "\u{f20a}",
    "ion-more" : "\u{f20b}",
    "ion-mouse" : "\u{f340}",
    "ion-music-note" : "\u{f20c}",
    "ion-navicon" : "\u{f20e}",
    "ion-navicon-round" : "\u{f20d}",
    "ion-navigate" : "\u{f2a3}",
    "ion-network" : "\u{f341}",
    "ion-no-smoking" : "\u{f2c2}",
    "ion-nuclear" : "\u{f2a4}",
    "ion-outlet" : "\u{f342}",
    "ion-paintbrush" : "\u{f4d5}",
    "ion-paintbucket" : "\u{f4d6}",
    "ion-paper-airplane" : "\u{f2c3}",
    "ion-paperclip" : "\u{f20f}",
    "ion-pause" : "\u{f210}",
    "ion-person" : "\u{f213}",
    "ion-person-add" : "\u{f211}",
    "ion-person-stalker" : "\u{f212}",
    "ion-pie-graph" : "\u{f2a5}",
    "ion-pin" : "\u{f2a6}",
    "ion-pinpoint" : "\u{f2a7}",
    "ion-pizza" : "\u{f2a8}",
    "ion-plane" : "\u{f214}",
    "ion-planet" : "\u{f343}",
    "ion-play" : "\u{f215}",
    "ion-playstation" : "\u{f30a}",
    "ion-plus" : "\u{f218}",
    "ion-plus-circled" : "\u{f216}",
    "ion-plus-round" : "\u{f217}",
    "ion-podium" : "\u{f344}",
    "ion-pound" : "\u{f219}",
    "ion-power" : "\u{f2a9}",
    "ion-pricetag" : "\u{f2aa}",
    "ion-pricetags" : "\u{f2ab}",
    "ion-printer" : "\u{f21a}",
    "ion-pull-request" : "\u{f345}",
    "ion-qr-scanner" : "\u{f346}",
    "ion-quote" : "\u{f347}",
    "ion-radio-waves" : "\u{f2ac}",
    "ion-record" : "\u{f21b}",
    "ion-refresh" : "\u{f21c}",
    "ion-reply" : "\u{f21e}",
    "ion-reply-all" : "\u{f21d}",
    "ion-ribbon-a" : "\u{f348}",
    "ion-ribbon-b" : "\u{f349}",
    "ion-sad" : "\u{f34a}",
    "ion-sad-outline" : "\u{f4d7}",
    "ion-scissors" : "\u{f34b}",
    "ion-search" : "\u{f21f}",
    "ion-settings" : "\u{f2ad}",
    "ion-share" : "\u{f220}",
    "ion-shuffle" : "\u{f221}",
    "ion-skip-backward" : "\u{f222}",
    "ion-skip-forward" : "\u{f223}",
    "ion-social-android" : "\u{f225}",
    "ion-social-android-outline" : "\u{f224}",
    "ion-social-angular" : "\u{f4d9}",
    "ion-social-angular-outline" : "\u{f4d8}",
    "ion-social-apple" : "\u{f227}",
    "ion-social-apple-outline" : "\u{f226}",
    "ion-social-bitcoin" : "\u{f2af}",
    "ion-social-bitcoin-outline" : "\u{f2ae}",
    "ion-social-buffer" : "\u{f229}",
    "ion-social-buffer-outline" : "\u{f228}",
    "ion-social-chrome" : "\u{f4db}",
    "ion-social-chrome-outline" : "\u{f4da}",
    "ion-social-codepen" : "\u{f4dd}",
    "ion-social-codepen-outline" : "\u{f4dc}",
    "ion-social-css3" : "\u{f4df}",
    "ion-social-css3-outline" : "\u{f4de}",
    "ion-social-designernews" : "\u{f22b}",
    "ion-social-designernews-outline" : "\u{f22a}",
    "ion-social-dribbble" : "\u{f22d}",
    "ion-social-dribbble-outline" : "\u{f22c}",
    "ion-social-dropbox" : "\u{f22f}",
    "ion-social-dropbox-outline" : "\u{f22e}",
    "ion-social-euro" : "\u{f4e1}",
    "ion-social-euro-outline" : "\u{f4e0}",
    "ion-social-facebook" : "\u{f231}",
    "ion-social-facebook-outline" : "\u{f230}",
    "ion-social-foursquare" : "\u{f34d}",
    "ion-social-foursquare-outline" : "\u{f34c}",
    "ion-social-freebsd-devil" : "\u{f2c4}",
    "ion-social-github" : "\u{f233}",
    "ion-social-github-outline" : "\u{f232}",
    "ion-social-google" : "\u{f34f}",
    "ion-social-google-outline" : "\u{f34e}",
    "ion-social-googleplus" : "\u{f235}",
    "ion-social-googleplus-outline" : "\u{f234}",
    "ion-social-hackernews" : "\u{f237}",
    "ion-social-hackernews-outline" : "\u{f236}",
    "ion-social-html5" : "\u{f4e3}",
    "ion-social-html5-outline" : "\u{f4e2}",
    "ion-social-instagram" : "\u{f351}",
    "ion-social-instagram-outline" : "\u{f350}",
    "ion-social-javascript" : "\u{f4e5}",
    "ion-social-javascript-outline" : "\u{f4e4}",
    "ion-social-linkedin" : "\u{f239}",
    "ion-social-linkedin-outline" : "\u{f238}",
    "ion-social-markdown" : "\u{f4e6}",
    "ion-social-nodejs" : "\u{f4e7}",
    "ion-social-octocat" : "\u{f4e8}",
    "ion-social-pinterest" : "\u{f2b1}",
    "ion-social-pinterest-outline" : "\u{f2b0}",
    "ion-social-python" : "\u{f4e9}",
    "ion-social-reddit" : "\u{f23b}",
    "ion-social-reddit-outline" : "\u{f23a}",
    "ion-social-rss" : "\u{f23d}",
    "ion-social-rss-outline" : "\u{f23c}",
    "ion-social-sass" : "\u{f4ea}",
    "ion-social-skype" : "\u{f23f}",
    "ion-social-skype-outline" : "\u{f23e}",
    "ion-social-snapchat" : "\u{f4ec}",
    "ion-social-snapchat-outline" : "\u{f4eb}",
    "ion-social-tumblr" : "\u{f241}",
    "ion-social-tumblr-outline" : "\u{f240}",
    "ion-social-tux" : "\u{f2c5}",
    "ion-social-twitch" : "\u{f4ee}",
    "ion-social-twitch-outline" : "\u{f4ed}",
    "ion-social-twitter" : "\u{f243}",
    "ion-social-twitter-outline" : "\u{f242}",
    "ion-social-usd" : "\u{f353}",
    "ion-social-usd-outline" : "\u{f352}",
    "ion-social-vimeo" : "\u{f245}",
    "ion-social-vimeo-outline" : "\u{f244}",
    "ion-social-whatsapp" : "\u{f4f0}",
    "ion-social-whatsapp-outline" : "\u{f4ef}",
    "ion-social-windows" : "\u{f247}",
    "ion-social-windows-outline" : "\u{f246}",
    "ion-social-wordpress" : "\u{f249}",
    "ion-social-wordpress-outline" : "\u{f248}",
    "ion-social-yahoo" : "\u{f24b}",
    "ion-social-yahoo-outline" : "\u{f24a}",
    "ion-social-yen" : "\u{f4f2}",
    "ion-social-yen-outline" : "\u{f4f1}",
    "ion-social-youtube" : "\u{f24d}",
    "ion-social-youtube-outline" : "\u{f24c}",
    "ion-soup-can" : "\u{f4f4}",
    "ion-soup-can-outline" : "\u{f4f3}",
    "ion-speakerphone" : "\u{f2b2}",
    "ion-speedometer" : "\u{f2b3}",
    "ion-spoon" : "\u{f2b4}",
    "ion-star" : "\u{f24e}",
    "ion-stats-bars" : "\u{f2b5}",
    "ion-steam" : "\u{f30b}",
    "ion-stop" : "\u{f24f}",
    "ion-thermometer" : "\u{f2b6}",
    "ion-thumbsdown" : "\u{f250}",
    "ion-thumbsup" : "\u{f251}",
    "ion-toggle" : "\u{f355}",
    "ion-toggle-filled" : "\u{f354}",
    "ion-transgender" : "\u{f4f5}",
    "ion-trash-a" : "\u{f252}",
    "ion-trash-b" : "\u{f253}",
    "ion-trophy" : "\u{f356}",
    "ion-tshirt" : "\u{f4f7}",
    "ion-tshirt-outline" : "\u{f4f6}",
    "ion-umbrella" : "\u{f2b7}",
    "ion-university" : "\u{f357}",
    "ion-unlocked" : "\u{f254}",
    "ion-upload" : "\u{f255}",
    "ion-usb" : "\u{f2b8}",
    "ion-videocamera" : "\u{f256}",
    "ion-volume-high" : "\u{f257}",
    "ion-volume-low" : "\u{f258}",
    "ion-volume-medium" : "\u{f259}",
    "ion-volume-mute" : "\u{f25a}",
    "ion-wand" : "\u{f358}",
    "ion-waterdrop" : "\u{f25b}",
    "ion-wifi" : "\u{f25c}",
    "ion-wineglass" : "\u{f2b9}",
    "ion-woman" : "\u{f25d}",
    "ion-wrench" : "\u{f2ba}",
    "ion-xbox" : "\u{f30c}"
]

public extension String {
    public static func ioniconWithName(name: Ionicon) -> String {
        return name.rawValue.substringToIndex(name.rawValue.startIndex.advancedBy(1))
    }
}

public extension String {
    public static func ioniconWithCode(code: String) -> String? {
        
        if let raw = ioniconClasses[code], icon = Ionicon(rawValue: raw)  {
            return self.ioniconWithName(icon)
        }
        
        return nil
    }
}
