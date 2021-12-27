# The-Cat-App
STM test task. Parsing JSON with a free API and displaying data in a СollectionView+saving to CoreData

![The-Cat-App](https://lh3.googleusercontent.com/D7etvTNKrwLVFSuriBmphRFuf5IXkDVRckTsK9VJKxk4MC4fS81bBGdKzIX4YE3dPoXlJL9XVSl-J8niGG7SKHfGsW6msf4pD0BMbwTMnIDgILFknHeE6dpGsdkgeWI1uucBHw_fbHpjCJaFQMjRxuXtCBv1ufnIo4SFKZaaJ916su7NS3bgbfzLubkDgn4GjCHqIR9NizCJLoKadAGNqToZhL_ZCNqrwC8BTxdd0o779TzG2mbDwbQzq6NXbmm5ku0RmPA87_KmOM2y_nosI1kEcD0pz6-NEXjbcLnUnDdCxGI337QonHKjShoLSOR67R1STQpO6tWAhAxDJWMWUYOfmQeUeUbJvdxbTRBlYtAGcE7MeJ7oZncsiRQYOwRkNCEavUhiX8XXZ2g93RWAOFiL-sKclNpQFRtAJ3QF8_bati--oRCawb_ZXabM7JeK7b2XLx-47eXcWblUSZ45yuOBAe_1q5NNGSj1_zrneSa0UMpgxe_XAnJAfi7YUNA05HI1-NWbUeQ04to6EkZR_HSClIEugUUin2ae5OKdPiQSvwweooB1-_ofVcfr8Y5MCK5IOemcAvmD15_DxRc8yK4ufWxp6D7t6ETLqg4GNKABKl0T-c6Bdy0KSMSRMBUPLgH4B38EutzaUOVvlsHPRiifTYqRYNWw33vvLFA8qATp6pV6f7-eUx_9WsQaQ6JJfhE8ZbleHZ37vlkIwR-QCR0=w2648-h912-no?authuser=0 "The-Cat-App")

## Стек технологий: 
UIKit, UICollectionView, UINavigationBar, UITabBarController, CoreData, JSON, API, GCD.
## О приложении:
В данном приложении реализована загрузка 20 рандомных изображений котиков путем парсинга JSON с публичного API с помощью URLSession, отображение котиков в UICollectionView.
Реализован экран детальной информации, на котором есть кнопка LIKE❤️, позволяющая добавить данного котика на экран избранного, а так же кнопка скачивания в галерею iPhone.
Сохранение выбранного котика происходит в CoreData. Так же на экране с сохраненными котиками есть возможность снова открыть детальный экран и путем нажатия на кнопку DISLIKE💔 убрать котика из избранного.
Упралавление потоками с помощью GCD DispatchQueue без блокирования интерфейса.
