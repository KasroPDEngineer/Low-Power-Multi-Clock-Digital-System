#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sun Jun 14 17:34:21 2026                
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
set init_gnd_net VSS
set init_lef_file {../pdk_files/lef/gsclib045_tech.lef ../pdk_files/lef/gsclib045_macro.lef}
set init_design_settop 0
set init_verilog ../synth/outputs/multi_clk_netlist.v
set init_mmmc_file Default.view
set init_pwr_net VDD
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CoreSite -r 1 0.4 5 5 5 5
uiSetTool select
getIoFlowFlag
fit
zoomBox 7.52550 118.46450 4.34000 109.96950
fit
zoomBox 8.80000 13.34100 3.49050 1.02300
fit
uiSetTool obstruct
createPlaceBlockage -box 2.85350 113.58000 119.44500 116.12850 -type hard
createPlaceBlockage -box 3.70300 3.99650 117.32150 6.12000 -type hard
createPlaceBlockage -box 115.19750 2.29750 116.25950 117.40250 -type hard
zoomBox 124.11700 100.83750 108.82650 91.28100
uiSetTool select
selectObstruct 115.2 5.13 115.6 114.57 defScreenName
deleteSelectedFromFPlan
fit
uiSetTool obstruct
createPlaceBlockage -box 113.28650 3.57150 117.10900 118.03950 -type hard
createPlaceBlockage -box 3.06600 3.99650 7.52550 116.97800 -type hard
uiSetTool select
selectObstruct 113.2 5.13 115.6 114.57 defScreenName
deselectAll
selectObstruct 5 5.13 7.6 114.57 defScreenName
dbSetObjFPlanBox [uiGetRecordObjByInfo -objType pBlkg -rect 5.0 5.13 7.6 114.57 -name defScreenName] 10000 10260 14800 229140
deselectAll
selectObstruct 5 5.13 7.4 114.57 defScreenName
deselectAll
selectObstruct 5 112.86 115.6 114.57 defScreenName
deselectAll
uiSetTool layerBlk
createRouteBlk -box 4.12750 113.79200 118.17100 115.70350
createRouteBlk -box 115.19750 2.72200 116.25950 116.12850
createRouteBlk -box 2.42850 5.90800 116.47200 7.81900
createRouteBlk -box 4.97700 4.20900 7.52550 118.03950
uiSetTool select
zoomBox 48.08850 118.88900 35.13400 104.44800
selectObstruct 5 112.86 115.6 114.57 defScreenName
deselectAll
selectRouteBlk -box 4.125 113.79 118.17 115.705 defLayerBlkName -layer Metal3
setSelectedRouteBlk 4.125 113.79 114.725 115.705 defLayerBlkName {{3 }} {Undefined ALLNET} {} {}
deselectAll
selectObstruct 5 112.86 115.6 114.57 defScreenName
deselectAll
selectRouteBlk -box 4.125 113.79 114.725 115.705 defLayerBlkName -layer Metal3
setSelectedRouteBlk 5.0 112.86 115.6 114.775 defLayerBlkName {{3 }} {Undefined ALLNET} {} {}
deselectAll
selectObstruct 5 112.86 115.6 114.57 defScreenName
deselectAll
selectRouteBlk -box 5 112.86 115.6 114.775 defLayerBlkName -layer Metal3
deselectAll
selectObstruct 5 112.86 115.6 114.57 defScreenName
deselectAll
selectRouteBlk -box 5 112.86 115.6 114.775 defLayerBlkName -layer Metal3
setSelectedRouteBlk 5.0 112.86 115.6 114.57 defLayerBlkName {{3 }} {Undefined ALLNET} {} {}
fit
zoomBox 118.38300 105.72200 111.58750 96.16550
deselectAll
selectRouteBlk -box 115.195 2.72 116.26 116.13 defLayerBlkName -layer Metal3
deselectAll
selectObstruct 113.2 5.13 115.6 114.57 defScreenName
deselectAll
selectRouteBlk -box 115.195 2.72 116.26 116.13 defLayerBlkName -layer Metal3
setSelectedRouteBlk 115.195 2.72 117.595 112.16 defLayerBlkName {{3 }} {Undefined ALLNET} {} {}
deselectAll
selectObstruct 113.2 5.13 115.6 114.57 defScreenName
deselectAll
selectObstruct 113.2 5.13 115.6 114.57 defScreenName
deselectAll
selectObstruct 113.2 5.13 115.6 114.57 defScreenName
deselectAll
selectRouteBlk -box 115.195 2.72 117.595 112.16 defLayerBlkName -layer Metal3
setSelectedRouteBlk 113.2 5.13 115.6 114.57 defLayerBlkName {{3 }} {Undefined ALLNET} {} {}
fit
zoomBox 10.07400 71.53050 0.09250 66.43350
deselectAll
selectObstruct 5 5.13 7.4 114.57 defScreenName
deselectAll
selectRouteBlk -box 4.975 4.21 7.525 118.04 defLayerBlkName -layer Metal3
setSelectedRouteBlk 4.975 4.21 7.375 113.65 defLayerBlkName {{3 }} {Undefined ALLNET} {} {}
deselectAll
selectRouteBlk -box 4.975 4.21 7.375 113.65 defLayerBlkName -layer Metal3
fit
zoomBox -75.51150 -5.98500 196.11100 125.68500
zoomBox 14.10900 115.49100 -3.94250 108.05800
deselectAll
selectRouteBlk -box 4.975 4.21 7.375 113.65 defLayerBlkName -layer Metal3
deselectAll
selectRouteBlk -box 4.975 4.21 7.375 113.65 defLayerBlkName -layer Metal3
uiSetTool move
setObjFPlanBox LayerShape (9950,8420,14750,227300) 4.721 3.9845 7.121 113.4245
uiSetTool select
deselectAll
selectObstruct 5 5.13 7.4 114.57 defScreenName
deselectAll
selectRouteBlk -box 4.72 3.985 7.12 113.425 defLayerBlkName -layer Metal3
deselectAll
selectObstruct 5 5.13 7.4 114.57 defScreenName
deselectAll
selectRouteBlk -box 4.72 3.985 7.12 113.425 defLayerBlkName -layer Metal3
setSelectedRouteBlk 5.0 5.13 7.4 114.57 defLayerBlkName {{3 }} {Undefined ALLNET} {} {}
fit
zoomBox 38.95650 10.79250 33.85950 3.78400
deselectAll
selectObstruct 5 5.13 115.6 6.84 defScreenName
deselectAll
selectRouteBlk -box 2.43 5.91 116.47 7.82 defLayerBlkName -layer Metal3
setSelectedRouteBlk 5.0 5.13 115.6 6.84 defLayerBlkName {{3 }} {Undefined ALLNET} {} {}
fit
setDrawView fplan
uiSetTool move
zoomBox 57.43250 118.88900 49.99950 112.09350
zoomBox 46.70650 111.41400 60.72500 118.20950
zoomBox 46.70650 110.73450 60.72500 117.53000
zoomBox 46.70650 110.05500 60.72500 116.85050
setObjFPlanBox LayerShape (10000,225720,231200,229140) 5.00000 113.00350 115.60000 114.57000
deselectAll
selectObstruct 5 112.86 115.6 114.57 defScreenName
setObjFPlanBox LayerShape (10000,226010,231200,229140) 5.00000 113.09100 115.60000 114.57000
fit
zoomBox 100.33150 117.61500 94.17300 107.84600
fit
zoomBox 71.87400 9.09350 68.26350 2.08500
setObjFPlanBox LayerShape (10000,10260,231200,13680) 5.00000 5.13000 115.60000 6.61800
fit
zoomBox 120.93150 42.01100 109.88850 34.15300
setObjFPlanBox LayerShape (226400,10260,231200,229140) 113.29950 5.13000 115.60000 114.57000
deselectAll
selectObstruct 113.2 5.13 115.6 114.57 defScreenName
setObjFPlanBox LayerShape (226600,10260,231200,229140) 113.40100 5.13000 115.60000 114.57000
uiSetTool move
uiSetTool select
deselectAll
uiSetTool move
fit
zoomBox 12.83500 57.72650 -5.64150 51.99250
setObjFPlanBox LayerShape (10000,10260,14800,229140) 5.00000 5.13000 7.21550 114.57000
fit
zoomBox 15.38350 85.97150 0.09250 77.90150
fit
zoomBox 113.07400 80.23750 110.31300 77.05200
zoomBox 112.90300 79.06100 113.17050 78.98900
fit
uiSetTool select
zoomBox 59.34400 120.37550 56.15850 108.05800
selectRouteBlk -box 5 113.09 115.6 114.57 defLayerBlkName -layer Metal3
setSelectedRouteBlk 5.0 113.09 115.6 114.57 defLayerBlkName {{1 } {3 } {5 } {7 } {9 } {11 }} {Undefined ALLNET} {} {}
fit
zoomBox 72.51100 8.03150 59.55650 3.14700
deselectAll
selectRouteBlk -box 5 5.13 115.6 6.62 defLayerBlkName -layer Metal3
setSelectedRouteBlk 5.0 5.13 115.6 6.62 defLayerBlkName {{1 } {3 } {5 } {7 } {9 } {11 }} {Undefined ALLNET} {} {}
fit
zoomBox 132.39950 89.15700 110.52550 79.60050
deselectAll
selectRouteBlk -box 113.4 5.13 115.6 114.57 defLayerBlkName -layer Metal3
setSelectedRouteBlk 113.4 5.13 115.6 114.57 defLayerBlkName {{2 } {4 } {6 } {8 } {10 }} {Undefined ALLNET} {} {}
fit
zoomBox 10.28650 71.53050 -1.60650 61.97350
deselectAll
selectRouteBlk -box 5 5.13 7.215 114.57 defLayerBlkName -layer Metal3
setSelectedRouteBlk 5.0 5.13 7.215 114.57 defLayerBlkName {{2 } {4 } {6 } {8 } {10 }} {Undefined ALLNET} {} {}
fit
deselectAll
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top Metal2 bottom Metal2 left Metal4 right Metal4} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
setDrawView place
zoomBox 9.64950 79.38800 -0.96950 71.31800
fit
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer Metal4 -direction vertical -width 1 -spacing 1 -number_of_sets 4 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
undo
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer Metal4 -direction vertical -width 1 -spacing 1 -number_of_sets 4 -start_from left -start_offset 20 -stop_offset 20 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
undo
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer Metal4 -direction vertical -width 1 -spacing 1 -number_of_sets 4 -start_from left -start_offset 20 -stop_offset 20 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
addEndCap -preCap FILL4 -postCap FILL4 -prefix ENDCAP
addWellTap -cell FILL16 -cellInterval 20 -inRowOffset 30 -skipRow 1 -prefix WELLTAP
addWellTap -cell FILL16 -cellInterval 20 -inRowOffset 30 -skipRow 1 -prefix WELLTAP
setLayerPreference node_inst -isVisible 0
setLayerPreference node_inst -isVisible 1
setDrawView fplan
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView place
setLayerPreference node_layer -isVisible 0
gui_select -rect {107.34000 117.61500 30.88650 6.75750}
deleteSelectedFromFPlan
zoomBox 107.76450 115.27900 114.77300 107.63350
gui_select -rect {112.65600 113.56500 108.93150 109.00250}
deselectAll
zoomBox 102.43800 107.38950 120.99350 116.38450
fit
gui_select -rect {112.78200 113.54100 105.42850 3.78400}
deselectAll
deleteSelectedFromFPlan
setLayerPreference node_layer -isVisible 1
setLayerPreference node_layer -isVisible 0
addWellTap -cell FILL16 -cellInterval 20 -inRowOffset 20 -skipRow 1 -prefix WELLTAP
gui_select -rect {110.73800 116.34050 23.45350 6.12000}
deselectAll
deleteSelectedFromFPlan
addWellTap -cell FILL16 -cellInterval 30 -inRowOffset 20 -skipRow 1 -prefix WELLTAP
gui_select -rect {113.07400 115.91600 19.41850 8.03150}
deselectAll
deleteSelectedFromFPlan
addWellTap -cell FILL16 -cellInterval 30 -inRowOffset 1 -skipRow 1 -prefix WELLTAP
gui_select -rect {105.64100 118.25200 8.58750 7.60650}
deselectAll
deleteSelectedFromFPlan
zoomBox 5.40200 116.97800 15.17100 104.87250
fit
gui_select -rect {7.71850 113.48300 14.95850 -2.16250}
deselectAll
deleteSelectedFromFPlan
deleteSelectedFromFPlan
addWellTap -cell FILL16 -cellInterval 30 -inRowOffset 10 -skipRow 1 -prefix WELLTAP
setLayerPreference node_layer -isVisible 1
setSrouteMode -viaConnectToShape { padring ring stripe }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { Metal1(1) Metal1(1) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { Metal1(1) Metal11(11) }
setSrouteMode -viaConnectToShape { padring ring stripe }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { Metal1(1) Metal1(1) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { Metal1(1) Metal11(11) }
zoomBox 30.03700 112.51800 25.57700 104.44800
editPowerVia -skip_via_on_pin Standardcell -bottom_layer Metal1 -nets {VDD VSS} -add_vias 1 -top_layer Metal11
set sprEpvLayers {}
fit
zoomBox 31.31100 112.51800 16.02050 96.80250
fit
zoomBox 18.14400 114.64150 10.49850 105.08500
fit
zoomBox 41.08000 8.88100 34.07200 2.08500
fit
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *
applyGlobalNets
saveDesign saved_design/s_route.inn
remove_assigns -buffering -ignorePortConstraints
update_names -nocase
checkDesign -all
setLayerPreference node_layer -isVisible 0
setLayerPreference node_blockage -isVisible 1
setLayerPreference node_blockage -isVisible 0
setLayerPreference node_inst -isVisible 0
setLayerPreference node_blockage -isVisible 1
setLayerPreference Metal2 -isVisible 1
setLayerPreference Metal4 -isVisible 1
setLayerPreference Metal1 -isVisible 1
setLayerPreference Metal1 -isVisible 0
setLayerPreference Metal1 -isVisible 1
setDrawView fplan
setDrawView fplan
setLayerPreference Metal1 -isVisible 0
setLayerPreference Metal1 -isVisible 1
setDrawView place
zoomBox 102.88000 10.58000 95.23500 2.93450
fit
setLayerPreference node_layer -isVisible 1
setLayerPreference node_layer -isVisible 0
setLayerPreference node_layer -isVisible 1
setLayerPreference node_inst -isVisible 1
zoomBox 28.33800 68.55700 16.02050 65.15950
fit
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -use CLOCK -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 9 -spreadType start -spacing 6 -start 0.0 0.0 -pin {REF_CLK UART_CLK}
setPinAssignMode -pinEditInBatch false
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell SYS_TOP -pin REF_CLK -status unplaced -silent
setPtnPinStatus -cell SYS_TOP -pin UART_CLK -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -use CLOCK -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 6 -pin {REF_CLK UART_CLK}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 7 -spreadType center -spacing 10 -pin {RST_N UART_RX_IN}
setPinAssignMode -pinEditInBatch false
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell SYS_TOP -pin RST_N -status unplaced -silent
setPtnPinStatus -cell SYS_TOP -pin UART_RX_IN -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 7 -spreadType center -spacing 12 -pin {RST_N UART_RX_IN}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 1 -spreadType center -spacing 6 -pin {framing_error parity_error UART_TX_O}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.06 -pinDepth 0.335 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 1 -spreadType center -spacing -6.08 -pin {framing_error parity_error UART_TX_O}
setPinAssignMode -pinEditInBatch false
checkPinAssignment
zoomBox 2.21650 70.89350 -3.73000 41.79850
zoomBox 0.72150 63.43200 -0.26400 62.21200
fit
zoomBox 2.21650 69.83150 -4.15500 48.59450
fit
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell SYS_TOP -pin framing_error -status unplaced -silent
setPtnPinStatus -cell SYS_TOP -pin parity_error -status unplaced -silent
setPtnPinStatus -cell SYS_TOP -pin REF_CLK -status unplaced -silent
setPtnPinStatus -cell SYS_TOP -pin RST_N -status unplaced -silent
setPtnPinStatus -cell SYS_TOP -pin UART_CLK -status unplaced -silent
setPtnPinStatus -cell SYS_TOP -pin UART_RX_IN -status unplaced -silent
setPtnPinStatus -cell SYS_TOP -pin UART_TX_O -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
zoomBox 125.81600 72.16750 116.68400 46.04600
gui_select -rect {120.97600 67.06950 119.96500 52.91350}
deselectAll
deleteSelectedFromFPlan
fit
gui_select -rect {4.55250 67.49550 -5.00450 53.05400}
deleteSelectedFromFPlan
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -use CLOCK -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 9 -spreadType center -spacing 4 -pin {REF_CLK UART_CLK}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 7 -spreadType center -spacing 8 -pin {RST_N UART_RX_IN}
setPinAssignMode -pinEditInBatch false
checkPinAssignment
checkPinAssignment
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 5 -spreadType center -spacing 4 -pin {framing_error parity_error UART_TX_O}
setPinAssignMode -pinEditInBatch false
checkPinAssignment
zoomBox 117.95850 32.87900 109.67600 25.02100
fit
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *
applyGlobalNets
setCheckMode -tapeOut true
setCheckMode -all true
summaryReport
saveDesign saved_design/pre_placement.inn
all_constraint_modes -active
set_interactive_constraint_modes [all_constraint_modes -active]
current_design
set_max_capacitance 0.1 [current_design]
set_propagated_clock [all_clocks]
set_max_transition 1.5 -data_path [all_clocks]
set_max_transition 0.75 -clock_path [all_clocks]
reset_clock_uncertainty -from [all_clocks] -to [all_clocks]
set_clock_uncertainty -setup 0.5 [all_clocks]
set_clock_uncertainty -hold 0.07 [all_clocks]
setDesignMode -topRoutingLayer 5
current_design
set_max_fanout 20 [current_design]
setDesignMode -process 45
setMultiCpuUsage -keepLicense true
setMultiCpuUsage -localCpu 16
setRouteMode -earlyGlobalMaxRouteLayer 5
setPinAssignMode -maxLayer 5
setNanoRouteMode -routeTopRoutingLayer 5
setDesignMode -topRoutingLayer Metal5
setRouteMode -earlyGlobalMaxRouteLayer 5
setDesignMode -topRoutingLayer 5
delete_ccopt_clock_tree_spec
set_global report_timing_format {hpin net arc cell fanout load slew delay arrival}
setAnalysisMode -timeBorrowing false
setAnalysisMode -analysisType onChipVariationsetAnalysisMode -analysisType onChipVariation
setAnalysisMode -analysisType onChipVariation
setAnalysisMode -cppr both
setPlaceMode -clkGateAware true
setPlaceMode -softGuide true
setPlaceMode -maxDensity 0.90
setPlaceMode -ignoreScan 1
setPlaceMode -moduleAwareSpare false
setPlaceMode -ignoreSpare true
setOptMode -maxLength 400
setOptMode -simplifyNetlist false
setOptMode -fixFanoutLoad true
setOptMode -fixGlitch true
setOptMode -usefulSkew false
setPlaceMode -place_global_ignore_scan true
setPlaceMode -place_global_reorder_scan true
setPlaceMode -place_global_clock_gate_aware true
setPlaceMode -place_global_uniform_density true
setPlaceMode -place_global_cong_effort high
setPlaceMode -place_opt_run_global_place full
setLimitedAccessFeature legacy_fects_final_release 1
group_path -name "reg2reg" -from [all_registers] -to [filter_collection [all_registers] "is_integrated_clock_gating_cell != true"]
group_path -name "clkgate" -from [all_registers] -to [filter_collection [all_registers] "is_integrated_clock_gating_cell == true"]
group_path -name in2reg -from [all_inputs -no_clocks] -to [all_registers]
group_path -name reg2out -from [all_registers] -to [all_outputs]
group_path -name in2out -from [all_inputs -no_clocks] -to [all_outputs]
setPathGroupOptions reg2reg -effortLevel high
setPathGroupOptions in2reg -effortLevel high
setPathGroupOptions reg2out -effortLevel high
setPathGroupOptions in2out -effortLevel high
setPathGroupOptions clkgate -slackAdjustment 0
setPathGroupOptions in2reg -slackAdjustment
setPathGroupOptions reg2out -slackAdjustment 0
setPathGroupOptions in2reg -slackAdjustment 0
setPathGroupOptions reg2out -slackAdjustment 0
set_max_delay 14 -from [all_registers -clock_pins] -to [all_outputs]
report_tracks -prefer_only
setOptMode -usefulSkewPreCTS false
place_opt_design
timeDesign -preCTS
timeDesign -preCTS -hold
optDesign -preCTS -hold
setDesignMode -flowEffort standard
saveDesign saved_design/place_opt.inn
all_constraint_modes -active
set_interactive_constraint_modes [all_constraint_modes -active]
current_design
set_max_capacitance 0.1 [current_design]
set_propagated_clock [all_clocks]
reset_clock_uncertainty -from [all_clocks] -to [all_clocks]
set_clock_uncertainty -setup 0.5 [all_clocks]
set_clock_uncertainty -hold 0.07 [all_clocks]
set_max_transition 1.5 -data_path [all_clocks]
set_max_transition 0.75 -clock_path [all_clocks]
set_max_delay 14 -from [all_registers -clock_pins] -to [all_outputs]
setRouteMode -earlyGlobalMaxRouteLayer 5
setPinAssignMode -maxLayer 5
setNanoRouteMode -routeTopRoutingLayer 5
setDesignMode -topRoutingLayer Metal5
setDesignMode -topRoutingLayer 5
current_design
set_max_fanout 20 [current_design]
setMultiCpuUsage -localCpu 4
setvar soceSupportRiseFallPinCap 1
setAnalysisMode -timeBorrowing false
setAnalysisMode -analysisType onChipVariation
setAnalysisMode -cppr both
delete_ccopt_clock_tree_spec
set_ccopt_property buffer_cells {CLKBUFX4 CLKBUFX6 CLKBUFX8 CLKBUFX12}
set_ccopt_property inverter_cells {CLKINX4 CLKINX6 CLKINX8 CLKINX12}
set_ccopt_property force_nanoroute_single_threaded false
set_ccopt_property target_max_trans 0.6 -net_type leaf
set_ccopt_property target_max_trans 0.6 -net_type trunk
set_ccopt_property target_max_trans 0.6 -net_type top
set_ccopt_property target_skew 0.250
set_ccopt_property -use_inverters false
set_ccopt_property target_insertion_delay
set_ccopt_property target_insertion_delay 2
set_ccopt_property source_max_capacitance 2.00
setOptMode -simplifyNetlist false
set_ccopt_property -delay_corner * target_skew -late 0.500
set_ccopt_property -delay_corner * target_skew -early 0.500
set_ccopt_property cts_target_skew 0.250
set_ccopt_property advanced_insertion_delay_optimization true
set_ccopt_property expand_multi_child_regions true
set_ccopt_property low_power_clustering false
set_ccopt_property recluster_to_reduce_power true
set_ccopt_property max_fanout 20
setOptMode -maxLength 500
setOptMode -addInstancePrefix cts
setOptMode -usefulSkew false
set_ccopt_property call_cong_repair_during_final_implementation true
set_ccopt_property add_wire_delay_in_detailed_balancer true
set_ccopt_property fraction_max_wire_to_add 0.5
create_ccopt_clock_tree_spec -file create_ccopt_clock_tree_spec.txt
ccopt_design
timeDesign -postCTS -hold
optDesign -postCTS
optDesign -postCTS -hold
optDesign -postCTS -drv
optDesign -postCTS -drv -hold
optDesign -postCTS -drv
report_ccopt_skew_groups
report_ccopt_skew_groups -summary
report_clocks
set_propagated_clock [all_clocks]
setDelayCalMode -engine AAE -signOff true
setExtractRCMode -engine postRoute -specialNet true
checkDesign -all
saveDesign saved_design/cc_opt.inn
zoomBox -35.66000 1.59650 195.21900 113.51600
fit
zoomBox 5.18950 103.81100 21.32950 85.75950
fit
zoomBox 114.13600 113.79200 102.66750 101.26250
fit
createSpareModule -moduleName spr -cell {BUFX2 1 BUFX3 1 CLKAND2X2 1 CLKBUFX2 1 CLKBUFX3 1 CLKINVX2 1 CLKINVX3 1 INVX2 1 INVX3 1 OAI33X1 1 RDFFRX1 1 XOR2X1 1} -tie {TIEHI TIELO} -useCellAsPrefix
saveDesign saved_design/
saveDesign saved_design/cts.inn
timeDesign -postCTS -drv
timeDesign -postCTS
timeDesign -postCTS -hold
optDesign -postCTS -drv
optDesign -postCTS -hold
optDesign -postCTS
optDesign -postCTS
optDesign -postCTS -hold
optDesign -postCTS
optDesign -postCTS -hold
saveDesign saved_design/post_cts.inn
