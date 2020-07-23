library(quantmod)
library(ecoseries)
library(twitteR)

getSymbols('CPIAUCSL', src = "FRED")
 
cpi.eua = window(ts(CPIAUCSL, start=c(1947,01), freq=12),
start=c(1994,07))
 
ipca = window(ts(series_ipeadata('36482', 
periodicity = 'M')$serie_36482$valor,
start=c(1979,12), freq=12), start=c(1994,07))

cpi.acc = ((tail(cpi.eua,1)/head(cpi.eua,1)-1)*100)
ipca.acc = ((tail(ipca,1)/head(ipca,1)-1)*100)

dolarJusto = ipca.acc/cpi.acc

dolarformatado = format(round(dolarJusto, 2), nsmall = 2)

consumerKey='sM99fQzpIkKhtbJX8Nv1rqtIC'
consumerSecret='HCpyADz6LdKfQ9ntHwmJzO6eL9VqxUQ9KenUOcebyRSTSu4ve6'
accessToken='1279514630923091968-dLWxZ3RupVgqUPGEBUOA87icQFUoNV'
accessTokenSecret='rzG9MrSFe2oGQyTnfXOIcNkqS0FOcaHkFj3DnyUFfPZll'

setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)

postar <- function() {
tweet(paste('Hoje, o valor justo do dolar é R$', dolarformatado, sep = ""))
}

postar()