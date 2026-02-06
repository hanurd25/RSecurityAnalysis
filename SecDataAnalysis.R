library(quantmod)

# Your Nasdaq code (unchanged)
Nasdaq100_Symbols <- c('GE','PG','MSFT','AAPL','PFE','AMD','DELL')
stocks <- lapply(Nasdaq100_Symbols, getSymbols, auto.assign = FALSE)
nasdaq100 <- Reduce(merge, stocks)
nasdaq100 <- na.fill(nasdaq100, 0)
outcomeSymbol <- "GE.Volume"
nasdaq100 <- merge(nasdaq100, lm1 = lag(nasdaq100[, outcomeSymbol], -1))
nasdaq100_df <- data.frame(date = index(nasdaq100), coredata(nasdaq100))

# FIXED: Fetch Alfen FIRST, then plot
getSymbols("ALFEN.AS", src = "yahoo")
ALFEN.AS <- na.omit(ALFEN.AS)

# Clean plot state
dev.off()  # Reset graphics device
par(mar = c(4,4,2,2))  # Reset to reasonable margins

options(repr.plot.width = 14, repr.plot.height = 8)

# Method 1: Single chart with SMAs
chartSeries(ALFEN.AS, theme = chartTheme("black"), type = "candlesticks",
            TA = "addSMA(n=20,col='blue');addSMA(n=50,col='red')")

# Method 2: Sequential (safer)
#chartSeries(ALFEN.AS, theme = chartTheme("black"), type = "candlesticks")
#addSMA(n=20, col="blue")
#addSMA(n=50, col="red")
