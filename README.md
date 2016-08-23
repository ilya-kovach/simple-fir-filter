# simple-fir-filter
Проект сделан на базе платы marsohod2 (http://marsohod.org/howtostart/marsohod2)
Коэффициенты фильтра были найдены на сайте t-filter.engineerjs.com, а входные данные для фильтра получены в программе Audaсity.

Общий вид установки:
![Иллюстрация к проекту](https://github.com/ilya-kovach/simple-fir-filter/raw/master/pictures/plata.jpg)

АЧХ фильтра:
![Иллюстрация к проекту](https://github.com/ilya-kovach/simple-fir-filter/raw/master/pictures/coef.PNG)

Исходя из нашей АЧХ выбираем частоту 2КГц
![Иллюстрация к проекту](https://github.com/ilya-kovach/simple-fir-filter/raw/master/pictures/audasity.PNG)

Общий вид схемы:
![Иллюстрация к проекту](https://github.com/ilya-kovach/simple-fir-filter/raw/master/pictures/shema.PNG)
В схеме находятся 2 фильтра: фильтр на Verilog(fir_filter_verilog) и фильтр в виде схемы(my_fir):
![Иллюстрация к проекту](https://github.com/ilya-kovach/simple-fir-filter/raw/master/pictures/firfilter.PNG)

ADC_D - входной сигнал
result и fir_out - выходные сигналы, прошедшие фильтр my_fir и fir_filter_verilog соответственно.
![Иллюстрация к проекту](https://github.com/ilya-kovach/simple-fir-filter/raw/master/pictures/signal-tap.PNG)

В итоге мы видим, что наши фильтры фильтруют входной сигнал одинаково.
