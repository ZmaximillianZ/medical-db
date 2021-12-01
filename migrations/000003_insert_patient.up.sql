insert into patient (
    first_name,
    last_name,
    middle_name,
    dob,
    sex,
    has_insurance,
    status,
    created_at
)
select
    (array['Максим', 'Александр', 'Алексей', 'Денис', 'Михаил', 'Иван', 'Григорий', 'Василий', 'Олег', 'Константин', 'Владимир', 'Сергей', 'Анатолий', 'Инокентий', 'Константин', 'Филлип', 'Геннадий', 'Николай', 'Павел', 'Андрей', 'Степан', 'Кирилл '])[floor(random() * 22 + 1)],
    (array[ 'Потапов', 'Журавлев', 'Овчинников', 'Трофимов', 'Леонов', 'Соболев', 'Ермаков', 'Колесников', 'Гончаров', 'Емельянов', 'Никифоров', 'Грачев', 'Котов', 'Гришин', 'Ефремов', 'Архипов', 'Громов', 'Кириллов', 'Малышев', 'Панов', 'Моисеев', 'Румянцев', 'Акимов', 'Кондратьев', 'Бирюков', 'Горбунов', 'Анисимов', 'Еремин', 'Тихомиров', 'Галкин', 'Лукьянов', 'Михеев', 'Скворцов', 'Юдин', 'Белоусов', 'Нестеров', 'Симонов', 'Прокофьев', 'Харитонов', 'Князев', 'Цветков', 'Левин', 'Митрофанов', 'Воронов', 'Аксенов', 'Софронов', 'Мальцев', 'Логинов', 'Горшков', 'Краснов', 'Майоров', 'Демидов', 'Елисеев', 'Рыбаков', 'Сафонов', 'Плотников', 'Демин', 'Фадеев', 'Молчанов', 'Игнатов', 'Литвинов', 'Ершов', 'Ушаков', 'Дементьев', 'Рябов', 'Мухин', 'Калашников', 'Леонтьев', 'Лобанов', 'Кузин', 'Корнеев', 'Евдокимов', 'Бородин', 'Платонов', 'Некрасов', 'Балашов', 'Бобров', 'Жданов', 'Блинов', 'Игнатьев', 'Коротков', 'Муравьев', 'Крюков', 'Беляков', 'Богомолов', 'Дроздов', 'Лавров', 'Зуев', 'Петухов', 'Ларин', 'Никулин', 'Серов', 'Терентьев', 'Зотов', 'Устинов', 'Фокин', 'Самойлов', 'Константинов', 'Сахаров', 'Шишкин', 'Самсонов', 'Черкасов', 'Чистяков', 'Носов', 'Спиридонов', 'Карасев', 'Авдеев', 'Воронцов', 'Зверев', 'Владимиров', 'Селезнев', 'Нечаев', 'Кудряшов', 'Седов', 'Фирсов', 'Андрианов', 'Панин', 'Головин', 'Терехов', 'Ульянов', 'Шестаков', 'Агеев', 'Никонов', 'Селиванов', 'Баженов', 'Гордеев', 'Кожевников', 'Пахомов', 'Зимин', 'Костин', 'Широков', 'Филимонов', 'Ларионов', 'Овсянников', 'Сазонов', 'Суворов', 'Нефедов', 'Корнилов', 'Любимов', 'Львов', 'Горбачев', 'Копылов', 'Лукин', 'Токарев', 'Кулешов', 'Шилов', 'Большаков', 'Панкратов', 'Родин', 'Шаповалов', 'Покровский', 'Бочаров', 'Никольский', 'Маркин', 'Горелов', 'Агафонов', 'Березин', 'Ермолаев', 'Зубков', 'Куприянов', 'Трифонов', 'Масленников', 'Круглов', 'Третьяков', 'Колосов', 'Рожков', 'Артамонов', 'Шмелев', 'Лаптев', 'Лапшин', 'Федосеев', 'Зиновьев', 'Зорин', 'Уткин', 'Столяров', 'Зубов', 'Ткачев', 'Дорофеев', 'Антипов', 'Завьялов', 'Свиридов', 'Золотарев', 'Кулаков', 'Мещеряков', 'Макеев', 'Дьяконов', 'Гуляев', 'Петровский', 'Бондарев', 'Поздняков', 'Панфилов', 'Кочетков', 'Суханов', 'Рыжов', 'Старостин', 'Калмыков', 'Колесов', 'Золотов', 'Кравцов', 'Субботин', 'Шубин', 'Щукин', 'Лосев', 'Винокуров', 'Лапин', 'Парфенов', 'Исаков', 'Голованов', 'Коровин', 'Розанов', 'Артемов', 'Козырев', 'Русаков', 'Алешин', 'Крючков', 'Булгаков', 'Кошелев', 'Сычев', 'Синицын', 'Черных', 'Рогов', 'Кононов', 'Лаврентьев', 'Евсеев', 'Пименов', 'Пантелеев', 'Горячев', 'Аникин', 'Лопатин', 'Рудаков', 'Одинцов', 'Серебряков', 'Панков', 'Дегтярев', 'Орехов', 'Царев', 'Шувалов', 'Кондрашов', 'Горюнов', 'Дубровин', 'Голиков', 'Курочкин', 'Латышев', 'Севастьянов', 'Вавилов', 'Ерофеев', 'Сальников', 'Клюев', 'Носков', 'Озеров', 'Кольцов', 'Комиссаров', 'Меркулов', 'Киреев', 'Хомяков', 'Булатов', 'Ананьев', 'Буров', 'Шапошников', 'Дружинин', 'Островский', 'Шевелев', 'Долгов', 'Суслов', 'Шевцов', 'Пастухов', 'Рубцов', 'Бычков', 'Глебов', 'Ильинский', 'Успенский', 'Дьяков', 'Кочетов', 'Вишневский', 'Высоцкий', 'Глухов', 'Дубов', 'Бессонов', 'Ситников', 'Астафьев', 'Мешков', 'Шаров', 'Яшин', 'Козловский', 'Туманов', 'Басов', 'Корчагин', 'Болдырев', 'Олейников', 'Чумаков', 'Фомичев', 'Губанов', 'Дубинин', 'Шульгин', 'Касаткин', 'Пирогов', 'Семин', 'Трошин', 'Горохов', 'Стариков', 'Щеглов', 'Фетисов', 'Колпаков', 'Чесноков', 'Зыков', 'Верещагин', 'Минаев', 'Руднев', 'Троицкий', 'Окулов', 'Ширяев', 'Малинин', 'Черепанов', 'Измайлов', 'Алехин', 'Зеленин', 'Касьянов', 'Пугачев', 'Павловский', 'Чижов', 'Кондратов', 'Воронков', 'Капустин', 'Сотников', 'Демьянов', 'Косарев', 'Беликов', 'Сухарев', 'Белкин', 'Беспалов', 'Кулагин', 'Савицкий', 'Жаров', 'Хромов', 'Еремеев', 'Карташов', 'Астахов', 'Русанов', 'Сухов', 'Вешняков', 'Волошин', 'Козин', 'Худяков', 'Жилин', 'Малахов', 'Сизов', 'Ежов', 'Толкачев', 'Анохин', 'Вдовин', 'Бабушкин', 'Усов', 'Лыков', 'Горлов', 'Коршунов', 'Маркелов', 'Постников', 'Черный', 'Дорохов', 'Свешников', 'Гущин', 'Калугин', 'Блохин', 'Сурков', 'Кочергин', 'Греков', 'Казанцев', 'Швецов', 'Ермилов', 'Парамонов', 'Агапов', 'Минин', 'Корнев', 'Черняев', 'Гуров', 'Ермолов', 'Сомов', 'Добрынин', 'Барсуков', 'Глушков', 'Чеботарев', 'Москвин', 'Уваров', 'Безруков', 'Муратов', 'Раков', 'Снегирев', 'Гладков', 'Злобин', 'Моргунов', 'Поликарпов', 'Рябинин', 'Судаков', 'Кукушкин', 'Калачев', 'Грибов', 'Елизаров'])[floor(random() * 396 + 1)],
    (array['Александрович','Алексеевич','Анатольевич','Андреевич','Антонович','Аркадьевич','Артемович','Бедросович','Богданович','Борисович','Валентинович','Валерьевич','Васильевич','Викторович','Витальевич','Владимирович','Владиславович','Вольфович','Вячеславович','Геннадиевич','Георгиевич','Григорьевич','Данилович','Денисович','Дмитриевич','Евгеньевич','Егорович','Ефимович','Иванович','Иваныч','Игнатьевич','Игоревич','Ильич','Иосифович','Исаакович','Кириллович','Константинович','Леонидович','Львович','Максимович','Матвеевич','Михайлович','Николаевич','Олегович','Павлович','Палыч','Петрович','Платонович','Робертович','Романович','Саныч','Северинович','Семенович','Сергеевич','Станиславович','Степанович','Тарасович','Тимофеевич','Федорович','Феликсович','Филиппович','Эдуардович','Юрьевич','Яковлевич','Ярославович'])[floor(random() * 64 + 1)],
    (now() - interval '1 year') - '75 years'::interval * random(),
    'мужской',
    (round(random())::int)::boolean,
    (array['нормальное'::patient_status, 'критическое'::patient_status, 'легкое'::patient_status])[floor(random() * 3 + 1)],
    now() - '7 years'::interval * random()
from
    generate_series(1, 5000);

insert into patient (
    first_name,
    last_name,
    middle_name,
    dob,
    sex,
    has_insurance,
    status,
    created_at
)
select
    (array['София', 'Инна', 'Ольга', 'Елизавета', 'Светлана', 'Анна', 'Маргарита', 'Мария', 'Яна', 'Диана', 'Снежана', 'Елена', 'Анастасия', 'Виолетта', 'Кристина', 'Регина', 'Алина', 'Алеся', 'Оксана', 'Ирина', 'Кира', 'Карина '])[floor(random() * 21 + 1)],
    (array['Авдеева', 'Агапова', 'Агафонова', 'Агеева', 'Акимова', 'Аксёнова', 'Александрова', 'Алексеева', 'Алёхина', 'Алешина', 'Алёшина', 'Ананьева', 'Андреева', 'Андрианова', 'Аникина', 'Анисимова', 'Анохина', 'Антипова', 'Антонова', 'Артамонова', 'Артёмова', 'Архипова', 'Астафьева', 'Астахова', 'Афанасьева', 'Бабушкина', 'Баженова', 'Балашова', 'Баранова', 'Барсукова', 'Басова', 'Безрукова', 'Беликова', 'Белкина', 'Белова', 'Белоусова', 'Беляева', 'Белякова', 'Березина', 'Берия', 'Беспалова', 'Бессонова', 'Бирюкова', 'Блинова', 'Блохина', 'Боброва', 'Богданова', 'Богомолова', 'Болдырева', 'Большакова', 'Бондарева', 'Борисова', 'Бородина', 'Бочарова', 'Булатова', 'Булгакова', 'Бурова', 'Быкова', 'Бычкова', 'Вавилова', 'Васильева', 'Вдовина', 'Верещагина', 'Вешнякова', 'Виноградова', 'Винокурова', 'Вишневская', 'Владимирова', 'Власова', 'Волкова', 'Волошина', 'Воробьёва', 'Воронина', 'Воронкова', 'Воронова', 'Воронцова', 'Второва', 'Высоцкая', 'Гаврилова', 'Гайдукова', 'Гакабова', 'Галкина', 'Герасимова', 'Гладкова', 'Глебова', 'Глухова', 'Глушкова', 'Гноева', 'Голикова', 'Голованова', 'Головина', 'Голубева', 'Гончарова', 'Горбань', 'Горбачёва', 'Горбунова', 'Гордеева', 'Горелова', 'Горлова', 'Горохова', 'Горшкова', 'Горюнова', 'Горячева', 'Грачёва', 'Грекова', 'Грибкова', 'Грибова', 'Григорьева', 'Гришина', 'Громова', 'Губанова', 'Гуляева', 'Гурова', 'Гусева', 'Гущина', 'Давыдова', 'Дадаева', 'Дадина', 'Данилова', 'Дарвина', 'Дашкова', 'Дегтярева', 'Дегтярёва', 'Дедова', 'Дементьева', 'Демидова', 'Дёмина', 'Демьянова', 'Денисова', 'Дмитриева', 'Добрынина', 'Долгова', 'Дорофеева', 'Дорохова', 'Дроздова', 'Дружинина', 'Дубинина', 'Дубова', 'Дубровина', 'Дьякова', 'Дьяконова', 'Евдокимова', 'Евсеева', 'Егорова', 'Ежова', 'Елизарова', 'Елисеева', 'Ельцина', 'Емельянова', 'Еремеева', 'Ерёмина', 'Ермакова', 'Ермилова', 'Ермолаева', 'Ермолова', 'Еромлаева', 'Ерофеева', 'Ершова', 'Ефимова', 'Ефремова', 'Жарова', 'Жданова', 'Жилина', 'Жириновская', 'Жукова', 'Журавлёва', 'Завьялова', 'Заец', 'Зайцева', 'Захарова', 'Зверева', 'Звягинцева', 'Зеленина', 'Зимина', 'Зиновьева', 'Злобина', 'Золотарева', 'Золотарёва', 'Золотова', 'Зорина', 'Зотова', 'Зубкова', 'Зубова', 'Зуева', 'Зыкова', 'Зюганова', 'Иванова', 'Ивашова', 'Игнатова', 'Игнатьева', 'Измайлова', 'Ильина', 'Ильинская', 'Ильюхина', 'Исаева', 'Исакова', 'Казакова', 'Казанцева', 'Калачева', 'Калачёва', 'Калашникова', 'Калинина', 'Калмыкова', 'Калугина', 'Капустина', 'Карасева', 'Карасёва', 'Карпова', 'Карташова', 'Касаткина', 'Касьянова', 'Киреева', 'Кириллова', 'Киселёва', 'Кислова', 'Климова', 'Клюева', 'Князева', 'Ковалёва', 'Коваленко', 'Коваль', 'Кожевникова', 'Козина', 'Козлова', 'Козловская', 'Козырева', 'Колесникова', 'Колесова', 'Колосова', 'Колпакова', 'Кольцова', 'Комарова', 'Комиссарова', 'Кондратова', 'Кондратьева', 'Кондрашова', 'Коновалова', 'Кононова', 'Константинова', 'Копылова', 'Корнева', 'Корнеева', 'Корнилова', 'Коровина', 'Королёва', 'Королькова', 'Короткова', 'Корчагина', 'Коршунова', 'Косарева', 'Костина', 'Котова', 'Кочергина', 'Кочеткова', 'Кочетова', 'Кошелева', 'Кравцова', 'Краснова', 'Красоткина', 'Круглова', 'Крылова', 'Крюкова', 'Крючкова', 'Кудрявцева', 'Кудряшова', 'Кузина', 'Кузнецова', 'Кузьмина', 'Кукушкина', 'Кулагина', 'Кулакова', 'Кулешова', 'Куликова', 'Куприянова', 'Курочкина', 'Лаврентьева', 'Лаврова', 'Лазарева', 'Лапина', 'Лаптева', 'Ларина', 'Ларионова', 'Латышева', 'Лебедева', 'Левина', 'Леонова', 'Леонтьева', 'Литвинова', 'Лобанова', 'Лопатина', 'Лосева', 'Лужкова', 'Лукина', 'Лукьянова', 'Лыкова', 'Любимова', 'Майорова', 'Макарова', 'Макеева', 'Максимова', 'Малахова', 'Малинина', 'Малофеева', 'Малышева', 'Мальцева', 'Маркелова', 'Маркина', 'Маркова', 'Мартынова', 'Масленникова', 'Маслова', 'Матвеева', 'Матвиенко', 'Медведева', 'Медейко', 'Мельникова', 'Меньшова', 'Меркулова', 'Мешкова', 'Мещерякова', 'Минаева', 'Минина', 'Миронова', 'Митрофанова', 'Михайлова', 'Михеева', 'Мишустина', 'Моисеева', 'Молчанова', 'Моргунова', 'Москвина', 'Муравьёва', 'Муратова', 'Муромцева', 'Мухина', 'Мясникова', 'Навальная', 'Назарова', 'Наумова', 'Некрасова', 'Нестерова', 'Нефёдова', 'Нечаева', 'Никитина', 'Никифорова', 'Николаева', 'Никольская', 'Никонова', 'Никулина', 'Новикова', 'Новодворская', 'Носкова', 'Носова', 'Овсянникова', 'Овчинникова', 'Одинцова', 'Озерова', 'Окулова', 'Олейникова', 'Орехова', 'Орлова', 'Осипова', 'Островская', 'Павлова', 'Павловская', 'Панина', 'Панкова', 'Панкратова', 'Панова', 'Пантелеева', 'Панфилова', 'Парамонова', 'Парфёнова', 'Пастухова', 'Пахомова', 'Пекарева', 'Петрова', 'Петровская', 'Петухова', 'Пименова', 'Пирогова', 'Платонова', 'Плотникова', 'Позднякова', 'Покровская', 'Поликарпова', 'Полякова', 'Попова', 'Порошина', 'Порывай', 'Постникова', 'Потапова', 'Похлёбкина', 'Прокофьева', 'Прохорова', 'Прошина', 'Пугачёва', 'Путина', 'Ракова', 'Рогова', 'Родина', 'Родионова', 'Рожкова', 'Розанова', 'Романова', 'Рублёва', 'Рубцова', 'Рудакова', 'Руднева', 'Румянцева', 'Русакова', 'Русанова', 'Рыбакова', 'Рыжикова', 'Рыжкова', 'Рыжова', 'Рябинина', 'Рябова', 'Савельева', 'Савина', 'Савицкая', 'Сазонова', 'Сальникова', 'Самойлова', 'Самсонова', 'Сафонова', 'Сахарова', 'Светличная', 'Светлова', 'Свешникова', 'Свиридова', 'Севастьянова', 'Седова', 'Селезнёва', 'Селиванова', 'Семёнова', 'Сёмина', 'Сергеева', 'Серебрякова', 'Серова', 'Сидорова', 'Сизова', 'Симонова', 'Синицына', 'Ситникова', 'Скворцова', 'Скрябина', 'Смирнова', 'Снегирёва', 'Соболева', 'Собянина', 'Соколова', 'Соловьёва', 'Сомова', 'Сорокина', 'Сотникова', 'Софронова', 'Спиридонова', 'Старикова', 'Старостина', 'Степанова', 'Столярова', 'Стрелкова', 'Стрельникова', 'Строева', 'Суворова', 'Судакова', 'Суркова', 'Суслова', 'Суханова', 'Сухарева', 'Сухова', 'Сычёва', 'Тарасова', 'Терентьева', 'Терехова', 'Тимофеева', 'Титова', 'Тихомирова', 'Тихонова', 'Ткачёва', 'Токарева', 'Толкачёва', 'Торшина', 'Третьякова', 'Трифонова', 'Троицкая', 'Трофимова', 'Троцкая', 'Трошина', 'Туманова', 'Уварова', 'Ульянова', 'Усова', 'Успенская', 'Устинова', 'Уткина', 'Ушакова', 'Фадеева', 'Фёдорова', 'Федосеева', 'Федосова', 'Федотова', 'Фетисова', 'Филатова', 'Филимонова'])[floor(random() * 505 + 1)],
    (array[ 'Александровна', 'Алексеевна', 'Анатольевна', 'Андреевна', 'Антоновна', 'Аркадьевна', 'Артемовна', 'Богдановна', 'Борисовна', 'Валентиновна', 'Валерьевна', 'Васильевна', 'Викторовна', 'Виталиевна', 'Владимировна', 'Владиславовна', 'Вячеславовна', 'Геннадиевна', 'Георгиевна', 'Григорьевна', 'Даниловна', 'Денисовна', 'Дмитриевна', 'Евгеньевна', 'Егоровна', 'Ефимовна', 'Ивановна', 'Игоревна', 'Ильинична', 'Иосифовна', 'Кирилловна', 'Константиновна', 'Леонидовна', 'Львовна', 'Максимовна', 'Матвеевна', 'Михайловна', 'Николаевна', 'Олеговна', 'Павловна', 'Петровна', 'Платоновна', 'Робертовна', 'Романовна', 'Семеновна', 'Сергеевна', 'Станиславовна', 'Степановна', 'Тарасовна', 'Тимофеевна', 'Федоровна', 'Феликсовна', 'Филипповна', 'Эдуардовна', 'Юрьевна', 'Яковлевна', 'Ярославовна'])[floor(random() * 56 + 1)],
    (now() - interval '1 year') - '75 years'::interval * random(),
    'женский',
    (round(random())::int)::boolean,
    (array['нормальное'::patient_status, 'критическое'::patient_status, 'легкое'::patient_status])[floor(random() * 3 + 1)],
    now() - '7 years'::interval * random()
from
    generate_series(1, 5000);
