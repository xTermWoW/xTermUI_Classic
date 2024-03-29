local AceHook = LibStub("AceHook-3.0")

local ZGV=ZygorGuidesViewer
if not ZGV then return end

local Foglight = {}
ZGV.Foglight = Foglight


function Foglight:Startup()
	if ZGV.db.profile.foglight then
		Foglight:ShowOverlay()
	end
end

function Foglight:ShowOverlay()
	if ZGV.IsDataProviderRegistered(WorldMapFrame,Foglight.DataProvider.name) then return end
	WorldMapFrame:AddDataProvider(ZGV.Foglight.DataProvider)
end

function Foglight:HideOverlay()
	if not ZGV.IsDataProviderRegistered(WorldMapFrame,Foglight.DataProvider.name) then return end
	WorldMapFrame:RemoveDataProvider(ZGV.Foglight.DataProvider)
end

function Foglight:ToggleOverlay()
	if ZGV.IsDataProviderRegistered(WorldMapFrame,Foglight.DataProvider.name) then 
		WorldMapFrame:RemoveDataProvider(ZGV.Foglight.DataProvider)
	else
		WorldMapFrame:AddDataProvider(ZGV.Foglight.DataProvider)
		-- todo - get a better fix for overlays not showing if provider is added while map frame is visible.
		-- no, RefreshAllData is not working
		if WorldMapFrame:IsVisible() then
			local map = WorldMapFrame:GetMapID()
			if map then
				WorldMapFrame:Hide()
				OpenWorldMap(map)
			end
		end
	end
end


Foglight.DataProvider = CreateFromMixins(MapCanvasDataProviderMixin);

Foglight.DataProvider.data = {
	[1411] = {-- Durotar
		{{271427},128,110,464,33},
		{{2212659},160,120,413,476},
		{{271426},160,190,474,384},
		{{271440},190,180,462,286},
		{{271439},190,200,327,60},
		{{271437},200,240,549,427},
		{{271428},210,160,427,78},
		{{271443},215,215,355,320},
		{{271421},220,230,432,170},
		{{271422},230,230,301,189},
		{{271435,271442},445,160,244,0},
	},
	[1412] = {-- Mulgore
		{{272185},128,120,473,260},
		{{272178},128,155,379,242},
		{{272176},128,205,303,307},
		{{272180},170,128,458,369},
		{{272172},185,128,291,0},
		{{272179},205,128,395,0},
		{{272169},205,230,502,16},
		{{272181},210,180,255,214},
		{{272177},215,240,428,80},
		{{272186},225,235,532,238},
		{{272170},256,190,523,356},
		{{272173},256,200,367,303},
		{{272187,272171},280,240,249,59},
		{{272168,272165},470,243,270,425},
	},
	[1413] = {-- The Barrens
		{{270569},100,165,564,52},
		{{852702},115,110,507,294},
		{{270553},120,110,555,0},
		{{270560},120,125,384,115},
		{{270584},125,115,492,63},
		{{270585},125,125,556,189},
		{{852696},125,165,442,298},
		{{852705},128,100,412,0},
		{{270554},128,105,419,63},
		{{852699},128,128,306,130},
		{{852704},128,128,341,537},
		{{852694},128,128,431,479},
		{{270574},140,128,498,119},
		{{852697},145,125,365,350},
		{{852701},150,120,527,307},
		{{852703},155,115,407,553},
		{{852695},155,128,335,462},
		{{270565},155,128,481,211},
		{{270559},155,155,431,118},
		{{270564},170,120,456,0},
		{{852700},175,185,365,177},
		{{270572},200,145,317,29},
		{{852693},200,185,340,234},
		{{852698},210,150,355,402},
		{{270573},95,100,581,247},
	},
	[1416] = {-- Alterac Mountains
		{{768731},160,175,225,478},
		{{768752},165,197,314,471},
		{{768732},190,170,317,372},
		{{768721,768722},195,288,399,380},
		{{768730},200,200,406,279},
		{{768738,769205},220,280,196,131},
		{{768753},235,200,462,77},
		{{768739},255,255,270,197},
		{{768744,768745},255,320,462,307},
		{{768723,769200},280,240,334,162},
		{{768728,768729},285,230,276,0},
		{{769201,769202,769203,769204},300,300,26,262},
		{{768734,768735,768736,768737},330,265,44,403},
		{{768717,768718,768719,768720},350,370,626,253},
		{{768748,768749,768750,768751},370,300,549,105},
	},
	[1417] = {-- Arathi Highlands
		{{270360},160,230,558,112},
		{{2212546},170,155,419,293},
		{{270352},175,225,370,186},
		{{270350},180,210,472,165},
		{{270347},190,210,138,54},
		{{2212539},190,240,87,138},
		{{270348},200,220,355,412},
		{{270336},205,250,655,120},
		{{270346},210,185,286,310},
		{{270353},215,210,559,333},
		{{270342},215,235,432,362},
		{{270343},230,195,531,276},
		{{270351},230,240,192,90},
		{{270358},240,230,108,287},
		{{270349},245,245,232,145},
		{{270361},256,215,171,424},
	},
	[1418] = {-- Badlands
		{{270543},195,200,325,148},
		{{270532},200,195,445,120},
		{{270530},220,220,551,48},
		{{2212608},230,230,349,256},
		{{2212593},240,255,0,148},
		{{2212606},245,205,389,7},
		{{2212592},245,205,498,209},
		{{270529},255,205,17,310},
		{{270520},255,220,12,428},
		{{270540,270527},255,280,501,341},
		{{270522,270550,270528,270536},265,270,345,389},
		{{270525,270521,2212603,2212605},270,275,159,199},
		{{2212599,2212601},285,240,148,384},
		{{270534,270551,270546,270535},370,455,611,110},
	},
	[1419] = {-- Blasted Lands
		{{391431},170,145,405,123},
		{{391433},170,200,472,9},
		{{391425},185,155,310,133},
		{{391432},185,190,559,30},
		{{391435},195,180,361,15},
		{{391430},225,170,501,140},
		{{391434},245,195,361,195},
		{{391437,391436},265,220,453,259},
		{{391429,391428,391427,391426},384,450,212,178},
	},
	[1420] = {-- Tirisfal Glades
		{{273015},128,158,537,299},
		{{273016},150,128,474,327},
		{{273000},173,128,694,289},
		{{273020},174,220,497,145},
		{{272996},175,247,689,104},
		{{2213434},186,128,395,277},
		{{273009,273002},201,288,587,139},
		{{2213425},211,189,746,125},
		{{273006},216,179,630,326},
		{{2213418},230,205,698,362},
		{{272999},237,214,757,205},
		{{273003},243,199,363,349},
		{{273001},245,205,227,328},
		{{273017},256,156,239,250},
		{{273019},256,210,335,139},
		{{2213428,2213430},315,235,463,361},
	},
	[1421] = {-- Silverpine Forest
		{{2213067},140,125,391,446},
		{{272598},160,170,470,261},
		{{272616},165,185,382,252},
		{{2213080},175,165,402,65},
		{{2213065},180,128,323,128},
		{{2213082},180,185,457,144},
		{{272610},185,165,286,37},
		{{272620},210,160,352,168},
		{{272609},210,215,379,447},
		{{272613},220,160,364,359},
		{{272599},240,180,491,417},
		{{272614},240,240,494,262},
		{{272600},250,215,593,74},
		{{2213063},256,160,465,0},
		{{2213084},256,220,459,13},
	},
	[1422] = {-- Western Plaguelands
		{{273113},160,125,300,311},
		{{273121},160,200,566,198},
		{{273107},170,165,600,412},
		{{273102},170,190,451,323},
		{{273094},180,205,520,250},
		{{273122,273103},205,340,590,86},
		{{2212523},220,150,381,265},
		{{273114},220,180,382,164},
		{{273120},225,185,137,293},
		{{2212522,2212521},285,230,260,355},
		{{273108,273101},300,206,355,462},
		{{273095,273111,273100,273090},340,288,307,16},
		{{273119,273092,273112,273093},370,270,504,343},
	},
	[1423] = {-- Eastern Plaguelands
		{{271544},165,160,537,367},
		{{271533},175,245,716,299},
		{{271542},180,160,592,241},
		{{271512},185,150,172,477},
		{{271520},190,205,620,128},
		{{271522},190,205,79,98},
		{{271543,271530},195,275,620,291},
		{{271551},200,205,156,360},
		{{271548},205,165,291,401},
		{{271554},205,165,614,30},
		{{2212700},205,250,409,345},
		{{271514},210,179,309,489},
		{{271536},210,210,271,261},
		{{2212705,2212706},220,360,7,231},
		{{271537},225,215,722,166},
		{{271535},230,150,422,36},
		{{271523},230,235,442,199},
		{{271521},240,195,457,109},
		{{271529},240,200,194,9},
		{{271553},245,170,717,471},
		{{271532},250,175,537,463},
		{{271518,271527,2212703,2212704},360,270,169,83},
	},
	[1424] = {-- Hillsbrad Foothills
		{{271904},125,100,109,482},
		{{2212736},165,200,175,275},
		{{271897},205,155,414,154},
		{{2212742},215,240,541,236},
		{{271894,2212744},220,310,509,0},
		{{2212737,2212738},230,320,524,339},
		{{271905,2212743},235,270,418,201},
		{{271885,271877},240,275,637,294},
		{{2212746,2212747},285,155,208,368},
		{{271876,271881},288,225,2,192},
		{{271883,271892,2212739,2212740},305,275,198,155},
		{{271872,271898,271882,271891},384,365,605,75},
	},
	[1425] = {-- The Hinterlands
		{{271927},145,220,158,149},
		{{271933},160,145,512,232},
		{{271934},170,170,319,302},
		{{271938,271916},170,310,693,303},
		{{271929},180,170,408,260},
		{{271928},185,195,237,185},
		{{271937},195,185,240,387},
		{{271922},200,165,373,365},
		{{271910},205,195,374,164},
		{{770218},225,200,171,306},
		{{271912,271920},235,285,505,333},
		{{271917},255,205,13,245},
		{{271908,271935,271936,271909},275,275,509,19},
		{{271915,271921},280,205,571,239},
	},
	[1426] = {-- Dun Morogh
		{{2212640},115,115,252,249},
		{{271398},125,125,217,287},
		{{2212654},128,120,792,279},
		{{271389},128,128,573,280},
		{{2212651},128,165,502,221},
		{{2212653},128,165,759,173},
		{{271392},128,180,281,167},
		{{271418},128,190,347,163},
		{{271406},150,128,295,385},
		{{271401},155,128,522,322},
		{{271409},155,170,694,273},
		{{271408},165,165,608,291},
		{{2212641},180,128,274,296},
		{{2212644},180,165,166,184},
		{{271400},200,185,314,311},
		{{271417},200,200,386,294},
		{{2212639},240,185,155,403},
		{{271410,271396},315,200,397,163},
	},
	[1427] = {-- Searing Gorge
		{{254503,254504},275,235,77,366},
		{{2201968,2201949},305,220,494,300},
		{{254527,254528},305,230,545,407},
		{{2201972,2201970,2201969,2201971},360,280,247,388},
		{{254509,254510,254511,254512},405,430,85,30},
		{{254529,254530,254531,254532},425,325,250,170},
		{{254505,254506,254507,254508},460,365,422,8},
	},
	[1428] = {-- Burning Steppes
		{{270927},220,225,707,168},
		{{270938},225,220,36,109},
		{{270912,270909},245,265,334,114},
		{{270919,270911},256,280,173,101},
		{{270922,270934,270923,270937},270,285,513,99},
		{{270920,270914,270908,270929},270,310,589,279},
		{{270944,270910,270935,270945},280,355,722,46},
		{{270906,270918,270936,270942},294,270,708,311},
		{{270933,270943,270921,270928},320,270,377,285},
		{{270941,270925,270926,270917},415,315,56,258},
	},
	[1429] = {-- Elwynn Forest
		{{271560},225,220,422,332},
		{{271567},240,220,250,270},
		{{271573},255,250,551,292},
		{{271578},256,210,704,330},
		{{271582},256,237,425,431},
		{{271576},256,240,238,428},
		{{271559},256,249,577,419},
		{{271572},256,256,381,147},
		{{2212708,2212709},256,341,124,327},
		{{271557,271583},306,233,696,435},
		{{271584,271565},310,256,587,190},
		{{2212713,2212714,2212715,2212716},485,405,0,0},
	},
	[1430] = {-- Deadwind Pass
		{{271092,271085,271086,271089},270,270,426,299},
		{{271095,271079},300,245,269,337},
		{{271075,271076,271080,271081},380,365,249,76},
	},
	[1431] = {-- Duskwood
		{{271453,271454},160,330,19,132},
		{{2212669},195,145,102,302},
		{{271466},200,175,653,120},
		{{2212676},220,220,690,353},
		{{271470,271477},220,340,504,117},
		{{271449},235,250,390,382},
		{{271455},250,230,539,369},
		{{271448,271456},255,285,243,348},
		{{271444,271483},275,250,55,342},
		{{271471,271461,271450,271451},315,280,631,162},
		{{271473,271463,271467,271464},350,300,85,149},
		{{2212678,2212679,2212680,2212681},360,420,298,79},
		{{271481,271460,271474,271468},910,210,89,31},
	},
	[1432] = {-- Loch Modan
		{{252899},195,250,109,370},
		{{252882,252883},230,300,125,12},
		{{252884,2212852},235,270,229,11},
		{{252886,252887},255,285,215,348},
		{{252898},256,230,217,203},
		{{2212855,2212856},290,175,339,11},
		{{252862,252863,2212828,2212829},295,358,309,310},
		{{252880,252881},315,235,542,48},
		{{252894,252895,252896,252897},320,410,352,87},
		{{252866,252867},345,256,482,321},
		{{252890,252891,252892,252893},370,295,546,199},
	},
	[1433] = {-- Redridge Mountains
		{{272334,2212936},235,270,399,129},
		{{272372},250,250,654,161},
		{{2212977,2212978},255,300,500,215},
		{{272357,272342},275,256,277,0},
		{{272347,272371},320,210,595,320},
		{{272351,272340},340,195,83,197},
		{{272362,272356},365,245,121,72},
		{{272364,272348,272358,272359},365,350,0,284},
		{{272344,272354,272350,272339},430,290,187,333},
		{{272369,272363},465,255,484,361},
		{{272335,272343,2212940,2212942,2212943,2212945},535,275,133,240},
	},
	[1434] = {-- Stranglethorn Vale
		{{2213161},105,110,311,131},
		{{2213191},105,125,387,64},
		{{2213150},110,105,260,132},
		{{2213171},110,110,306,301},
		{{2213145},110,140,371,129},
		{{2213197},115,115,156,42},
		{{2213148},120,120,345,276},
		{{2213152},125,120,314,493},
		{{2213159},125,125,280,368},
		{{2213173},125,140,196,3},
		{{2213158},128,125,331,59},
		{{2213194},128,125,364,231},
		{{2213162},128,175,432,94},
		{{2213165},140,110,269,26},
		{{2213147},145,128,203,433},
		{{2213156},155,150,388,0},
		{{2213146},165,175,194,284},
		{{2213192},165,190,229,422},
		{{2213174},170,125,394,212},
		{{2213168},170,90,284,0},
		{{2213188},190,175,152,90},
		{{2213187},200,185,235,189},
		{{2213196},245,220,483,8},
		{{2213164},90,115,211,359},
		{{2213143},90,80,241,92},
		{{2213154},95,95,299,88},
		{{2213170},95,95,350,335},
	},
	[1435] = {-- Swamp of Sorrows
		{{272739,272746},215,365,724,120},
		{{272736},235,205,171,145},
		{{2213206},240,245,0,262},
		{{272759,272750},245,305,0,140},
		{{272756,272737,272769},256,668,746,0},
		{{272747,272763},275,240,129,236},
		{{272772,272760,2213215,2213216},300,275,565,218},
		{{272768,272770},315,235,286,110},
		{{272740,272773},345,250,552,378},
		{{272742,272751,272752,272764},360,315,279,237},
		{{2213200,2213202,2213203,2213204},365,305,492,0},
	},
	[1436] = {-- Westfall
		{{273143},165,200,488,0},
		{{273137},195,240,442,241},
		{{273142},200,185,208,375},
		{{273125},200,240,524,252},
		{{273145},210,215,387,11},
		{{2212528},215,215,307,29},
		{{273130},220,200,317,331},
		{{273126},225,205,328,148},
		{{273146},225,210,459,105},
		{{273149},225,256,220,102},
		{{273124},256,175,339,418},
		{{273141,2212527},280,190,205,467},
		{{273131,273134},288,235,523,377},
		{{273129,273133},305,210,204,260},
	},
	[1437] = {-- Wetlands
		{{273156},175,128,13,314},
		{{2212531},185,240,456,125},
		{{273181},190,160,628,176},
		{{273155},195,185,247,205},
		{{273173},200,185,349,115},
		{{2212533},200,240,237,41},
		{{273164},205,180,401,21},
		{{273177},205,245,527,264},
		{{273159},225,185,347,218},
		{{273171},225,190,89,142},
		{{273174},230,190,470,371},
		{{273163},240,175,77,245},
		{{2212535},256,250,507,115},
		{{273178,273167},300,240,92,82},
		{{2213613,2213614,2212532,2212534},350,360,611,230},
	},
	[1438] = {-- Teldrassil
		{{2213328},128,100,494,548},
		{{272807},128,190,335,313},
		{{272826},160,210,382,281},
		{{272830},170,240,272,127},
		{{272822},180,256,377,93},
		{{272814},185,128,368,443},
		{{2213323},190,128,462,323},
		{{272815},200,200,561,292},
		{{272811},225,225,491,153},
		{{272810},256,185,436,380},
		{{272806,272812},315,256,101,247},
	},
	[1439] = {-- Darkshore
		{{769206},150,215,318,162},
		{{769211},170,195,468,85},
		{{271044},175,158,329,510},
		{{769210},175,183,229,485},
		{{769207},180,195,365,181},
		{{271045},190,205,324,306},
		{{271043},195,215,510,0},
		{{769209},200,170,305,412},
		{{769208},230,190,375,94},
	},
	[1440] = {-- Ashenvale
		{{270380},128,195,131,137},
		{{270387},146,200,856,151},
		{{270398},155,150,260,373},
		{{2212540},165,175,189,324},
		{{270402},180,245,520,238},
		{{270390},200,160,796,311},
		{{2212541},200,205,392,218},
		{{270386},205,185,272,251},
		{{270400},210,185,463,141},
		{{2212542,2212543},215,305,205,38},
		{{2212548},220,195,104,259},
		{{270401},225,255,597,258},
		{{270375},235,205,547,426},
		{{270376},245,245,19,28},
		{{270405},245,255,713,344},
		{{270389},255,195,203,158},
		{{2212544,2212545},275,240,356,347},
		{{270388,2212547},285,185,694,225},
	},
	[1441] = {-- Thousand Needles
		{{272968},190,190,31,155},
		{{272962},205,195,259,131},
		{{272963},210,180,205,70},
		{{272954},210,190,357,264},
		{{2213363},210,195,391,192},
		{{2213395},240,220,492,250},
		{{2213369},250,240,179,200},
		{{2213348,2213349,2213351,2213352},305,310,0,0},
		{{2213371,2213372,2213374,2213375},320,365,610,300},
	},
	[1442] = {-- Stonetalon Mountains
		{{2213093},125,125,475,433},
		{{272650},125,86,663,582},
		{{272628},145,107,572,561},
		{{272646},150,150,389,320},
		{{2213087},190,97,718,571},
		{{272624},200,215,390,145},
		{{2213088},225,120,668,515},
		{{272633,272647},230,355,210,234},
		{{272632,272641},270,205,247,0},
		{{272648,272634,272635,272623},288,355,457,282},
		{{272630,272649,272642,272636},320,275,553,197},
	},
	[1443] = {-- Desolace
		{{2212638},100,100,241,6},
		{{2212635},170,160,555,181},
		{{271111},190,220,447,102},
		{{271122},195,242,293,426},
		{{271114},200,250,554,0},
		{{271126},205,145,431,0},
		{{271105},205,195,690,444},
		{{2212632},205,250,311,61},
		{{2212636,2212637},205,285,590,365},
		{{2212634},220,220,607,215},
		{{271125},230,230,167,389},
		{{271106,271129},245,285,212,215},
		{{271127,2212633},275,250,387,244},
		{{271104,271124},285,245,625,33},
		{{271108,271112,271113,271109},285,280,399,380},
	},
	[1444] = {-- Feralas
		{{2212732},110,110,493,70},
		{{2212728},110,170,478,386},
		{{2212726},115,115,486,329},
		{{2212729},120,195,623,167},
		{{271696},140,165,690,141},
		{{271700,271682},145,320,404,256},
		{{2212721},150,125,454,0},
		{{271675},155,160,689,233},
		{{2212734},180,180,208,234},
		{{2212733},190,155,305,0},
		{{271699},190,250,540,320},
		{{2212730,2212731},215,293,192,375},
		{{271680},225,180,751,198},
		{{271687},230,195,454,201},
		{{2212735},240,220,618,298},
		{{271705,271686},285,245,319,75},
	},
	[1445] = {-- Dustwallow Marsh
		{{271494},200,195,660,21},
		{{271500},230,205,534,224},
		{{271507,271504},250,315,422,0},
		{{2212689},255,250,257,313},
		{{2212685,2212686,2212687,2212688},280,270,230,0},
		{{271503,271509},285,240,367,381},
		{{2212683,2212684},400,255,239,189},
	},
	[1446] = {-- Tanaris
		{{2213315},110,140,611,147},
		{{272800},110,180,473,234},
		{{2213275},120,135,533,104},
		{{2213311},150,160,291,434},
		{{272789},155,150,561,256},
		{{2213281},155,150,592,75},
		{{272798},160,150,395,346},
		{{2213273},160,190,629,220},
		{{2213313},165,180,509,168},
		{{272774},175,165,421,91},
		{{272792},180,200,252,199},
		{{272781},185,250,203,286},
		{{272776},195,175,299,100},
		{{272784},195,210,323,359},
		{{272782},205,145,325,289},
		{{272801},205,157,445,511},
		{{272788},210,175,254,0},
		{{272795},215,175,499,293},
		{{272799},215,180,363,194},
		{{272805},220,210,449,372},
	},
	[1447] = {-- Azshara
		{{270434},120,155,818,107},
		{{2212573},145,215,422,95},
		{{270412},160,210,404,194},
		{{2212567},190,200,681,153},
		{{2212555},200,150,77,331},
		{{2212574},215,175,84,229},
		{{2212554},220,255,191,369},
		{{2212564},225,180,35,422},
		{{2212560},235,140,478,44},
		{{2212571,2212572},235,270,250,106},
		{{270410},240,125,552,499},
		{{2212568},240,155,499,119},
		{{270432},245,185,644,40},
		{{270414,2212561,2212562,2212563},265,280,238,221},
		{{2212550,2212551,2212552,2212553},270,300,479,201},
		{{270409,2212559},315,200,296,429},
		{{2212565,2212566},370,220,389,353},
		{{2212569,2212570},395,128,396,540},
		{{2212556,2212557,2212558},570,170,366,0},
	},
	[1448] = {-- Felwood
		{{271657},145,159,496,509},
		{{271653},160,145,548,90},
		{{271663},165,155,332,465},
		{{271658},175,135,408,533},
		{{271659},185,160,405,429},
		{{271652},195,170,330,29},
		{{271673},215,215,420,54},
		{{271666},235,145,292,263},
		{{271664},235,155,297,381},
		{{271665},235,200,307,123},
		{{271660},240,145,483,0},
		{{271669},245,128,271,331},
	},
	[1449] = {-- Un'Goro Crater
		{{273051,2213483,2213484,2213486},285,285,582,67},
		{{273042,273065,273050,273036},295,270,367,178},
		{{273072,273039,273037,273063},310,355,560,240},
		{{273043,273075,273069,273061},315,345,121,151},
		{{273046,273053,273071,273047},345,285,158,368},
		{{273059,273066,273073,273054},345,285,367,380},
		{{273052,273062,273057,273058,2213490,2213491},570,265,160,6},
	},
	[1450] = {-- Moonglade
		{{252844,252845,252846,252847,2212870,2212872},555,510,244,89},
	},
	[1451] = {-- Silithus
		{{272564,272553},288,256,116,413},
		{{272573,272545},320,256,344,197},
		{{272581,272562,2213052,2213053},320,289,104,24},
		{{272580,272544,2213048,2213049},384,384,500,65},
		{{272559,272543,272574,272575},384,512,97,144},
		{{272565,272566,272577,272546},512,320,265,12},
		{{272567,272547,272555,272548},512,384,245,285},
	},
	[1452] = {-- Winterspring
		{{273206},125,165,611,242},
		{{273200},145,125,617,158},
		{{273199},165,140,593,340},
		{{273191},165,200,509,107},
		{{273203},175,185,555,27},
		{{273207},185,160,392,137},
		{{273185},185,180,493,258},
		{{273198},200,160,523,376},
		{{273192},215,185,401,198},
		{{273187},230,120,229,243},
		{{273202},240,140,222,172},
		{{273184},250,180,368,7},
		{{2213650},255,205,447,441},
	},
	[1459] = {-- Alterac Valley
		{{270314,270315},235,290,399,375},
		{{270331,270325},270,240,348,13},
		{{270320,270321,270322,270323},300,300,335,172},
	},
}


Foglight.DataProvider.blizz_overlays = {}

Foglight.DataProvider.name = "ZygorFoglightDataProvider"


function Foglight.DataProvider:OnAdded(mapCanvas)
	MapCanvasDataProviderMixin.OnAdded(self, mapCanvas);
	-- a single permanent pin
	local pin = self:GetMap():AcquirePin("ZygorFogLightPinTemplate");
	pin:SetPosition(0.5, 0.5);
	self.pin = pin;

end

function Foglight.DataProvider:OnRemoved(mapCanvas)
	MapCanvasDataProviderMixin.OnRemoved(self, mapCanvas);
	--self:GetMap():RemoveAllPinsByTemplate("ZygorFogLightPinTemplate"); -- for some reason this errors out, and if disabled overlays hide fine...
end

function Foglight.DataProvider:OnShow()
	self:RegisterEvent("MAP_EXPLORATION_UPDATED");
end

function Foglight.DataProvider:OnHide()
	self:UnregisterEvent("MAP_EXPLORATION_UPDATED");
	self.pin:RemoveAllData()
end

function Foglight.DataProvider:OnEvent(event, ...)
	if event == "MAP_EXPLORATION_UPDATED" then
		self:RefreshAllData();
	end
end

function Foglight.DataProvider:OnMapChanged()
	local fullUpdate = true;
	self.pin:RefreshOverlays(fullUpdate);
end

function Foglight.DataProvider:RemoveAllData()
	self.pin:RemoveAllData();
end

function Foglight.DataProvider:RefreshAllData(fromOnShow)
	self.pin:RefreshOverlays(fromOnShow);
end

function Foglight.DataProvider:OnGlobalAlphaChanged()
	if not self.isWaitingForLoad then
		self.pin:RefreshAlpha();
	end
end

--[[ THE Pin ]]--
ZygorFogLightPinMixin = CreateFromMixins(MapCanvasPinMixin);

function ZygorFogLightPinMixin:OnLoad()
	self:SetIgnoreGlobalPinScale(true);
	self:UseFrameLevelType("PIN_FRAME_LEVEL_MAP_EXPLORATION");
	self.overlayTexturePool = CreateTexturePool(self, "ARTWORK", 0);
	self.highlightRectPool = CreateTexturePool(self, "ARTWORK", 0);		-- could be frames, but textures are lighter
	self.textureLoadGroup = CreateFromMixins(TextureLoadingGroupMixin);
end

function ZygorFogLightPinMixin:RemoveAllData()
	self.overlayTexturePool:ReleaseAll();
	self.highlightRectPool:ReleaseAll();
	self.textureLoadGroup:Reset();
	self.isWaitingForLoad = nil;
end

function ZygorFogLightPinMixin:RefreshAlpha()
	self:SetAlpha(self:GetMap():GetGlobalAlpha());
end

function ZygorFogLightPinMixin:OnUpdate(elapsed)
	if self.isWaitingForLoad and self:GetMap():AreDetailLayersLoaded() and self.textureLoadGroup:IsFullyLoaded() then
		self:RefreshAlpha();
		self.isWaitingForLoad = nil;
		self.textureLoadGroup:Reset();
	end
end

function ZygorFogLightPinMixin:RefreshOverlays(fullUpdate)
	self:RemoveAllData();
	if fullUpdate then
		self.isWaitingForLoad = true;
		self:SetAlpha(0);
	end

	local mapID = self:GetMap():GetMapID();

	local our_overlays = Foglight.DataProvider.data[mapID]
	if not our_overlays then return end

	-- Get Blizzard overlays
	local exploredMapTextures = C_MapExplorationInfo.GetExploredMapTextures(mapID);

	-- Mark already used overlays
	table.wipe(Foglight.DataProvider.blizz_overlays)
	if exploredMapTextures then
		for i,v in pairs(exploredMapTextures) do
			if v.fileDataIDs[1] then
				Foglight.DataProvider.blizz_overlays[v.fileDataIDs[1]] = true
			end
		end
	end
	
	-- remove them from our data, since they are already visible
	for i,overlay in pairs(our_overlays) do
		if Foglight.DataProvider.blizz_overlays[overlay[1][1]] then
			table.remove(our_overlays,i)
		end
	end

	
	self.layerIndex = self:GetMap():GetCanvasContainer():GetCurrentLayerIndex();
	local layers = C_Map.GetMapArtLayers(mapID);
	local layerInfo = layers[self.layerIndex];
	local TILE_SIZE_WIDTH = layerInfo.tileWidth;
	local TILE_SIZE_HEIGHT = layerInfo.tileHeight;

	for i, exploredTextureInfo in ipairs(our_overlays) do
		local numTexturesWide = ceil(exploredTextureInfo[2]/TILE_SIZE_WIDTH);
		local numTexturesTall = ceil(exploredTextureInfo[3]/TILE_SIZE_HEIGHT);
		local texturePixelWidth, textureFileWidth, texturePixelHeight, textureFileHeight;
		if not exploredTextureInfo.phase or ZGV.InPhase(exploredTextureInfo.phase) then
			for j = 1, numTexturesTall do
				if ( j < numTexturesTall ) then
					texturePixelHeight = TILE_SIZE_HEIGHT;
					textureFileHeight = TILE_SIZE_HEIGHT;
				else
					texturePixelHeight = mod(exploredTextureInfo[3], TILE_SIZE_HEIGHT);
					if ( texturePixelHeight == 0 ) then
						texturePixelHeight = TILE_SIZE_HEIGHT;
					end
					textureFileHeight = 16;
					while(textureFileHeight < texturePixelHeight) do
						textureFileHeight = textureFileHeight * 2;
					end
				end
				for k = 1, numTexturesWide do
					local texture = self.overlayTexturePool:Acquire();
					if ( k < numTexturesWide ) then
						texturePixelWidth = TILE_SIZE_WIDTH;
						textureFileWidth = TILE_SIZE_WIDTH;
					else
						texturePixelWidth = mod(exploredTextureInfo[2], TILE_SIZE_WIDTH);
						if ( texturePixelWidth == 0 ) then
							texturePixelWidth = TILE_SIZE_WIDTH;
						end
						textureFileWidth = 16;
						while(textureFileWidth < texturePixelWidth) do
							textureFileWidth = textureFileWidth * 2;
						end
					end
					texture:SetWidth(texturePixelWidth);
					texture:SetHeight(texturePixelHeight);
					texture:SetTexCoord(0, texturePixelWidth/textureFileWidth, 0, texturePixelHeight/textureFileHeight);
					texture:SetPoint("TOPLEFT", exploredTextureInfo[4] + (TILE_SIZE_WIDTH * (k-1)), -(exploredTextureInfo[5] + (TILE_SIZE_HEIGHT * (j - 1))));
					texture:SetTexture(exploredTextureInfo[1][((j - 1) * numTexturesWide) + k]);

					texture:SetDrawLayer("ARTWORK", 0);
					texture:Show();
				end
			end
		end
	end
end

function ZygorFogLightPinMixin:OnCanvasScaleChanged()
	if self.layerIndex ~= self:GetMap():GetCanvasContainer():GetCurrentLayerIndex() then
		self:RefreshOverlays();
	end
end

function ZygorFogLightPinMixin:OnCanvasSizeChanged()
	self:SetSize(self:GetMap():DenormalizeHorizontalSize(1.0), self:GetMap():DenormalizeVerticalSize(1.0));
end