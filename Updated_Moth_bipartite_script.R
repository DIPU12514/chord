####################################################################################
# Written by - Rajesh Lenka (rlenka85@gmail.com)
# Senior Project Fellow, Zoological Survey of India, Kolkata
# Date - 8-Sep-2020 | Last updated - 8-Sep-2020
# Description - This script helps calulate bipartite model, 
# and with different helps plots associated. 
#
# "Untamed wild, save wildlife and save our world."
#####################################################################################

# First install the bipartite package
# If R-studio/R don't have this than install the "bipartite" packages
install.packages("bipartite")

# The package need to be loaded into R after installing 
# Or else it wont able to find the functions.
library("bipartite")

# Import the csv file with header and fist column as row into R
Total2 <- read.csv("Total Moth Flower Web.csv", header = TRUE, row.names = 1, check.names = FALSE)

# Check if the content of file has successfully uploaded or not.
View(Total2) 

# For a combined plot, All text range will stay at 3 only.
par(font = 3)

# This is the function used for plotting ecological networks.
# Once you run this, it this shows Error in plotweb(Total2) : could not find function "plotweb"
# This means you have not installed the bipartite package. 
# So make sure you install the package - install.packages("bipartite") before calling plotweb() function
plotweb(Total2)

# Use various arguments of plot web to set whatever you want to e.g.
# colour of lower boxes, colour of interaction, box colour.
# generally the colors remain black and grey but you can change this using various arguments of plotweb()
plotweb(Total2, method = "normal", text.rot = 90, arrow = "down.center", col.interaction = "grey",  y.lim = c(-1, 2.5), labsize = 1.5)
plotweb(sortweb(Total2, sort.order="dec", sequence = seq.higher), method="normal", text.rot = 90, arrow = "down.center", col.interaction = "black",  y.lim = c(-1, 2.5), labsize = 3)

# It works in the same way as the plotweb function. You can set all the parameters using various arguments.
visweb(Total2)
visweb(Total2, type="diagonal", square="compartment", labsize=3, text="none", frame=TRUE)
visweb(Total2, type="nested", text="compartment")
visweb(Total2, circles=TRUE,  boxes=FALSE,  labsize=1, circle.max=2, text="no")

# The function networklevel() will calculate connectance, asymmetry, nestedness, 
# fisher's alpha, diversity indexes etc. in a pollination network and assign into r1
r1 <- networklevel(Total2)

# To view r1 table
View(r1)

# To save the table into a file 
write.table(r1, "r1.txt")

# The fucntion specieslevel() will calculate PDI
r2 <- specieslevel(Total2)

# To view r2 table of each species
View(r2$`lower level`)

# To export the table to a file
write.table(r2$`lower level`, "r2.txt")

# This function computeModules() does __________ Note: Check help menu of this function and write what is does
TOTres <- computeModules(Total2)

# It will plot the computeModules function in a graphical format
plotModuleWeb(TOTres)

# It will calculate the nestedness contribution. 
# Most time taking process of modeling be patient.
nestedcontribution(Total2)

# null.t.test() will be run based on data derived from previous step - nestedcontribution().
#as the nested contribution will give species wise nestedness contribution table in console.
null.t.test(Total2, index = c("generality", "vulnerability", "cluster coefficient", "H2", "ISA", "SA"), nrep = 2, N = 10)

# To construct graph of cumulative distribution vs. number of links
degreedistr(Total2)

