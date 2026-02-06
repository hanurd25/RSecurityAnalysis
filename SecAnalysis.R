#install.packages("quantmod")
library(quantmod)

#Error got many times:
#https://stackoverflow.com/questions/54615768/errors-when-using-getsymbols-quantmod-to-predict-stock-price

getSymbols("ALFEN.AS", src = "yahoo")
ALFEN.AS <- na.omit(ALFEN.AS)

# Clean plot state
#dev.off()  # Reset graphics device
#par(mar = c(4,4,2,2))  # Reset to reasonable margins

options(repr.plot.width = 14, repr.plot.height = 8)

chartSeries(ALFEN.AS, theme = chartTheme("black"), TA = "addSMA(n=20,col='blue');addSMA(n=50,col='red')")