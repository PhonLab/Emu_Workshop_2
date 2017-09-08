#### HS 20170908
require(emuR)
databasepath = "~/Dropbox/Projects/Emu_Workshop_2/TestDB_emuDB"

test_DB <- load_emuDB(paste0(databasepath), verbose = TRUE)
serve(test_DB, autoOpenURL = NULL)
list_ssffTrackDefinitions(test_DB)
remove_ssffTrackDefinition(test_DB,"F0")
require(wrassp)

F0.params <- formals(wrassp::ksvF0)
F0.params$gender <- "f"

add_ssffTrackDefinition(emuDBhandle = test_DB, name = "F0", onTheFlyFunctionName = "ksvF0", onTheFlyParams = F0.params)

# reload database
#BGW_AE_S_2007 <- load.emuDB(databasepath, verbose = TRUE)
# purge_emuDB(dbName = "BGW_AE_N_2006")
list_perspectives(test_DB)
# remove_perspective(emuDBhandle = test_DB,
# 									 name = "Pitch")

add_perspective(emuDBhandle = test_DB,
								name = "Pitch")

set_signalCanvasesOrder(emuDBhandle = test_DB,
												perspectiveName = "Pitch",
												order = c("OSCI","SPEC","F0"))

set_levelCanvasesOrder(emuDBhandle = test_DB,
											 perspectiveName = "Pitch",
											 order = c("etic"))

serve(emuDBhandle = test_DB)

# serve(emuDBhandle = test_DB, autoOpenURL = NULL)

# test_DB <- load_emuDB(file.path(databasepath), verbose = TRUE)
# summary(test_DB)

