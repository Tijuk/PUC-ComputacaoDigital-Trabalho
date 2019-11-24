
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name trabalho -dir "/home/ropumar/Documents/PUC-ComputacaoDigital-Trabalho/planAhead_run_2" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ropumar/Documents/PUC-ComputacaoDigital-Trabalho/CPU.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ropumar/Documents/PUC-ComputacaoDigital-Trabalho} }
set_property target_constrs_file "constraints.ucf" [current_fileset -constrset]
add_files [list {constraints.ucf}] -fileset [get_property constrset [current_run]]
link_design
