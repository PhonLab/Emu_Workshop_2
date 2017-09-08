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

test_DB <- load_emuDB(file.path(databasepath), verbose = TRUE)
summary(test_DB)
serve(emuDBhandle = test_DB)

# file.edit("~/Dropbox/Projects/Emu_Workshop_2/TestDB_emuDB/BGW_AE_S_2006_DBconfig.json") # Change the fm to FORMANTS and add in some of the Emuconfig options
# file.edit("~~/Dropbox/Projects/Emu_Workshop_2/TestDB_emuDB/BGW_AE_S_2006_DBconfig.json") # Change the fm to FORMANTS and add in some of the Emuconfig options

file.edit("~/Dropbox/Projects/Emu_Workshop_2/TestDB_emuDB/BGW_AE_N_2006_DBconfig.json")

#### In the *._DBconfig.json file that opens for editing, change the following lines #####
#### @ line 11
# {
#   "name": "FORMANTS",
#   "columnName": "fm",
#   "fileExtension": "fms"
# },


## @ line 481

# "EMUwebAppConfig": {
#   "perspectives": [
#     {
#       "name": "default",
#       "signalCanvases": {
#         "order": [
#           "OSCI",
#           "SPEC"
#           ],
#         "assign": [
#           {
#             "signalCanvasName": "SPEC",
#             "ssffTrackName": "FORMANTS"
#           }
#           ],
#         "contourLims": [
#           {
#             "ssffTrackName": "FORMANTS",
#             "minContourIdx": 0,
#             "maxContourIdx": 2
#           }
#           ],
#         "contourColors": [{
#           "ssffTrackName": "FORMANTS",
#           "colors": ["rgb(17,87,209)", "rgb(209,139,17)", "rgb(209,17,183)"]
#         }]
#       },
#       "levelCanvases": {
#         "order": [
#           "etic",
#           "qual"
#           ]
#       },
#       "twoDimCanvases": {
#         "order": []
#       }
#     },
