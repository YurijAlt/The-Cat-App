# The-Cat-App
STM test task. Parsing JSON with a free API and displaying data in a СollectionView+saving to CoreData

![The-Cat-App](https://i.ibb.co/fqqHJ3v/The-Cat-App.png "The-Cat-App")

## Стек технологий: 
UIKit, UICollectionView, UINavigationBar, UITabBarController, CoreData, JSON, API, GCD.
## О приложении:
В данном приложении реализована загрузка 20 рандомных изображений котиков путем парсинга JSON с публичного API с помощью URLSession, отображение котиков в UICollectionView.
Реализован экран детальной информации, на котором есть кнопка LIKE❤️, позволяющая добавить данного котика на экран избранного, а так же кнопка скачивания в галерею iPhone.
Сохранение выбранного котика происходит в CoreData. Так же на экране с сохраненными котиками есть возможность снова открыть детальный экран и путем нажатия на кнопку DISLIKE💔 убрать котика из избранного.
Упралавление потоками с помощью GCD DispatchQueue без блокирования интерфейса.
