#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Jun 15 12:03:59 2026                
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
restoreDesign saved_design/post_cts.inn.dat/ SYS_TOP
fit
timeDesign -postCTS -drv
timeDesign -postCTS
timeDesign -postCTS -hold
all_constraint_modes -active
set_interactive_constraint_modes [all_constraint_modes -active]
current_design
set_max_capacitance 0 [current_design]
current_design
set_max_capacitance 0.1 [current_design]
set_propagated_clock [all_clocks]
reset_clock_uncertainty -from [all_clocks] -to [all_clocks]
set_clock_uncertainty -setup 0.5 [all_clocks]
set_clock_uncertainty -hold 0.07 [all_clocks]
setRouteMode -earlyGlobalMaxRouteLayer 5
setPinAssignMode -maxLayer 5
setNanoRouteMode -routeTopRoutingLayer 5
setDesignMode -topRoutingLayer Metal5
setDesignMode -topRoutingLayer 5
current_design
set_max_fanout 30 [current_design]
set_max_transition 1.5 -data_path [all_clocks]
set_max_transition 0.75 -clock_path [all_clocks]
setMultiCpuUsage -localCpu 1
setAnalysisMode -analysisType onChipVariation
setNanoRouteMode -routeWithTimingDriven true
setNanoRouteMode -quiet -routeInsertAntennaDiode true
set_propagated_clock [all_clocks]
route_opt_design
report_power
checkDesign -all
checkDesign -all
timeDesign -postRoute -drv
optDesign -postRoute -drv
optDesign -postRoute
optDesign -postRoute -hold
optDesign -postRoute -holdsetOptMode -addInstancePrefix route_design_setup
setOptMode -addInstancePrefix route_design_setup
setOptMode -addInstancePrefix route_design_hold
setOptMode -holdFixingEffort high
setOptMode -setupTargetSlack 0.3
set dbgLefDefOutVersion 5.8
set dbgDefOutLefVias 1
reportGateCount
set_propagated_clock [all_clocks]
report_ccopt_clock_trees
report_ccopt_skew_groups
reportCongestion -overflow
checkDesign
checkDesign -all
reportCongestion -overflow
setLayerPreference violation -isVisible 0
help *Congestion*
reportCongestion -hotspot
reportCongestion -overflow -hotspot
reportCongestion -hotspot
reportCongestion -verbose
reportCongestion -overflow -verbose
fit
verify_drc
verify_connectivity
help *signoff*
saveDesign saved_design/route_opt.inn
timeDesign -postRoute -drv
timeDesign -postRoute
timeDesign -postRoute -hold
uiSetTool flightline
zoomBox 90.77500 79.38800 34.07200 51.14300
zoomBox 72.24100 70.82350 61.30700 64.12650
zoomBox 65.89350 67.34550 63.47350 65.79000
selectInst ctsFE_OFC690_n_689
deselectAll
selectInst ctsFE_OFC690_n_689
fit
deselectAll
zoomBox 112.64900 70.04400 104.15450 48.80650
zoomBox 101.32800 61.13800 96.94350 59.15100
selectWire 98.0600 49.6450 98.1400 61.1250 4 FE_OFN85_n_502
fit
zoomBox 97.99550 112.73050 88.22650 106.14700
fit
zoomBox 97.57100 101.47450 92.26150 94.04150
deselectAll
selectWire 92.5900 3.1300 93.5900 116.5700 4 VDD
fit
zoomBox 17.71950 111.88100 12.62250 106.99650
zoomBox 10.68300 107.53500 19.24850 111.68700
zoomBox 10.13200 106.99600 20.20950 111.88100
zoomBox 9.48400 106.36600 21.34000 112.11300
zoomBox 9.48400 106.94050 21.34000 112.68750
zoomBox 9.48400 107.51500 21.34000 113.26200
fit
zoomBox 62.31750 10.58000 56.58300 5.27050
zoomBox 59.97650 7.99400 59.61700 7.59150
uiSetTool ruler
fit
zoomBox 23.02850 114.21700 17.50700 107.20850
zoomBox 19.35750 112.28400 18.84900 111.13100
uiSetTool ruler
uiSetTool ruler
fit
uiSetTool select
deselectAll
displaySpareCell
setDrawView place
displaySpareCell
setDrawView place
reportRoute
zoomBox 23.24100 113.79200 17.08200 107.63350
fit
setLayerPreference node_layer -isVisible 0
setLayerPreference node_net -isVisible 0
setLayerPreference node_net -isVisible 1
setLayerPreference node_layer -isVisible 1
setLayerPreference node_net -isVisible 0
setLayerPreference node_net -isVisible 1
setLayerPreference node_route -isVisible 0
setLayerPreference node_route -isVisible 1
setLayerPreference node_track -isVisible 1
setLayerPreference node_track -isVisible 0
setDrawView fplan
setDrawView ameba
setDrawView fplan
zoomBox 70.38750 31.81700 63.80400 21.83550
fit
setLayerPreference violation -isVisible 1
zoomBox 90.77500 47.32000 86.95250 39.67500
selectMarker 89.2000 44.4600 90.2000 46.1700 -1 12 87
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false -displayByLayer
violationBrowserClose
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false -displayByLayer
violationBrowserClose
fit
setDrawView ameba
setDrawView place
setLayerPreference violation -isVisible 0
