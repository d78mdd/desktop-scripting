/*
[data]
path1=D:\1 Soft' & doc's\AutoHotKey\my scripts\Timer 4\file.ini
path2=C:\Users\d7m\Desktop\tt.txt


[ known bugs ]
(;само при първата дата в новосъздаден файл записва 4 празни реда след брой престои)
записва една дата без ден само със all mouse clicks
[31/март/2012] и следващата е [30/апр/2012] , [01/апр/2012]
;appskey ostava natisnat i posle samo s 'l' se aktivira deistvieto
;--на първата пауза не скрива началния надпис ако е минала <=1 сек

бъгва се в края и началото на месец
now се бъгва


[ old comments ]
някаква стара бележка
  timer е променливата на която (евентуално) автоматично ще се присвоява препоръчвата стойност

(trqbva i da ima ograni4enie sprqmo posledniq prestoi i po4ivka)
(i mi be6e izpisalo 4e "izglejda ima prestoi" a to mai nqma6e) - поправено
(trqbva6e da mi dopylni prestoq do 40min a ne go napravi - pozvoli mi 40 minuti vmesto kolkoto bqha tam 15-25) -поправено
( da ne me izklu4va ot igra (moje bi da izvajda pytq na aktivnata programa;  i ako e vyv"\Fun\" samo da izdava zvuk)


(1. da zapisva presoite i po4ivkite kydeto trqbva) - да
(2. da predlaga  dyljina na prestoite) - до "не"известна степен го прави



[ concept ideas ]
идея:
да се сменя в реално време дължината макар че няма да има много голям ефект щото само за игри и за скайп евентуално ше върши работа
takova ne6to bi bilo prisy6to na v5 moje bi...
или пък - ако Дени е активна да ми предлага удължаване

може бии да дава опция за удължаване в конкретни случаи , като например когато прозорец Дени е активен/съществува

;ako po4ivkata e malka defakto da vzima posledniq prestoi i da go udyljava
;ama mai mnogo 6e e slojno и май няма смисъл



да има възможност примерно заа временна пауза и след това за директно продължаване на престоя (обаче съответно тва ще бъде отразено и във файла)




da 4ete "от ... до ..." i da presmqta... , togava pyk moga da promenq na4ina na zasi4ane i na prestoite - 6te mi trqbvat edinstveno 4asovete na na4aloto i kraq

да има в предвит и почивките в които компа е изключен - да чете самите часове от файла,
тогава пък ще може наистина всичко важно да е в единствен файл - timer restings може би ще бъде само нещо като ф-я само за еднократно изчисляване (а не непрекъсната активност) извиквана в началото на всяка инстанция след първата

izpisva 4e ne sym staval dostaty4no ot 4as koito e star, nai-veroqtno za6toto timer restings ne stoi vklu4en poneje kompa e izklu4en - taka moje da me ograni4i poradi malko zapisani po4ivki vypreki 4e e bil izklu4en s 4asove -> sledovatelno trqbva da razbira tova



kolko vreme e sedqno: v4era, dnes dosega, sredniq mi prestoi za posledniq mesec primerno



v byde6ta versiq bi moglo da vzima ob6tiq prestoi (ot porqdyka na nqkolko 4asa) za vseki den i sprqmo poslednite nqkolko dni da mi opredelq kolko ob6to bih mogyl da sedq teku6tiq den    ...syotvetno podobna konceptualna ideq veroqtno bi bila prilojima i otnosno za cqlata sedmica , a za6to ne i mesec, godina..



;--може би да прилага форматиране така че да записва нещата по колони с определен брой знаци ширина

;moje bi 6e e donqkyde po-lesno ako ne6tata vyv faila se otdelqt - prez 1 red da sa:
;na otdelni redove - dyljina na prestoq, 4as, pri4ina za izhod...



;s funckiqta formattime moje lesno da se preobrazuvat sekundite minutite i 4asovete



; SetTimer е това което ми трябва за всичките тея етикети сочещи се един към друг и чудещи се кой от къде идва
; промелнивата k ще стане излишна






[ small ideas (thoughts) ]
 (IDEQ! - obratna proporcionalnost mejdu sredniq prestoi i prepori4itelniq nov prestoi:)
   (sr. 0-5min -> nov- 40 ; sr. 20min -> nov- 20min ; sr. 40min -> nov 0-5min)
   
   
да оправя прецизността - когато предлага престои/почивки освен че има разминаване 45/15 - 40/10 мин ами и не взима под внимание секундите


; - да има възможност за добавяне на произволно съобщение преди да се изключи
*/



/* versioning
SplashText mymessage vmesto msgbox
disable sleeper variablepп
pause
minimizer.ahk
Minimize virtualbox

1286 - CoordMode, mouse, Screen - be6e relative (wtf?)
click at 0,0 checks time
!x close all running skripts
F6 ima ~ za da rabotqt klavi6ni kombinacii f6 & __ v drugi skriptove (s.ahk)
1076 - min. ON
minimize photo viewer
double click tray icon to exit
tip-а e на 3 реда (ако chasp e now)
LastSleep:=300
жалък опит за промяна на mymessage, не работи след презареждане
<SplashTextOn,,, По-малко от %tr% ?> , със съответните промени
commented else msgbox gre6ka pri inputbox
3 sec blockinput.ahk
махнах затварянето на оненоте при ф6



не се изключва

на Ф6 би трябвало веднъж да показва и word
съобщението One minute left е винаги отгоре и се затваря автоматично
1138 - else exitapp , return
използва файла F7
не стартира skype to sms ако е в ХР-то
бях добавил и "check" в менюто
word:="first time"
би трябвало да ме шредупреждава на последната минута, дефиницията на mymessage вече е След _lp:
промених _calc - вече използва тройния оператор , заемайки 6 вместо 18 реда
около 986ти - най-сложния ред който съм писал - ...((t<120)?(t . " seconds"):(round(t/60) . " mins"))...
около 1112 ред - изчакването на onenote е само ако все още съществува

4.2
автоматично определя размера (и времето) за показване на втория начален надпис според дължината му
833 - добавям времето на почивките по 3 и изваждам последните няколко престоя
 почти винаги от func() - редовно ми даваше по 14 минути след 40минутен престой, другото често беше 5мин , и ми се струва че сега (би трябвало да) предлага малко по-подходящи цифри 
вкл. и разширен F7 - стартира Timer restings, затваря OneNote и deni catcher.ahk
бях изключил F7
return след F6 и F7
сутрин в "here from " вече не изписва вчерашен час - chasp е "" на излизане
path=%a_scriptdir%\file.ini за по-голяма съвместимост
screen_off също вече е съвм. с ХР
съвместимост с ХР - lowercase на месеца щото правеше отделна секция с главна буква
menu items "change", "open_file"
(затваря OneNote на излизане)
ако chasp е ERROR -> now
в tray-a показва от кога седя (не е ставано достатъчно) 'here from %chasp%' , оправено - записва го и го прочита
във втория начален надпис (928 ред) изписва и коя ф-я е задала ст-ст на num
въведено xx и махнато прочитането на num в t_all
сравняване времето с друга променлива (която има ст-ст 60*num), не би трябвало да изпуска автоматичното настройване
timer:=60*num след autoadjust
'ifwinexist ahk_class tSkMainForm' - беше и с името на прозореца, и се бъгваше щото то всеки път е различно понеже съдържа в себе си броя на съобщенията
началния надпис е съкратен ако е първи за деня, съответно и височината му
reorganised notes
махнах скобите на F6
поправен бъг - след рестарт таймера после се затваряше мигновено - преместих модифицираните Sleep над проверката на t (654 ред)
ще пуска skype to sms само ако Skype-а е пуснат

4.1
изчистени някои редове оставени в коментари
вмъкнат кода на auto adjust (само използваните функции)

за сега ще е в отделен splashtext
(позволеното време се изписва в началния надпис който вече си е удължен)
  да обаче изчисленията са след това..
без да искам поправих бъг - f вече няма да се губи при презареждане (и на теория ще може да си показва абсолютните еди колко си минути)
 от 500-я ред на 418-я ред преместих прочитането му
some cool addition:
  tip on mouse icon hover - информация направо от иконката
поправих незначителна грешка - беше wh(width) вместо height

...mislq 4e se e imalo predvit "ry4na promqna na prestoq..."
v4.0:   -   промяна на дължината на престоя в реално време, 'умно' изключване, записване на среднощните престои в правилния ден, автоматично предлага дължина за престоя/почивката в определени ситуации, засичане на почивки

на всички възможни места използва a_scriptdir
имаше дублиращи се променливи - pp в postpone и auto adjust, в първия файл вече е pstp
записва си мястото ВЪВ този файл за да бъде прочитано от timer restings (безсмислено ако не са в една и съща папка)
за пътя на файла използвам вградените променливи
изключих ratio()
на 14.4-ти - на 5-те минути не ме изключи - добавям още прихващащи секунди - засега изглежда е поправено
добавих допълнителни секунди през които да прихваща края на таймера, щото 2-3 пъти днес 13.04. не ме изключи автоматично
поправен бъг - 30-те мин вече могат да се променят ръчно
вече и първия престой си става 30мин , също и : през презареждане си остават 30 - отделно прочитане за брои престои и ако няма данни изобщо не използва timer auto adjust
;изтрих задаването и записването на ch=y във if (R=ERROR || R<=2) и вече си показва винаги началния екран
;goto _F7 защото спря да ме изключва... - засега изглежда бъгът е оправен , но все още нз защо стана така
Поправен бъг - думата след exit reason вече винаги е с 4 символа - защото се бъгваше - сутрин взимаше предходния ден най-вероятно заради фиксирания брой изтривани символи отдясно, които пък невинаги бяха фиксиран брой - logoff, shutdown,...
izklu4ih syob6tenieto za otnositelni i absolutni minuti
4-та автоматична промяна на num - ограничава първите 2-3 престоя за деня до 30мин
promenen nadpis pri F6
msgbox gre6ka pri inputbox
oficialno uspqva vinagi da izpylni screenoff
startira skype to sms samo pri ry4no izklu4vane

3.9:
should be even more amazing - (би трябвало да) записва всеки престой където му е мястото
 s=, m=, h=, startdate i starttime premesteni predi pro4itaneto im 
 i obosobeni sekcii kod s obqsneniq
syzdava faila bez da se prezarejda
;some major changes:
;file creation moved in the begining, starttime/date check after it
;added more code after them
  successfully records information in apropriate day !

;singleinstance force vmesto ignore
;appskey & f , appskey & l , butonite na mi6kata premesteni predi F6 & F7

;3.8: amazing
;за пръв път записах престой започващ след 00 часът в деня на който принадлежи (вчерашния)
; include-вайки (а не run) auto adjust

;3.7:
;appskey+f - open file.ini
;file.ini premesten v papkata na skripta

;3.65:
;'skype to sms' i 'timer restings' mejdu 'pathauto' i 'postpone' a ne v F7
;в заглавието на междинния надпис показва лимита на относителните минути вместо пауза
;krainiq 'pathauto' sled 'lastsleep' predi 'postpone' - s runwait
;'postpone' sled 'lastsleep'
;na4alniq pathauto SLED na4alniq nadpis a ne po vreme na nego
;izbiraemata prodyljitelnost moje da byde realno 4islo (1.5)
;'timer - auto adjust' neposredstveno predi zapo4vane na broeneto i
  predi izhod
;timer restings - zasi4a i po4ivkite
;... - .....
;run auto adjust
;s F7 kato izliza puska 'skype to sms'
;win+l - add exeption
;(sound warning)
;записва броя кликвания с всеки бутон мишката

3.5:
;чрез 'postpone' дава аванс от няколко секунди за последни действия преди излизане
;отделени в папка 'Timer 3' - trtt3, log, screen off и новия postpone
;чрез промени в 'screenoff' затваря OneNote (и скайп минава на 'отпочиващ')
;"exitreason" -> "`, exit reason" ; "`," - bukvalna zapetaika
;след абсолютните минути показва и относителните
;съкратени/леко променени надписи
;notrayicon

;3.461:
;msgbox abs %timer% mins вместо msgbox abs 40mins

;3.46:
;изписва текущия timer в текстовата кутия на new time


;3.45:
;възможност за промяна на timer по време на изпълнение
; записва и чете променливата num
; скрива си (някои) надписи
; работи без да се reload-ва
;без k= и splashtextoff след _pause , щото дефакто следва reload
;#singleinstance, path и suspend on най-отгоре

;3.3:
;exitreason на същия ред с престоя
;оставих и двете - за абсолютните 40 мин само да ме уведомява а на относителните да се изключва
;без часа преди exitreason щото дефакто се повтаря

;3.2:
;засича абсолютни 40мин а не относителни/спрямо началото на текущата инстанция


;if ( (t-(t//(40*60))*(40*60)) = 0 ) {  -  уведоми ме на относителните 40мин... 
;сега if ( (f-(f//(40*60))*(40*60)) = 0 ) {   -  сякаш работи

;--да засича абсолютни 40мин а не относителни - спрямо началото на текущата инстанция

;--само при първата дата в новосъздаден файл записва 4 празни реда след брой престои
;--за престои от 7 секунди надолу не записва exitreason


;3.1:
;вече exitreason се записва СЛЕД престоя (а не преди него - вкл. непосредствено след датата преди брой престои...)
;преди нова дата добавя 2 празни реда (на края на файла) ; а при нов файл 1 ред преди 1-вата дата
;( write() вместо access() )
;след 3 вместо 2мин се паузира

;3.00:  -   засича неактивност, възможност за проверка на изминалото време, подобрено записване на данните

;паузира се след [pausetimer] секунди, отива в секция [_paused] която чака активност,
;при такава (от мишката/клавиатурата) се връща в _lp,
;или след [idletimer] секунди неактивност извежда въпроса "Here?"
;при 'yes' се връща в _lp,
;при 'но' или след timeout-а се изключва



;(-- може би тряя да го отделя (излизането) във файл който си търси бутоните като картинки за да елиминирам проблема "различно време за отваряне")

;--ако самите данни във файла не съществуват май се бъгва (затова проработва след второто презареждане и втория старт)
;--на първата пауза не скрива началния надпис ако е минала 1 сек

;интересно какъв ли начин има да не ми възприема късното седене към новия ден..
;може би ще е нещо свързано с разлика между два престоя примерно по-голяма от 6-7-8 часа в точно определен период


2.99:
;funny part
;временното записване става чрез извикване на функцията write() , използваща цикъл
;screen off.ahk заключва акаунта


;2.98.5:
;прозорец "тук ли си" вместо да се изключва моментално след 2-те минути

;2.98.4:
;след 2мин неактивност от клавиатурата и мишката спира таймера (хронометъра) и като причина за изход записва Idle

;2.98.2:
;началния надпис се скрива бързо ако е първи за деня

;2.98.1:
;записва причината за всяко излизане
;би трябвало при shutdown да показва последния надпис само за 1/2 сек
;screen off.ahk заключва акаунта

;2.98:
;поправен бъг където не съобщава че са минали 40мин - приравнява th на t (дали е възможно да има известно дублиране?)
;добавена променлива sleeper (всъщност май и някои други ама карай)

;2.97:Р 
;ако файла не съществува го създава и се презарежда ; suspend при изход
;< if (f="ERROR" > , добавено < OR f=0) > защото в новосъздаден файл не е със стойност "ERROR" демек си съществува (,всъщност може да не го написва в създавания файл, тогава тва става излишно)

;2.95: (НААЙ-накрая) поддръжка на неограничен брой пъти изписване на текущо изминалото време (F6)
;записва текущото време, началния час и дата във файла преди (паузата) извеждането им и презарежда, занулява ги на излизане (F7),
;блокира горещите клавиши (F6, F7) докато не се презареди
;скрива началния надпис при рестарт ("if t<>0"), не се удвоява времето ("t=0" преди и след)
;проверка като при четенето на "f" (може би и за другите прочитани променливи, макар че към момента не са проблематични)

;2.7:
;изключва монитора при излизане (sreen off.ahk)

;2.65:
;височина 25 вместо 40 и за началния прозорец когато няма надпис с време (в началото на деня)

;2.62:
;вместо хиб. - само излизане (Lock) след 40мин без предупреждение, моментално

;2.6:
;добавен етикет subexit - сега би трябвало да записва времето независимо по какъв начин се е изключил скрипта ; чрез етикета го изключвам

;2.5:
;splashtext вместо msgbox за паузата, по-точни размери на прозорците
;(2.55:)
;(;online вместо on; отделен надпис докато се сменя присъствието,)
;орязване на другите надписи
;(2.5:)
;(при стартиране активира skype присъствието 'на линия', а преди излизане - 'отпочиващ')

;2.4: 
;изключих close за rocketdock ; изтрих го
;(2.41)
;(би трябвало да затваря RocketDock преди hibernate . в противен случай програмата се бъгва)
;2.4
;записва престоите към деня в който започват а не в който свършват - (включително) след 00:00ч 

;2.33:
;fixed a bug where a space was missing before minutes/seconds - вместо mm1:=mm беше mm1=%mm% ; removed some minor 'sleep's

;2.32:
;изчистени са "спейсовете" когато една от трите думи ( часове минути секунди) липсва - (  минути секунди)/(   секунди) : ( секунди);

; + допълнителни редове код за кирилицата ; и леко изчистване/опростяване на съставянето на надписите
;2.31:
;не изписва нулево време в началото на деня

;2.3:
;след продължителността на текущия престой изписва новото общо време в часове,минути(,секунди)
;при стартиране изписва общото време също в ч.мин.сек.

;2.2:
;записва общото време в секунди във файла

;2.1:
;опция за хибернация на системата - на всеки 45мин запитва дали да изпрати сигнал за hibernate

;2.0:   -   изцяло нова концепция - във файл записва броя престои и продължителността на всеки един с време на начало и край, всеки ден е в отделна секция
;възможност за еднократно изписване на текущо изминалото време

;'1.0':
;еднократно стартира Timed Shutdown и клика настройките: хибернация след 45мин без предупреждение 



 'auto adjust'
[ versioning till v1.0 ]

1.0:
за краен резултат избира tprevious само ако е по-малко от останалите
изключени (повечето от) останалите съобщения
suspend по време на крайното съобщение за да няма 'интерференции'
аджеба изключих S.I. force

добавено if vr=0 за общо престои по-малко от минута
поправено ако pp се получи <0 да е 5
във finalize са голямото и малкото съотношение, предишното време , както и записването на num
vr_sub:=vr беше само с = ... , оправено на още няколко места (макар че на теория не би трябвало да е проблем ако е за фиксирано число)
в t_previous вече си задава един от двата варианта
mi>=40 иначе нямаше действия в случай че mi е точно 40 
добавено второто условие ((p%v%<=600) and (v>0)) иначе v ставаше -1
ф-я finalize()

0.9:
фиксирах endpos на 6 символа след началото- при взимането на часовете, и така изглежда оправих един бъг
преправен цикъла за обратно минаване на нещата
p%нещоси%+=0 преместено непосредствено след прочитането
би трябвало да е поправен бъга: прочиташе грешно престои от типа точно "1 час ..", ако има и минути в надписа няма грешка иначе дава 0
леко поприбрах надписите относно посл. поч. (func())
ако ми трябва почивка спрямо последната хубава ми намаля времето с двойно дължината за нужна почивка като за <0 резулат задава 5мин
func има право да спира/блокира останалите ф-ии
малки промени като изваждане на записването за да е само веднъж
подсъотношение
разни неща
върнах msg2 = %q%, malko sa ti po4ivkite и извеждането на msg1
кирилизиране

мисля че случайно открих дублиращи се променливи - pp (препоръчителен престой спрямо последното време(в минути)) беше p(общо почивки след последната достатъчна почивка (в секунди))

отделени мсгбоксове

;лека промяна в единия надпис
;if num < 10  num=10 защото иначе става 0
;автоматично ограничава до 20мин когато "требва почивка"
;леко подобрени съобщения
;скрива част от мсг3 ако са нулеви стойностите
;изключих p_error щото например при logoff няма как да има почивка м/у престоите
;във func има 2-ро автоматично задаване

;0.85 - първата автоматична промяна
;във func() - нещо като след колко време ше станат абсолютни 40мин от последната хубава почивка
;в "if po>0" намаля времето с 10 - прави го 30мин
;изключих мсгбокс-а за (q>3)
;изключих надписите "няма данни" и "недостатъчни данни", на който пък сложих return
;msgbox pri malyk broi po4ivki
;p_error
;леко променен надпис
;'if chasp <> ERROR'
;p%v%+=0 za da si iztrie bukvite "сек" i da go prieme kato 4islo
;dobaveno msg3 na 1 lipsva6to mqsto
;'chas' se dublira6e -> chasp; 'm' se dublira6e -> mi ,vsy6tost v momenta ne se izpolzva
;bygva se - vzema vremeto ot v4era i zapisva tam prestoq.. - ve4e mai ne
;'&& difference >= 0' za6toto ako pyk posledniq prestoi e predi 00:00 togava 4isloto e po golqmo(20,21,22...) i za razlika se polu4ava otricatelno
;nqkoi i drug malyk byg popraven - hem namira6e razlikata mejdu v4era6niq posleden i dne6nq pyrvi hem sled tova ot neq pak vade6e i prave6e proverka
;funkciite 6te se izvikvat ot faila v koito sa include-nati za po-golqma gyvkavost
;4rez after() opredelq dali prestoq da byde zapisan vyv v4era6niq den
;otdelqneto na 4asovete i minutite e otdeleno v extract_times s argument 'a'

;0.8:
;celiq kod e razdelen vyv funkcii read_intervals(), t_previous(), ratio() i t_all()
;надписа 'Няма данни' също е кирилизиран и временен (се затваря сам) ;izvejda nevyzmojniq konflikt kogato ima samo prestoi i po4ivki < ot 1min
;кирилизиран надпис
;самозатварящо се съобщение "недостатъчни данни" 
;msgbox-a e samo s edin buton
;bez msg1
;zatvarq se sled 'CloseAfterSeconds' sekundi
;msgboxa se zatvarq sled 4 sek
;edin msgbox
;singleinstance force

;0.75 , defakto mislq 4e uspe6no mi prepory4va logi4ni po4ivki
;ako ima 4as v reda -edni deistviq, 'else'(ako ima samo minuti i sekundi) -drugi deistviq
; ot4ita i redovete s 4asove
;ne ot4ita posledniq prestoi?? - mai go opravih tova
;half a step - dva msgbox-a - 1 za pove4eto danni i samo 1 za kolkoto moga da sedq / trqbva da po4ivam

;0.6:
;another little step - izpisva kolko minuti moga da sedq i trqbva da po4ivam
;one step further - opredelq syotno6enieto m/u vremenata
;4ete po4ivkite

;0.5:
;count40 - broi 40-ki
;'r aindex' vmesto 'r 1'

;0.4:
;sreden prestoi

;0.3:
;syvmestmost sys starite danni!
;sekundi ne mi trqbvat - izvli4a samo minutite na prestoite

;0.2:
;ako poslednoto vreme e po-malko ot 40 pozvolenoto e 40, ina4e e ostava6tite minuti ot
; poslednoto do 40-te min
;proverka dali ima ne6to zapisano za denq

;v0.1:
;znae se dyljinata na vseki prestoi v sek.
;s loop pro4ita prodyljitelnostta na vseki prestoi stiga da e nqkyde na reda, v skobi

;-mai nqma nujda ot r - samo min


[ notes [old] ]
;cel - avtomati4no izbirane prodyljitelnost na teku6tiq prestoi

 (-- opciq za udyljavane na prestoq vmesto spirane , 6te se dublira s F6+F7?)
(когато последния престой е 40мин ме ограничава дори почивката да е достатъчна)
(msgbox-a da e ontop)


[ notes between t_all() & func ]

	;v momenta (v0.8) raboti samo makro - ima v predvit ob6to vsi4ki danni za celiq den

(;zna4i sega defakto sa opitvam da napraq funkciq ot4ita6ta poslednata hubava po4ivka)
(	;vsy6tnost tova 6te opredelq mikro-to - ako ima dostay4no po4ivki sega6nata versiq 6te mi)
(	;razre6i max prestoi vypreki 4e do predi malko sym sedql prim. 2-3pyti po 40min s)
(	;ni6tojna po4ivka)
(;tova koeto iskam e da ot4ita tova i da ne mi razre6ava)


[ notes after func() ]
;vr= (3*20)- 45

;slu4ai 1 - maksimum 40min moje bi
;v slu4ai 2 - nai-veroqtno 6te izpisva kolko po4ivka mi trabva za da e izpylneno gornoto
;					, i za prestoi nqkakyv minimum (10-15min) eventualno
;v sl. 3 - tuk moje bi trqbva da e pozvolen nqkakyv maksimum (40/45min),
;           ,s pozvolenie za udyljavane
;		tuk mai 6te se izpolzva formulata
*/

;в трейа или F6 да има и calculated by...

;взе да ,ми разрешава повече от 40 минути


;kogato mi dava 40min - da dava i v skobi s kolko moje da si gi udylja ako poslednata po4ivka mi e predostaty4na


;sled poslednata promqna - , sled 40min mi dade 15 minuti , suuper , sled 2-3 minuti zatvorih, pusnah i mi dade 12 suuper


;предупреждението за оставаща 1мин всъщност е доста добра идея:
;освен че оставя повече време за реакция ами и
;дава възможност за удължаване на времето
;и ръчно спиране, демек активиране на skype to sms примерно


;може би не трябва да са 10 минутите след които да ми разрешава 40мин , трябва да се има в предвит почивката която ми трябва до запълване на (под)съотношението

;не ме изключи на автоматични 10мин.......

;определено се бъгва на авт. 5 мин  , и на 14мин..
;на ръчни си е ОК


;само веднъж работи това apps+l и май останалите (при които не се презарежда(wtf nonsense..))

;бъгна се между датите 30.4. и 1.5.
;не ми показа начален надпис на 1.5.
;и нещо почивките пак не се записваха  - би трябвало да е поправено

;не много значително - екрана остана черен по след изключване щото точно в същия момент се зареждаше virtual dub скрипта




; 30.03.13  ; ot nqkolko dena ednokratno dava mnogo minuti , vednyj celi 803 ;d

;Timer 4 : Smart Sense


#singleinstance ignore
#notrayicon

menu, tray, add, item, label
menu, tray, default, item

goto l

label:
  run %A_ScriptDir%\F7.ahk
return

l:

suspend on


path=%a_scriptdir%\file.ini

IfNotExist, %path%		    ;
{				            ;
    FileAppend , , %path%	;създава файла
    write(0,0,0,"n","n",1)	;ако не съществува
    ;reload			        ;
 goto _continue			    ;
}				            ;


s=							                ;
m=							                ;
h=							                ;inicializirane
iniread, s, %path%, current time, s			;na s, m i h
iniread, m, %path%, current time, m			;
iniread, h, %path%, current time, h			;


starttime=%A_Hour%:%A_Min%							                        ;
startdate=%a_dd%								                            ;
iniread, starttime, %path%, current time, starttime				            ;
iniread, startdate, %path%, current time, startdate				            ;inicializirane
if (starttime="n" OR starttime=ERROR OR startdate="n" OR startdate=ERROR)	;na nachalnite
{										                                    ;data
    starttime=%A_Hour%:%A_Min%							                    ;i chas
    startdate=%a_dd%			; datata v koqto 6te zapisva prestoq	    ;
}								; спрямо това дали е след 00:00		                                    ;


{   ; определя в коя дата да бъде записан престоя

Y_Date := A_Now					;vzemane na
FormatTime, Y_Date, %Y_Date%, dd/MMM/yyyy	;dne6nata data

IniRead, R, % path, % Y_Date, брой престои	;proverka dali ima zapisani danni za dne6nata data


iniread, ch, %path%, current time, ch
if ch=y
 goto _a

if R<=2
{
  num:=30
  word:="first time"
  iniwrite, %num%, %path%, current time, num
}
if R=ERROR
{
  num:=30
  word:="first time"
  iniwrite, %num%, %path%, current time, num
}
 
_a:
if R=ERROR					; deistviq ako nqma danni
{
  ;msgbox за днес няма данни следователно`nили току що пускаш компа`nили седиш след 00:00ч

  Y_Date := A_Now				            ;
  Y_Date += -1, d				            ;vzemane na
  FormatTime, Y_Date, %Y_Date%, dd/MMM/yyyy	;v4era6nata data

  IniRead, R, % path, % Y_Date, брой престои	    ;
  IniRead, y_l_h, % path, % Y_Date, престой%R%	    ;pro4itame v4era6niq posleden prestoi

    StringTrimRight, y_l_h, y_l_h, 20			    ;ot celiq red
    StringMid, y_l_h, y_l_h, StrLen(y_l_h) , 5, L	;izrqzva
    StringTrimRight, y_l_h, y_l_h, 3			    ;samiq 4as (krainiq)	

    y_l_h+=0						                ;
                                                    ;
 ;otstoqnie na dne6niq sprqmo 00			        ;
   if a_hour>=0 ; %% a_hour<6)				        ;
     tpos := a_hour + 0		;'today positive'	    ;
 ;otstoqnie na v4era6niq 4as sprqmo 00			    ;presmqtane na razlikata
   if (y_l_h<24 && y_l_h>12)	;4as predi 00:00 	;ot
   {							                    ;posledniq v4era6en prestoi
     yest := 24 - y_l_h		;'yesterday'		    ;do
     dif := tpos + yest					            ;sega:
   } else if (y_l_h >=0 && y_l_h<12) ;4as sled 00	;ravna e na [dif] chasa
   {							                    ;
     yest := y_l_h					                ;
     dif := tpos - yest					            ;
   } else msgbox грешка при пресмятане на разликата	;

  if dif >= 6 ; - > в нов ден
  {
    goto _continue
  } else if dif < 6 ; - > към стария ден
  {
    stringmid, Y_Date, Y_Date, 1, 2
    iniwrite, % Y_Date, %path%, current time, startdate		;vyv faila zapisva v4era6nata
    startdate:=Y_Date						                ;i v koda q zadava
  }
}

}


_continue:

menu, tray, add
menu, tray, add, change
menu, tray, add, open_file
menu, tray, add, check



psd:=0
num:=40	; в минути



iniread, num, %path%, current time, num

timer:=60*num		;в секунди, втората цифра определя след колко минути се изкл

pausetimer:=1000*3*60	;в хилядни, след колко време неактивност да показва съобщение Paused
idletimer:=pausetimer + 1000*1*60	;в хилядни, колко време след Пауза да е въпроса "Here?"

reason=
g=



OnExit, exitsub



chas:=" час"
minut:=" минут"
sekund:=" секунд"
oka=а	;окончания
oki=и

f=0	 ;в секунди- общо време допреди началото на текущата инстанция

StringLower, mmm, a_mmm

iniread, f, %path%, %startdate%/%mmm%/%a_yyyy%, общо време в секунди

k=	;управляваща променлива
message=
height:=40

t=1	 ;текущо време
th:=t	;нз подобно


t:=s+m*60+h*3600
th:=t

slep1:=1100
LastSleep:=1000 ; 2300

if ( t<>1 AND t<>0 )	
    goto _lp		;прескачане на начално съобщение заради Проверка (F6?)
if ch=y			    ;=y - в предишната инстанция е била зададена промяна (na timer?)
    goto _lp		;прескачане заради промяна на timer

k=beg
if (f="ERROR" OR f=0)
    goto _beg
else
    goto _calc
_beg:
if (f="ERROR" OR f=0){
    message=
    height:=25
    slep1:=800
    FileAppend , `n`n, %path%
}
else
    message=%hh%%mm%%ss% .....`n
SplashTextOn, 270, %height%, ,%message%пускам хронометъра `n ; %num% позволено*/
sleep, %slep1%
SplashTextOff


suspend on

IniRead, R, % path, %startdate%/%mmm%/%a_yyyy%, брой престои

if (R <> "ERROR")
{
;има престои следователно ще пробва да изчисли колко би трябвало да се седи точно сега


;CloseAfterSeconds=20
all:=0    ;ob6to vreme prestoi v minuti
c:=R
p_all:=0  ;ob6to vreme po4ivki v minuti


read_intervals()
{
 ;--------- проверка за данни -----------
 global
  IniRead, R, % path, %startdate%/%mmm%/%a_yyyy%, брой престои
  if R=ERROR
  {
    ;SplashTextOn, , , Няма данни
    return ; exitapp
  }
  p_error:=0

  loop % R
  {
   IniRead, r%a_index%, % path, %startdate%/%mmm%/%a_yyyy%, престой%A_Index%
   IniRead, p%a_index%, % path, %startdate%/%mmm%/%a_yyyy%, почивка%A_Index%
   p%A_Index%+=0
   
   if p%a_index% <> ERROR
     p_all+=p%a_index%	; avtomati4no iz4istva bukvite i ostavq samo cifrite
   else ; ako e ERROR
     p_error++
   
   minstartpos:=instr(r%a_index%, "минут")
   extract_times(a_index)
   
   all+=min%a_index%  ; abe vsy6tnost sy6toto kato "ob6to vreme" ama v minuti i ne s takava to4nost
  }
  p_all/=60
}
extract_times(a)
{
 global
 ;-------- izvli4ane na 4asove i minuti --------
   ifinstring, r%a%, час			
   {
    endpos=6
    stringmid, hour%a%, r%a%, 1, endpos
    StringTrimright, hour%a%, hour%a%, 4
    stringmid, min%a% ,r%a%,  minstartpos-3, minstartpos  ; izvli4ane na minuti
    StringTrimRight, min%a%, min%a%,6			  ; ot red s 4asove

    min%a% += hour%a% * 60

			;r%a% si ostava nepokytnato

 ;-------- bi trqbvalo da e izvli4ane samo na minuti;-------- 
   } else {  
    startpos:= instr(r%a%, "=" ) + 1
    lenght:= instr(r%a%, "от" ) - startpos
    StringMid, r%a%, r%a%, % startpos , % lenght
    StringTrimRight, r%a%, r%a%,1
    stringmid, min%a%, r%a%, 1, minstartpos - 2

    if min%a%=
    {
      min%a%:=0  ; st-st po podrazbirane ako prestoq e po-malyk ot 59sek
      c--		   ; ne se vzima pod vnimanie takyv prestoi
    }
   }
}

func()		; izvejda poslednata po4ivka nad nqkakva minimalna st-st (10min)
{		; sy6to i ot koga ne sym po4ival dostaty4no
 global
  v:=R
  
  mi:=0
  p:=0  
  while((p%v%<=600) and (v>0)) ; >=0 защото при само 1 престой и почивка след това се изпълнява 2 пъти и започва 3-ти път и става -1 ;ot dolu nagore tyrsi po4ivka ot pone 10min
  {
    mi+= % min%v%  ;prestoi v minuti
    p+= % p%v%     ;po4ivki
    
    v--
  }

  v++
  IniRead, chasp, % path, %startdate%/%mmm%/%a_yyyy%, престой%v%	;chasp e ERROR ako sym po4ival >10min
  if chasp <> ERROR
  {
    StringTrimLeft, chasp, chasp, instr(chasp, ":" ) - 3
    StringMid, chasp, chasp, 0 , 5
    msg3 = не си ставал достатъчно от %chasp%`n	; от %chasp% не са налице почивки с дължина поне 10мин
  } 

  if mi<40
  {
    vr_f:=40-mi 
    num_func:=vr_f
     subword:="vr_f"
    
    ;~ msg3 := msg3 . "позволено " . vr_f . " мин" ; "спрямо последната поне от 10-минутна почивка"
    ;~ if (mi <> 0 && p <> 0)
      ;~ msg3 := msg3 . "`nот тогава си седял " . mi . " минути и почивал " . p . " секунди"
  } 

; t_sub:
  else if mi>=40
  {
    ps/=60
    sub_vr := 3*ps-mi
    sub_po := round(mi/3-ps)
          ;MsgBox mi= %mi% p=%ps% sub_vr=%sub_vr% sub_po=%sub_po%
    if sub_vr>0
    {
      sub_vr_sub := sub_vr
      if sub_vr>40
        sub_vr_sub:=40
      ;~ MsgBox,, пр ента, <спрямо последната хубава почивка>`n след %sub_vr% мин ще достигнеш подсъотношението `n-> %sub_vr_sub% минути
      
      num_func:=sub_vr_sub
      subword:="sub_vr_sub"
    } else if (sub_vr<0 && sub_po>0)
    {
      x:=sub_po*2
      ;~ msg03 = %sub_po% мин почивка ти трябват, намалям с %sub_po%*2 мин `n %num_func%-%x% минути
      num_func:=num-x + round(3*p/60) - (mi-40) ; добавям времето на почивките по 3 и изваждам последните няколко престоя
      subword:="num-x + 3*p - mi "
      
      if num_func<=0
      {
        num_func:=5
        subword:="5"
      }
    } else MsgBox неква недомислица при sub_vr и sub_po 841

    ;~ msg3 := msg3 . "-> " . num_func . " мин"      ;  "требва почивка, ограничавам те до " . num . " мин"
  }else MsgBox wtf недомислица около 844-тия ред
  ;MsgBox ,,проверка 0,<спрямо последната поне 10мин почивка (скорошни престои)>`n`n%msg03%`n`n%msg3%  
} 

t_previous()	;spqmo posledniq prestoi ( ne mnogo efektivno)
{
 global

  ;if Switch=off
  ;  return

  sr:=round(all/c)	       ; sreden prestoi
  count40:=round(all/40,1)  ; pyti po 40

  if min%R%<=40
  {
    msg = -> 40мин   ;позволено 40мин спрямо последното време
    num_tprevious:=40
  }
  else {
    pp:=round( 40-(min%R%-40) )  ;80-minR ; izpolzvaemo kogato poslednoto vreme e pove4e ot 40
    msg = -> %pp% минути    ;препоръчителен престой %p% минути спрямо последното време
    if pp<=0
      pp:=5
    num_tprevious:=pp
  }
  ;MsgBox , , проверка 1, <спрямо дължината на последното време>`n %msg%
}

t_all() ; 
{
 global

  vr := 3*p_all-all		;( all + [vremeto koeto trqbva/moje da sedq sega] ) / p_all =(trqbva) 3

  if vr>0
  {
    vr_sub:=vr
    if vr>40
      vr_sub:=40
    ;msgbox , , пр2[2/2]-спрямо целия ден, след %vr%мин ще достигнеш съотношението `n-> %vr_sub% минути, ;% CloseAfterSeconds  ;  %msgg%sled %vr%min 6te dostigne6 syotno6enieto`n`n%msg3%,
    
    num_tall:=vr_sub
  }   
  else if vr<0
  {
    po := round(all/3-p_all)	;all / ( p_all + nujna po4ivka ) = 3
    if po>0 ; && all>40)
    {
      xx:=po*2
      ;msgbox , , пр2[2/2]-спрямо целия ден, %po% мин почивка ти трябват, намалям времето с %po%*2 мин `n-> -%xx% минути ;% CloseAfterSeconds    ; moje bi da e kato gore - sub_po*2 : -=po*2
    
      ;iniread, num, %path%, current time, num
      num_tall:=num-xx
      if num_tall < 10
        num_tall:=10
    } else
    { 
      num_tall:=40
      ;msgbox , , пр2[2/2]-спрямо целия ден, това трябва да означава че може да се стои 40мин `n-> 40 минути ;% CloseAfterSeconds
    }
  } else if vr=0
    num_tall:=40
  else
    if p_all=0	; 0 почивки (демек само от по <60сек)
    {
      return
      ;SplashTextOn, , , недостатъчни данни 
    } else
      msgbox Некъв невъзможен конфликт около 868-ия ред %p_all% %R%
}

finalize()
{
global
  if num_func<=num_tall
  {
    word:= "num_func-" . subword
    num:=num_func
  }
  else if num_tall<num_func
  {
    word:="num_tall"
    num:=num_tall
  }
  else MsgBox грешка около 878-ия ред

  if (num_tprevious<40 && p%R%<600 && num>=num_tprevious)
  {
    word:="num_tprevious"
    num:=num_tprevious
  }
  
  iniwrite, %num%, %path%, current time, num	    ;avtomati4no zadavane na vreme
  iniwrite, y, %path%, current time, ch		        ;
  ch=y						                        ;vzeto ot 'F6 & F7::'
  ;suspend on
  ;MsgBox,, краен резултат, num_func=%num_func% num_tall=%num_tall% num_tprevious=%num_tprevious%`n`n<%num%>
  ;suspend off

  ;sr:=round(all/c)
  
  ;count40 ... нещо си
  sr_t:=45-sr
  ;MsgBox <пр4 - спрямо среден престой>`n sr=%sr%`n->%sr_t% мин
}


read_intervals()
func()
t_previous()
t_all()
finalize()
}
; else MsgBox,,info, Няма данни за днес следователно няма да опитвам да изчислявам*/

timer:=60*num		;в секунди, втората цифра определя след колко минути се изкл*/

suspend off

t=1

splashtext:= word . " -> " . num . " мин"
sleeptime:=strlen(splashtext)*200

SplashTextOn, % strlen(splashtext)*7, , % splashtext
sleep, 1000 ; % sleeptime
SplashTextOff

_lp:

mymessage:="1 minute left"

if strlen(chasp) <> 5
  IniRead, chasp, % path, current time, chasp, "now" 
if (chasp="" || chasp="ERROR")
  chasp:="now"
ch:="n"

sleep, 100
suspend off
loop{
  
  controlsettext, static1, active %t%, g1
  
  ;if (chasp="now")
  ;{
    tip:="day - " . round(((f+t)/3600),1) . " hours`n" . round(num-th/60) . " mins left"
    chasp:=((t<120)?(t . " seconds"):(round(t/60) . " mins"))
  ;}else
  ;{
    ;tip:="day - " . round(((f+t)/3600),1) . " hours`nnow - " . ((t<120)?(t . " seconds"):(round(t/60) . " mins")) . "`n" . round(num-th/60) . " mins left"
  ;}
  
  menu, tray, tip, %tip%`nhere from %chasp%
    sleep, 1000
    t+=1
    th+=1
    fghjk:=num*60
    
    if ((fghjk-th=59) && (strlen(mymessage)>1)){
      
/* opit za pokazvane na desktopa
_if:
DetectHiddenWindows, on
SetTitleMatchMode, 2
      IfWinNotActive, Program Manager ahk_class Progman
      {
        ;BlockInput, on
        ;MsgBox
        send, {lwin down}d{lwin up}
        WinWaitActive, Program Manager ahk_class Progman,, 0.2
        if (errorlevel)
        goto _if
      }
*/      

     run %A_ScriptDir%\3 sec blockinput.ahk
     run %a_scriptdir%\minimizer.ahk
     WinMinimizeAll
     ;MsgBox, 4096, timer, % mymessage, 5
     SplashTextOn,,, % mymessage
     sleep, 3000
     WinMinimizeAllUndo
     SplashTextOff
    }
    
    if (th=fghjk)  ; ako e do6lo vremeto za izklu4vane
    {
	  sleeper=yes  ; kakyv e smisyla ot tova ? - ne izklu4va ekrana bez nego
      sleep, 100
	  goto _F7
    }
    if (A_TimeIdle > pausetimer)
    {
	  splashtexton, 150, 0, Paused
	  goto _paused
    }
}

_calc:
if (k="subexit" OR k="beg")
    t:=f
h:=t//3600
m:=(t-h*3600)//60
s:=( (t-h*3600) ) - m*60

hh := " " . h . chas
mm := " " . m . minut 
ss := " " . s . sekund
hh := (h=1) ? hh : ( (h>1)?(hh . oka):"" )
mm := (m=1) ? (mm . oka) : ( (m>1)?(mm . oki):"" )
ss := (s=1) ? (ss . oka) : ( (s>1)?(ss . oki):"" )

if (t>180) ;ot 3ta minuta nagore nqma da izpisva sekundite*/
    ss=

if (k="pause")
    goto _pause
else if (k="exit")
    goto _exit
else if (k="subexit")
    goto _subexit
else if (k="beg")
    goto _beg

_exit:
iniread, f, %path%, %startdate%/%mmm%/%a_yyyy%, общо време в секунди
iniread, n, %path%, %startdate%/%mmm%/%a_yyyy%, брой престои
f+=t

iniwrite, %f%, %path%, %startdate%/%mmm%/%a_yyyy%, общо време в секунди
n+=1
iniwrite, %n%, %path%, %startdate%/%mmm%/%a_yyyy%, брой престои
iniwrite, %hh%%mm%%ss% от %starttime% до %A_Hour%:%A_Min%`, exit reason - %reason%, %path%, %startdate%/%mmm%/%a_yyyy%, престой%n%

k=subexit
hh1:=hh
mm1:=mm
ss1:=ss
goto _calc
	_subexit:
if height=25
  right=
else
  right=`nобщо%hh%%mm%%ss%`n
SplashTextOn, 270,  % height, ,.....%hh1%%mm1%%ss1%%right%
sleep, %LastSleep%
SplashTextOff


run %a_scriptdir%\timer restings.ahk ; tozi red mai e izli6en
run %a_scriptdir%\[mini]\waiter 2in1.ahk
;goto _F7

;DetectHiddenWindows on
;winclose 

#include %a_scriptdir%\postpone.ahk

g="g"
ExitApp



_pause:
write(s,m,h,starttime,startdate,1)
IniWrite, %chasp%, %path%, current time, chasp
if ( ch="n" )
{
  ;Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
  splashtexton, 300, 40, ,.....%hh%%mm%%ss%/%num%м за сега .....`n%word%
  sleep, 1000
}
reload



F6::
check:
suspend on
k=pause
goto _calc
return



F7::
_F7:
suspend on

if sleeper<>yes             ; Ako e do6lo vremeto za avto izklu4vane,
{
  ;MsgBox run f7
  run %a_scriptdir%\F7.ahk  ; izvikva f7 i
}
else        ; ako e ry4no
  exitapp   ; sam se izklu4va 4rez exitsub
return                      ; iz4akva da byde zatvoren ot nego.





exitsub:  ; pri avto i ry4no izklu4vane idva tuk

;SetTitleMatchMode, 2
;winclose, Microsoft OneNote

IniWrite, % "", %path%, current time, chasp
IniRead, clicksold, %path%, %startdate%/%mmm%/%a_yyyy%, all mouse clicks
clicks+=clicksold
IniWrite, %clicks%, %path%, %startdate%/%mmm%/%a_yyyy%, all mouse clicks

if (reason="idle")
    sleep, 10
else
    reason:=a_exitreason
    StringMid, reason, reason, 0, 4  ; wtf? tva e izmesteno no e izvyn else-a

if a_exitreason in Shutdown,Logoff
    LastSleep:=300 ; 500

if a_exitreason not in reload
{
  if g="g"
    goto _g
  write(0,0,0,"n","n",1)
  iniwrite, 40, %path%, current time, num  ; 40 минути
  iniwrite, n, %path%, current time, ch 
  
  k=exit
  goto _calc
  _g:
  exitapp
} else
  exitapp




write(v1,v2,v3,v4,v5, VV)	; value#
{
global
  char1=s
  char2=m
  char3=h
  char4=starttime
  char5=startdate
  loop 5
      iniwrite, % v%A_Index%, %path%, current time, % char%A_Index%
  if (VV="w")
  { 
      iniwrite, 0, %path%, %startdate%/%mmm%/%a_yyyy%, общо време в секунди	; be6e a_dd
      iniwrite, 0, %path%, %startdate%/%mmm%/%a_yyyy%, брой престои
  }
  if (a_dd<startdate)
      msgbox, ха-ха, нима началото на засичането предстои да започне ?!?
}




_paused:
psd++
sleep, 10
if (a_timeidle >= idletimer)
{ 
    splashtextoff
    msgbox, 4,, here?, 5
    ifmsgbox, yes
    {
      psd:=0
	  goto _lp
    } else {
	  reason:="Idle"
	  exitapp
    }
} else if (a_timeidle <= 800) {
    psd:=0
    splashtextoff
    goto _lp
} else
    goto _paused




;appskey & f::
open_file:
run notepad %a_scriptdir%\file.ini
return


~wheeldown::
~wheelup::
~mbutton::
~rbutton::
clicks++
return


~lbutton::
;keywait, lbutton, up
clicks++
CoordMode, mouse, Screen
MouseGetPos, x, y
if (x=0 && y=0)
  goto check
return


F6 & F7::
change:
iniread, num, %path%, current time, num
inputbox, newnum, new time, number of minutes,, 150, 100,,,,, %num%
if errorlevel = 0
{
  tr:=round(t/60)
  if (newnum<(tr))
  {
    SplashTextOn,,,По-малко от %tr% ?
    sleep, 1500
    SplashTextOff
    goto change
  }
  num:=newnum
  
  iniwrite, %num%, %path%, current time, num
  iniwrite, y, %path%, current time, ch
  ch=y
  
  suspend on	;
  k=pause	    ;  send {F6} ne raboti
  goto _calc	;
} ; else msgbox gre6ka pri inputbox
return


~f7 & F6::
inputbox, mymessage, New message on last minute, , ,250, 100,,,,, % mymessage
return


!x::
;run D:\1 Soft' & doc's\AutoHotKey\my scripts\close all running skripts.ahk
StringTrimRight, dir, a_scriptdir, 8
run %dir%\close all running skripts.ahk
return

~#p::pause


/*
z::
    KeyWait,z, t1
	if errorlevel
      InputBox, mymessage, Message at end,,, 250, 100,,,,,% mymessage
    return