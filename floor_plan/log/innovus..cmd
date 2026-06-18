#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Jun 15 17:10:27 2026                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.18-s099_1 (64bit) 07/18/2023 13:03 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.18-s099_1 NR230707-1955/21_18-UB (database version 18.20.605) {superthreading v2.17}
#@(#)CDS: AAE 21.18-s017 (64bit) 07/18/2023 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.18-s022_1 () Jul 11 2023 23:10:24 ( )
#@(#)CDS: SYNTECH 21.18-s010_1 () Jul  5 2023 06:32:03 ( )
#@(#)CDS: CPE v21.18-s053
#@(#)CDS: IQuantus/TQuantus 21.1.1-s966 (64bit) Wed Mar 8 10:22:20 PST 2023 (Linux 3.10.0-693.el7.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getVersion
define_proc_arguments ViaFillQor -info {This procedure extracts Viafill details from innovus db} -define_args {
		{-window "window coordinates" "" list optional}
		{-window_size "window size in microns" "" string optional}
	
	}
define_proc_arguments ProcessFills -info {This procedure processes Fill types} -define_args {
    {-fillInfo "Design Fill data" "" list required}
				{-csvName "File path for Fill Data csv file" "Path of CSV file" string required}
				{-selectFill "type of fill to be selected in session" "list of BRIDGE/EXTENSION/STAMP/FLOATING" list required}
    {-output_data "Boolean Flag to output Fill Data for further processing" "" string required}
}
define_proc_arguments FillQor -info {This procedure extracts fill details from innovus db} -define_args {
    {-layers "Fills Cleanup on which all layers" "list of Metal/Routing layers" list optional}
				{-selectFill "type of fill to be selected in session" "list of BRIDGE/EXTENSION/STAMP/FLOATING" list optional}
				{-outData "Boolean Flag to output Fill Data for further processing" "" boolean optional}
    {-outDataFile "File path for Fill Data csv file" "Path of CSV file" string optional}
}
define_proc_arguments ProcessFills_fast -info {This procedure processes Fill types} -define_args {
    {-fillInfo "Design Fill data" "" list required}
				{-csvName "File path for Fill Data csv file" "Path of CSV file" string required}
				{-selectFill "type of fill to be selected in session" "list of BRIDGE/EXTENSION/STAMP/FLOATING" list required}
    {-output_data "Boolean Flag to output Fill Data for further processing" "" string required}
}
define_proc_arguments FillQor_fast -info {This procedure extracts fill details from innovus db} -define_args {
    {-layers "Fills Cleanup on which all layers" "list of Metal/Routing layers" list optional}
				{-selectFill "type of fill to be selected in session" "list of BRIDGE/EXTENSION/STAMP/FLOATING" list optional}
				{-outData "Boolean Flag to output Fill Data for further processing" "" boolean optional}
    {-outDataFile "File path for Fill Data csv file" "Path of CSV file" string optional}
}
define_proc_arguments ProcessFills_fast_stampOnly -info {This procedure processes Fill types} -define_args {
    {-fillInfo "Design Fill data" "" list required}
	
}
define_proc_arguments FillQor_fast_stampOnly -info {This procedure extracts fill details from innovus db} -define_args {
    {-layers "Fills Cleanup on which all layers" "list of Metal/Routing layers" list optional}
}
win
restoreDesign saved_design/route_opt.inn.dat/ SYS_TOP
fit
ctd_win
selectObject IO_Pin REF_CLK
zoomSelected
deselectObject IO_Pin REF_CLK
ctd_win
selectObject IO_Pin UART_CLK
zoomSelected
deselectObject IO_Pin UART_CLK
fit
setLayerPreference violation -isVisible 0
setLayerPreference node_layer -isVisible 0
setLayerPreference node_inst -isVisible 0
setLayerPreference node_layer -isVisible 1
setDrawView fplan
zoomBox 85.89050 66.64600 70.38750 60.06250
fit
zoomBox 65.50300 58.36350 44.26550 37.55100
fit
setDrawView place
setDrawView fplan
setDrawView place
setLayerPreference node_inst -isVisible 1
setLayerPreference node_inst -isVisible 0
zoomBox 116.47200 111.24400 106.91500 105.08500
setLayerPreference node_inst -isVisible 1
fit
zoomBox 13.25950 37.55100 5.40200 20.13650
fit
zoomBox 14.95850 41.16150 6.88850 18.65000
zoomBox 9.01750 30.45050 8.36350 29.83300
fit
zoomBox 13.89650 44.77150 6.46350 21.62300
zoomBox 9.71350 30.80750 8.55600 29.23950
zoomBox 9.54350 30.06150 9.20200 29.85400
zoomBox 9.06700 29.82000 9.65950 30.10700
zoomBox 8.93900 29.76700 9.75950 30.16450
fit
help *lvs*
help *LVS*
zoomBox 97.14600 102.53650 86.31500 92.76750
zoomBox 94.33800 99.18050 92.80950 97.73100
fit
zoomBox 70.65050 16.54400 144.66650 52.42350
zoomBox 48.51250 9.36500 150.95650 59.02500
zoomBox 86.68350 22.30550 140.16000 48.22850
zoomBox 77.27750 14.03000 164.35550 56.24150
zoomBox 67.91550 5.79300 188.43900 64.21700
fit
zoomBox -26.12550 8.15900 170.12150 103.29050
zoomBox 23.43050 22.36850 143.95150 80.79150
zoomBox 44.87300 28.80100 131.94900 71.01150
zoomBox 60.43850 33.48600 123.35200 63.98350
zoomBox 78.90900 41.03850 106.82400 54.57050
zoomBox 82.30550 42.77650 102.47550 52.55400
zoomBox 83.63450 43.48600 100.77950 51.79700
fit
zoomBox 61.46800 56.66450 38.53150 41.37350
