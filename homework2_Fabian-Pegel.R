## funktionen, die nicht auf den folien waren, habe ich durch googlen gefunden, meistens auf stackoverflow

> data <- read.csv("rprog_data1.csv")

## Aufgabe 1
> data[1:2,]
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2

## Aufgabe 2
> nrow(data)
[1] 153

## Aufgabe 3
> data[152:153,]
    Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30

## Aufgabe 4
> data[47,"Ozone"]
[1] 21

## Aufgabe 5
> t_ozone <- is.na(data["Ozone"])
> length(which(t_ozone))
[1] 37

## Aufgabe 6
> bad <- is.na(data["Ozone"])
> sum_ozone_data <- sum(data["Ozone"][!bad])
## durchschnittswert anzeigen:
> sum_ozone_data / length(data["Ozone"][!bad])
[1] 42.12931

## Aufgabe 7
> which(data["Ozone"]>31) 
 [1]   1   2  17  24  29  30  31  40  41  48
[11]  62  63  64  66  67  68  69  70  71  77
[21]  78  79  80  81  85  86  88  89  90  91
[31]  92  93  96  97  98  99 100 101 104 106
[41] 109 112 116 117 118 120 121 122 123 124
[51] 125 126 127 128 129 134 139 146
> which(data["Temp"]>90) 
 [1]  42  43  69  70  75 102 120 121 122 123
[11] 124 125 126 127
> y <- which(data["Temp"]>90) 
> x <- which(data["Ozone"]>31) 
> intersect(x,y)
 [1]  69  70 120 121 122 123 124 125 126 127
> teilmenge_fuer_solar <- intersect(x,y)
> teilmenge_fuer_solar
  [1]  69  70 120 121 122 123 124 125 126 127
## solarwerte der teilmenge:
> data[teilmenge_fuer_solar, "Solar.R"]
 [1] 267 272 203 225 237 188 167 197 183 189
## durchschnittswert solarwerte:
> sum(data[teilmenge_fuer_solar, "Solar.R"]) / length(data[teilmenge_fuer_solar, "Solar.R"])
[1] 212.8
 
## Aufgabe 8
> teilmenge_monat6 <- which(data["Month"]==6)
> teilmenge_monat6
 [1] 32 33 34 35 36 37 38 39 40 41 42 43 44 45
[15] 46 47 48 49 50 51 52 53 54 55 56 57 58 59
[29] 60 61
> sum(data[teilmenge_monat6, "Temp"]) / length(teilmenge_monat6)
[1] 79.1

## Aufgabe 9
> teilmenge_monat5 <- which(data["Month"]==5)
> teilmenge_monat5
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14
[15] 15 16 17 18 19 20 21 22 23 24 25 26 27 28
[29] 29 30 31
> bad <- is.na(data[teilmenge_monat5, "Ozone"])
> max(data[teilmenge_monat5, "Ozone"][!bad])
[1] 115

## Aufgabe 10
> na.omit(data[3:9,])
  Ozone Solar.R Wind Temp Month Day
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
7    23     299  8.6   65     5   7
8    19      99 13.8   59     5   8
9     8      19 20.1   61     5   9
