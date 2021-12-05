Write-Output "Uninstalling default apps"
#Write-Host "Trying to Remove Disney Plus"
#Get-AppxPackage *Disney* | Remove-AppxPackage

$Apps = @(
	"*Disney*"
    # default Windows 10 apps
	#These 2 need to go up here for advertising.xaml to be removed.
	#
	"Microsoft.BingWeather"
	"Microsoft.windowscommunicationsapps"
    "Microsoft.3DBuilder"
    "Microsoft.Advertising.Xaml"
    "Microsoft.Appconnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingTranslator"
    "Microsoft.GamingServices"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MixedReality.Portal"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MinecraftUWP"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.OneNote"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.Wallet"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxSpeechToTextOverlay"
	"Microsoft.MinecraftEducationEdition"
	"Microsoft.PowerAutomateDesktop"
	"Microsoft.Todos_8wekyb3d8bbwe"

    # Threshold 2 apps
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.WindowsFeedbackHub"

    "Microsoft.Microsoft3DViewer"
    
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.BingTravel"
    "Microsoft.WindowsReadingList"

    # Redstone 5 apps
    "Microsoft.MixedReality.Portal"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.YourPhone"

    # non-Microsoft
	"26720RandomSaladGamesLLC.SimpleSolitaire"
	"Disney.37853FC22B2CE_6rarf9sa4v8jt"
	"2FE3CB00.PicsArt-PhotoStudio_crhqpqs3x1ygc"
	"5319275A.WhatsAppDesktop_cv1g1gvanyjgm"
	"AdobeSystemsIncorporated.AdobeLightroom_ynb6jyjzte8ga"
	"WikimediaFoundation.Wikipedia_54ggd3ev8bvz6"
	"CorelCorporation.PaintShopPro_wbjqpk9xt50t4"
	"2FE3CB00.PicsArt-PhotoStudio_crhqpqs3x1ygc"
	"NAVER.LINEwin8_8ptj331gd3tyt"
    "2FE3CB00.PicsArt-PhotoStudio"
    "613EBCEA.PolarrPhotoEditorAcademicEdition"
    "89006A2E.AutodeskSketchBook"
    "A278AB0D.DisneyMagicKingdoms"
    "A278AB0D.MarchofEmpires"
    "CAF9E577.Plex"  
    "ClearChannelRadioDigital.iHeartRadio"
    "D52A8D61.FarmVille2CountryEscape"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "DolbyLaboratories.DolbyAccess"
    "DolbyLaboratories.DolbyAccess"
    "Drawboard.DrawboardPDF"
    "Fitbit.FitbitCoach"
    "GAMELOFTSA.Asphalt8Airborne"
    "KeeperSecurityInc.Keeper"
    "NORDCURRENT.COOKINGFEVER"
    "Playtika.CaesarsSlotsFreeCasino"
    "ShazamEntertainmentLtd.Shazam"
    "SlingTVLLC.SlingTV"
    "SpotifyAB.SpotifyMusic"
    "ThumbmunkeysLtd.PhototasticCollage"
    "TuneIn.TuneInRadio"
    "WinZipComputing.WinZipUniversal"
    "XINGAG.XING"
    "flaregamesGmbH.RoyalRevolt2"
 
	"*DropboxOEM*"
    "*EclipseManager*"
    "*ActiproSoftwareLLC*"
    "*Duolingo-LearnLanguagesforFree*"
    "*PandoraMediaInc*"
    "*CandyCrush*"
    "*BubbleWitch3Saga*"
    "*Wunderlist*"
    "*Flipboard*"
    "*Twitter*"
    "*Facebook*"
    "*Royal Revolt*"
    "*Sway*"
    "*Speed Test*"
    "*Dolby*"
    "*Viber*"
    "*ACGMediaPlayer*"
    "*Netflix*"
    "*OneCalendar*"
    "*LinkedInforWindows*"
    "*HiddenCityMysteryofShadows*"
    "*Hulu*"
    "*HiddenCity*"
    "*AdobePhotoshopExpress*"
	"*TikTok*"
	
	
	# Removes all HP Apps
	"*HPSupportAssistant*"

    "Microsoft.Advertising.Xaml"
)

    foreach ($App in $Apps) {
        Get-AppxPackage -Name $App| Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $App | Remove-AppxProvisionedPackage -Online
        Write-Host "Trying to remove $App."
    }
	
#foreach ($app in $apps) {
 #   Write-Output "Trying to remove $app"

  #  Get-AppxPackage -Name $app | Remove-AppxPackage

#}
    ##Get-AppXProvisionedPackage -Online |
    ##Where-Object DisplayName -EQ $app |
    ##Remove-AppxProvisionedPackage -Online

Write-Host "Bloatware Removed from PC"