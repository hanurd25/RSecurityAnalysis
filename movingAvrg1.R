library(quantmod)
library(zoo)  # For rollmean function

getSymbols("ALFEN.AS", src = "yahoo")
ALFEN.AS <- na.omit(ALFEN.AS)

# Calculate rolling means manually
ALFEN.AS$SMA_20 <- rollmean(ALFEN.AS$ALFEN.AS.Close, k = 20, fill = NA, align = "right")
ALFEN.AS$SMA_50 <- rollmean(ALFEN.AS$ALFEN.AS.Close, k = 50, fill = NA, align = "right")

# Plot with chartSeries - you can add lines manually later
chartSeries(ALFEN.AS[,1:6], theme = chartTheme("black"), type = "candlesticks")

# Add the moving averages as lines
addTA(ALFEN.AS$SMA_20, on = 1, col = "blue", lwd = 2)
addTA(ALFEN.AS$SMA_50, on = 1, col = "red", lwd = 2)